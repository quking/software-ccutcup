<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: songyexiang
  Date: 2017/4/16
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script>DD_belatedPNG.fix('*');</script>
    <script type="text/javascript" src="/js/jquery.js"></script>

    <![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title>发票添加</title>
    <meta name="keywords" content="H-ui.admin">
    <meta name="description" content="H-ui.admin 3.0">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a href="first.do" class="maincolor">首页</a>
    <span class="c-gray en">&gt;</span>
    图片管理
    <span class="c-gray en">&gt;</span>
    图片关联
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
    <div class="form form-horizontal" id="form-article-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发票编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <td class="input-text"> ${requestScope.invoicecode}</td>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>No.：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <td class="input-text">${requestScope.invoiceid}</td>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>公司名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <td class="input-text">  ${requestScope.companyname}</td>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <td class="input-text">  ${requestScope.tel}</td>
            </div>

        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>开票日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <td class="input-text">
                ${requestScope.datetime}
                </td>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发票类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <td class="input-text">
                    <c:choose>
                        <c:when test="${requestScope.category == 0 }">进项发票</c:when>
                        <c:otherwise>销项发票</c:otherwise>
                    </c:choose>
               </td>
				 </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发票税率：</label>
            <div class="formControls col-xs-8 col-sm-9"><td class="input-text">
                <c:choose>
                <c:when test="${requestScope.rate == 0 }">0%</c:when>
                <c:when test="${requestScope.rate == 0.06 }">6%</c:when>
                <c:when test="${requestScope.rate == 0.11 }">11%</c:when>
                <c:when test="${requestScope.rate == 0.13}">13%</c:when>
                <c:otherwise>17%</c:otherwise>
                </c:choose></td></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>单价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <td class="input-text"> ${requestScope.price} </td>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <td class="input-text"> ${requestScope.number}</td>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>总额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <td class="input-text"> ${requestScope.allmoney}</td>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <a href="/showPhoto.do" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">
                    &#xe632;</i> 返回 </a>
            </div>
        </div>
    </div>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../../css1/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../css1/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../css1/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="../../css1/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->

<script type="text/javascript" src="../../css1/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../../css1/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="../../css1/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="../../css1/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="../../css1/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="../../css1/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="../../css1/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="../../css1/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script language="javascript" type="text/javascript" src="../../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    $("#tax option[value='${requestScope.tax}']").attr("selected","selected");
    $("#category option[value='${requestScope.category}']").attr("selected","selected");

    function sub() {

        var invoiceCode = $("#invoiceCode");
        var invoiceId = $("#invoiceId");
        var companyName = $("#companyName");
        var tel = $("#tel");
        var datetime = $("#datetime");
        var price = $("#price");
        var tax = $("#tax");
        var category = $("#category");
        var allmoney=$("#allmoney");
        var number=$("#number");
        var msg = "";
        if ($.trim(invoiceCode.val()) == ""){
            msg = "编码不能为空！";
            invoiceCode.focus();
            return false;
        }else if ($.trim(invoiceId.val()) == ""){
            msg = "No.不能为空！";
            invoiceId.focus();
            return false;
        }else if ($.trim(companyName.val()) == ""){
            msg = "公司名称不能为空！";
            companyName.focus();
            return false;
        }else if ($.trim(tel.val()) == ""){
            msg = "电话不能为空！";
            tel.focus();
            return false;
        }else if ($.trim(datetime.val()) == ""){
            msg = "开票日期不能为空！";
            datetime.focus();
            return false;
        }else if ($.trim(category.val()) == ""){
            msg = "发票类型不能为空！";
            category.focus();
            return false;
        }else if ($.trim(price.val()) == ""){
            msg = "金额号码不能为空！";
            price.focus();
            return false;
        }else if ($.trim(tax.val()) == ""){
            msg = "税额不能为空！";
            tax.focus();
            return false;
        }else if($.trim(allmoney.val()) == ""){
            msg="总额不能为空";
            allmoney.focus();
            return false;
        }else if($.trim(number.val())==""){
            msg="数量不能为空";
            number.focus();
            return false;
        }
        var reg = new RegExp("^[0-9]*$");
        var reg1=new RegExp("^[0-9]*[1-9][0-9]*$");
        var reg2=new RegExp("^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$");
        if(!reg.test($.trim(invoiceCode.val()))){
            msg = "请输入数字";
            alert(msg);
            invoiceCode.focus();
            return false;
        }else if(!reg.test($.trim(invoiceId.val()))){
            msg = "请输入数字";
            alert(msg);
            invoiceId.focus();
            return false;
        }else if(!reg1.test($.trim(number.val()))){
            alert("请输入正整数");
            number.focus();
            return false;
        }else if(!reg2.test($.trim(allmoney.val()))){
            alert("数字格式错误");
            allmoney.focus();
            return false;
        }else if(!reg2.test($.trim(price.val()))){
            alert("数字格式错误");
            price.focus();
            return false;
        }

        $.ajax({

            type: "POST",

            url: "/updateInvoice2.do",

            dataType:'json',

            data: {

                invoiceCode :document.getElementById("invoiceCode").value,

                invoiceId :document.getElementById("invoiceId").value,

                companyName :document.getElementById("companyName").value,

                tel: document.getElementById("tel").value,

                datetime:document.getElementById("datetime").value,

                price: document.getElementById("price").value,

                tax: document.getElementById("tax").value,

                category: document.getElementById("category").value,

                number: document.getElementById("number").value,

                allmoney:document.getElementById("allmoney").value

            },

            success: function (data) {
                if(data.result=="success")
                    location.href = "successupdateinvoice.do";
                else{
                    alert("存在重复的发票编号，请重新修改")
                }
            },error:function () {
                alert("网络异常");
            }

        });

    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>