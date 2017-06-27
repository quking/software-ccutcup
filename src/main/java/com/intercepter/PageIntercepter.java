package com.intercepter;

/**
 * Created by songyexiang on 2017/5/26.
 */

import org.apache.ibatis.mapping.BoundSql;

        import java.sql.Connection;
        import java.sql.PreparedStatement;
        import java.sql.ResultSet;
        import java.sql.SQLException;
        import java.util.List;
        import java.util.Properties;

        import org.apache.ibatis.mapping.BoundSql;
        import org.apache.ibatis.mapping.MappedStatement;
        import org.apache.ibatis.mapping.ParameterMapping;
        import org.apache.ibatis.mapping.ParameterMode;
        import org.apache.ibatis.mapping.SqlSource;
        import org.apache.ibatis.plugin.Interceptor;
        import org.apache.ibatis.plugin.Intercepts;
        import org.apache.ibatis.plugin.Invocation;
        import org.apache.ibatis.plugin.Plugin;
        import org.apache.ibatis.reflection.MetaObject;
        import org.apache.ibatis.session.Configuration;
        import org.apache.ibatis.session.RowBounds;
        import org.apache.ibatis.type.TypeHandler;
        import org.apache.ibatis.type.TypeHandlerRegistry;

        import com.pojo.PageObject;

@Intercepts({@org.apache.ibatis.plugin.Signature(method="query", type=org.apache.ibatis.executor.Executor.class, args={MappedStatement.class, Object.class, RowBounds.class, org.apache.ibatis.session.ResultHandler.class})})
public class PageIntercepter implements Interceptor{


    public Object intercept(Invocation invocation) throws Throwable {
        MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
        Object object = invocation.getArgs()[1];
        if(object instanceof PageObject){

            PageObject pageObject = (PageObject) object;
            BoundSql boundSql = mappedStatement.getBoundSql(object);
            String sql = boundSql.getSql();

            int count = getCount(mappedStatement,boundSql);
            pageObject.setCount(count);
            int pages = (pageObject.getCount()+pageObject.getNumber()-1)/pageObject.getNumber();
            pageObject.setPages(pages>0?pages:1);

            int offset = (pageObject.getPage() - 1) * pageObject.getNumber();
            int limit = pageObject.getNumber();
            String pageSql = pageSql(sql, offset, limit);
            BoundSql pageBoundSql = new BoundSql(mappedStatement.getConfiguration(), pageSql, boundSql.getParameterMappings(), boundSql.getParameterObject());
            MappedStatement pageMappedStatement = pageMappedStatement(mappedStatement, new PageSqlSource(pageBoundSql));
            invocation.getArgs()[0] = pageMappedStatement;
            invocation.getArgs()[2] = RowBounds.DEFAULT;
        }
        return invocation.proceed();
    }


    public Object plugin(Object object) {
        // TODO Auto-generated method stub
        return Plugin.wrap(object, this);
    }


    public void setProperties(Properties properties) {
        // TODO Auto-generated method stub

    }

    private int getCount(MappedStatement mappedStatement, BoundSql boundSql) throws SQLException {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String countSql = countSql(boundSql.getSql());
            connection = mappedStatement.getConfiguration().getEnvironment().getDataSource().getConnection();
            ps = connection.prepareStatement(countSql);
            BoundSql countBoundSql = new BoundSql(mappedStatement.getConfiguration(), countSql, boundSql.getParameterMappings(), boundSql.getParameterObject());
            setCountParameters(ps, mappedStatement, countBoundSql);
            rs = ps.executeQuery();
            int count = 0;
            if (rs.next())
            {
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception e) {
            return 1000;
        }finally{
            try {
                rs.close();
            } catch (Exception localException4) {
            }
            try {
                ps.close();
            } catch (Exception localException5) {
            }
            try {
                connection.close();
            }
            catch (Exception localException6) {
            }
        }
    }

    private static String countSql(String sql){
        sql = sql.toUpperCase();
        StringBuffer countSql = new StringBuffer();
        countSql.append("SELECT COUNT(1) FROM (");
        countSql.append(sql.substring(0, sql.indexOf("ORDER BY")==-1?sql.length():sql.indexOf("ORDER BY")-1));
        countSql.append(") PAY_PAGE_T");
        return countSql.toString();
    }

    private static void setCountParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql) throws SQLException {
        List<ParameterMapping> parameterMappingList = boundSql.getParameterMappings();
        if (parameterMappingList != null)
        {
            Configuration configuration = mappedStatement.getConfiguration();
            TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
            Object parameterObject = boundSql.getParameterObject();
            MetaObject metaObject = parameterObject == null ? null : configuration.newMetaObject(parameterObject);

            int n = 1;
            for (ParameterMapping parameterMapping : parameterMappingList)
            {
                if ((parameterMapping.getMode() == ParameterMode.IN) || (parameterMapping.getMode() == ParameterMode.INOUT))
                {
                    String property = parameterMapping.getProperty();
                    Object value = null;
                    if (parameterObject != null)
                    {
                        if (typeHandlerRegistry.hasTypeHandler(parameterObject.getClass()))
                        {
                            value = parameterObject;
                        }
                        else
                        {
                            value = metaObject == null ? null : metaObject.getValue(property);
                        }
                    }

                    TypeHandler typeHandler = parameterMapping.getTypeHandler();
                    typeHandler.setParameter(ps, n, value, parameterMapping.getJdbcType());
                }

                n++;
            }
        }
    }

    private String pageSql(String sql, int offset, int limit) {
        sql = sql.toUpperCase();
        StringBuffer pageSql = new StringBuffer();
        pageSql.append(sql);
        pageSql.append(" LIMIT ");
        pageSql.append(offset);
        pageSql.append(", ");
        pageSql.append(limit);
        return pageSql.toString();
    }

    private MappedStatement pageMappedStatement(MappedStatement mappedStatement, SqlSource sqlSource)
    {
        MappedStatement.Builder builder = new MappedStatement.Builder(
                mappedStatement.getConfiguration(),
                mappedStatement.getId(),
                sqlSource,
                mappedStatement.getSqlCommandType());

        builder.resource(mappedStatement.getResource());
        builder.fetchSize(mappedStatement.getFetchSize());
        builder.statementType(mappedStatement.getStatementType());
        builder.keyGenerator(mappedStatement.getKeyGenerator());
        builder.timeout(mappedStatement.getTimeout());
        builder.parameterMap(mappedStatement.getParameterMap());
        builder.resultMaps(mappedStatement.getResultMaps());
        builder.cache(mappedStatement.getCache());
        builder.resultSetType(mappedStatement.getResultSetType());
        builder.flushCacheRequired(mappedStatement.isFlushCacheRequired());
        builder.useCache(mappedStatement.isUseCache());
        builder.resultOrdered(mappedStatement.isResultOrdered());
        builder.databaseId(mappedStatement.getDatabaseId());
        builder.lang(mappedStatement.getLang());
        if (mappedStatement.getKeyProperties() != null)
        {
            for (String keyProperty : mappedStatement.getKeyProperties())
            {
                builder.keyProperty(keyProperty);
            }
        }
        if (mappedStatement.getKeyColumns() != null)
        {
            for (String keyColumn : mappedStatement.getKeyColumns())
            {
                builder.keyColumn(keyColumn);
            }
        }

        return builder.build();
    }

    public static class PageSqlSource implements SqlSource {
        private BoundSql boundSql;

        public PageSqlSource(BoundSql boundSql) {
            this.boundSql = boundSql;
        }

        public BoundSql getBoundSql(Object parameterObject)
        {
            return this.boundSql;
        }
    }

}
