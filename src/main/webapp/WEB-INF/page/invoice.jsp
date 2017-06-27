<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: songyexiang
  Date: 2017/5/2
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <title>发票查询</title>
    <style>
        a{ text-decoration:none}
        .ep-pages{padding:10px 12px;clear:both;text-align:center;
            font-family:Arial, "\5B8B\4F53", sans-serif;font-size:14px;vertical-align:top}
        .ep-pages a, .ep-pages span{display:inline-block;height:23px;line-height:23px;padding:0 8px;
            margin:5px 1px 0 0;background:#fff;border:1px solid #e5e5e5;overflow:hidden;vertical-align:top}
        .ep-pages a:hover{background:#cc1b1b;border:1px solid #cc1b1b;text-decoration:none}
        .ep-pages a, .ep-pages a:visited{color:#252525}
        .ep-pages a:hover, .ep-pages a:active{color:#ffffff}
        .ep-pages .current{background:#007799;border:1px solid #CCEEFF;color:#CCEEFF}
        .ep-pages a.current, .ep-pages a.current:visited{color:#ffffff}
        .ep-pages a.current:hover, .ep-pages a.current:active{color:#ffffff}
        .ep-pages-ctrl{font-family:"\5B8B\4F53", sans-serif;font-weight:bold;font-size:16px}
        .ep-pages-e5e5e5{color:#e5e5e5}
        .ep-pages-all{font-size:12px;vertical-align:top}

    </style>
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
        <form action="/search.do" method="post" >
        <div class="text-c">
				<span class="select-box inline">
				<select name="category" id="category" class="select">
					<option value="2">发票类型</option>
					<option value="0">进项发票</option>
					<option value="1">销项发票</option>
				</select>
				</span>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="invoiceCode" id="invoiceCode" placeholder="发票编码" style="width:125px" class="input-text">     	&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="invoiceId" id="invoiceId" placeholder="No." style="width:125px" class="input-text">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="companyName" id="companyName" placeholder="公司名称" style="width:125px" class="input-text">&nbsp;&nbsp;&nbsp;&nbsp;
            日期范围：
            <input type="text" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" name="startDate" class="input-text Wdate" style="width:120px;">
            -
            <input type="text" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" name="endDate" class="input-text Wdate" style="width:120px;">&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
        </div>
            </form>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
				<a href="javascript:;" onClick="deleSeltedRecords()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
				<a class="btn btn-primary radius" data-title="添加发票" href="addInvoice.do" onClick="article_add('添加发票','article-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加发票</a>
				</span>
            <span class="r">共有数据：<strong>${page.total}</strong> 条</span>
        </div>
        <div class="">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" id="ckb" value="checkAll" onclick="seltAll()"></th>
                    <th width="60">发票类型</th>
                    <th width="80">编码</th>
                    <th width="80">No.</th>
                    <th width="80">公司名称</th>
                    <th width="80">联系电话</th>
                    <th width="">商品名称</th>
                    <th width="80">商品单价</th>
                    <th width="100">数量</th>
                    <th width="100">总价</th>
                    <th width="35">税率</th>
                    <th width="80">税额</th>
                    <th width="90">开票日期</th>
                    <th width="60">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${invoice_list}" var="invoices" varStatus="stat">
                    <tr class="text-c">
                        <td><input type="checkbox"  id="box_${stat.index}" name="chckBox" value="${invoices.inid}"></td>
                        <td><c:choose>
                            <c:when test="${invoices.category == 0 }">进项发票</c:when>
                            <c:otherwise>销项发票</c:otherwise>
                            </c:choose>
                        <td>${invoices.invoiceCode }</td>
                        <td>${invoices.invoiceId }</td>
                        <td>${invoices.companyName }</td>
                        <td>${invoices.tel }</td>
                        <td>${invoices.goodName }</td>
                        <td>${invoices.unitPrice }</td>
                        <td>${invoices.amount }</td>
                        <td>${invoices.totalPrice }</td>
                        <td><c:choose>
                            <c:when test="${invoices.rate == 0 }">0%</c:when>
                            <c:when test="${invoices.rate == 0.06 }">6%</c:when>
                            <c:when test="${invoices.rate == 0.11 }">11%</c:when>
                            <c:when test="${invoices.rate == 0.13}">13%</c:when>
                            <c:otherwise>17%</c:otherwise>
                        </c:choose></td>
                        <td>${invoices.tax }</td>
                        <td>${invoices.datetime }</td>
                    <td>
                        <a  href="/updateInvoice.do?invoiceCode=${invoices.invoiceCode}&invoiceId=${invoices.invoiceId }"
                            style="text-decoration:none" class="ml-5"
                            title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>

                        <a href="/remove.do?invoiceCode=${invoices.invoiceCode }&invoiceId=${invoices.invoiceId }">
                            <i class="Hui-iconfont">&#xe6e2;</i></a>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </article>

    <div class="ep-pages">
        <a href="/turnTo.do?page=${page.prePage}&pages=${page.pages}" target="_self" class="ep-pages-ctr1">共${page.pages}页</a>
        <a href="/turnTo.do?page=${page.firstPage}&pages=${page.pages}" target="_self" class="ep-pages-ctrl">首页</a>
        <a href="/turnTo.do?page=${page.prePage}&pages=${page.pages}" target="_self" class="ep-pages-ctrl">&lt;上一页</a>
        <a href="/turnTo.do?page=${page.prePage}&pages=${page.pages}" target="_self" class="current">第${page.pageNum}页</a>
        <a href="/turnTo.do?page=${page.nextPage}&pages=${page.pages}" target="_self" class="ep-pages-ctrl">&gt;下一页</a>
        <a href="/turnTo.do?page=${page.lastPage}&pages=${page.pages}" target="_self" class="ep-pages-ctrl">尾页</a>
    </div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../../css1/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../css1/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../css1/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="../../css1/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="../../js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="../../js/jquery-migrate-1.2.1.js"></script>
    <script src="../../js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="../../js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="../../js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="../../js/ligerUI/js/plugins/ligerResizable.jss" type="text/javascript"></script>

    <script type="text/javascript" src="../../css1/lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <script type="text/javascript" src="../../css1/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../css1/lib/laypage/1.2/laypage.js"></script>

    <script type="text/javascript">
        function judge(){
            if(document.getElementById("category").value==""){
                alert("请先选择发票类型");
                return false;
            }

        }
        function seltAll(){
            var chckBoxSign = document.getElementById("ckb");       //ckb 全选/反选的选择框id
            var chckBox = document.getElementsByName("chckBox");    //所有的选择框其那么都是chckBox
            var num = chckBox.length;
            if(chckBoxSign.checked){
                for(var index =0 ; index<num ; index++){
                    chckBox[index].checked = true;
                }
            }else{
                for(var index =0 ; index<num ; index++){
                    chckBox[index].checked = false;
                }
            }
        }

        function deleSeltedRecords(){
            var chckBox = document.getElementsByName("chckBox");
            var num = chckBox.length;
            var arra=new Array();
            for(var index =0 ; index<num ; index++){
                if(chckBox[index].checked){
                    arra.push(chckBox[index].value);
                }
            }
            if(arra.length==0){
                alert("对不起!,您未选中任何内容");
                return false;
            }
            if(window.confirm("确定删除所选记录？")){
                $.ajax( {
                    type : "post",
                    url : "/deleteall.do",
                    data:{arrays: arra},
                    dataType : "json",
                    success : function() {
                        location.reload();
                    },
                    error : function() {
                        alert("删除失败");
                    }
                });

            }else{
                alert("请选择要删除的记录");
            }
        }
    </script>
</body>
</html>