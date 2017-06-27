<%--
  Created by IntelliJ IDEA.
  User: songyexiang
  Date: 2017/5/30
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../css1/lib/html5.js"></script>
    <script type="text/javascript" src="../../css1/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title></title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a href="first.do" class="maincolor">首页</a>
    <span class="c-gray en">&gt;</span>
    发票管理
    <span class="c-gray en">&gt;</span>
    查询发票
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="Hui-article">
    <article class="cl pd-20">
        <div class="text-c">
				<span class="select-box inline">
				<select name="category" id="category" class="select">
					<option value="">发票类型</option>
					<option value="0">进项发票</option>
					<option value="1">销项发票</option>
				</select>
				</span>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="invoiceCode" id="invoiceCode" placeholder="发票编码" style="width:125px" class="input-text">     	&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="invoiceId" id="invoiceId" placeholder="No." style="width:125px" class="input-text">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="companyName" id="companyName" placeholder="公司名称" style="width:125px" class="input-text">&nbsp;&nbsp;&nbsp;&nbsp;
            日期范围：
            <input type="text" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="startDate" name="startDate" class="input-text Wdate" style="width:120px;">
            -
            <input type="text" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="endDate" name="endDate" class="input-text Wdate" style="width:120px;">&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/search.do">查询</a>
        </div>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
				<a href="javascript:;" onClick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
				<a class="btn btn-primary radius" data-title="添加发票" _href="article-add.html" onClick="article_add('添加发票','article-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加发票</a>
				</span>
            <span class="r">共有数据：<strong>54</strong> 条</span>
        </div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="80">编码</th>
                    <th width="80">No.</th>
                    <th width="80">公司名称</th>
                    <th width="80">电话</th>
                    <th width="120">开票日期</th>
                    <th width="100">金额</th>
                    <th width="100">税额</th>
                    <th width="60">发票类型</th>
                    <th width="">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${invoice_list1}" var="invoices" varStatus="stat">
                    <tr class="text-c">
                        <td><input type="checkbox" value="" name=""></td>
                        <td>${invoices.invoiceCode }</td>
                        <td>${invoices.invoiceId }</td>
                        <td>${invoices.companyName }</td>
                        <td>${invoices.tel }</td>
                        <td>${invoices.datetime }</td>
                        <td>${invoices.price }</td>
                        <td>${invoices.tax }</td>
                        <td><c:choose>
                            <c:when test="${invoices.category == 0 }">进项发票</c:when>
                            <c:otherwise>销项发票</c:otherwise>
                        </c:choose>
                        </td>
                        <td>
                            <a href= "#" class="menu-first collapsed" onclick="changepage('updateInvoice.jsp')">
                                <img title="修改" src="../../images/update.gif"/></a>
                            <a href="/remove.do?invoiceCode=${invoices.invoiceCode }&invoiceId=${invoices.invoiceId }">
                                <img title="删除" src="../../images/delete.gif"/></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </article>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../../css1/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../css1/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../css1/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="../../css1/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../../css1/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../../css1/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../css1/lib/laypage/1.2/laypage.js"></script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
