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
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title>新增文章 - 资讯管理 - H-ui.admin 3.0</title>
    <meta name="keywords" content="H-ui.admin 3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="H-ui.admin 3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i><a href="first.do" class="maincolor">首页</a>
    <span class="c-gray en">&gt;</span>
    发票管理
    <span class="c-gray en">&gt;</span>
    添加发票
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
    <div class="form form-horizontal" id="form-article-add">
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发票类型：</label>
        <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="category" id="category" class="select">
                	<option value="">请选择发票类型</option>
					<option value="0">进项发票</option>
					<option value="1">销项发票</option>
				</select>
				</span> </div>
    </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发票编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="invoiceCode" name="invoiceCode">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>No.：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  id="invoiceId" name="invoiceId">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>公司名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  id="companyName" name="companyName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>联系电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="tel" name="tel">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  id="goodName" name="goodName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品单价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  id="unitPrice" name="unitPrice">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  id="amount" name="amount">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>总价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  id="totalPrice" name="totalPrice" onblur="refer()">
            </div>
        </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>税率：</label>
                <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="rate" id="rate" class="select">
                	<option value="">请选择税率</option>
					<option value="0">0%</option>
					<option value="0.06">6%</option>
                    <option value="0.11">11%</option>
                    <option value="0.13">13%</option>
                    <option value="0.17">17%</option>
				</select>
				</span> </div>
            </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>开票日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  cssClass="Wdate"
                       onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'});"
                       name="datetime" id="datetime">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onClick="sub()" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">
                    &#xe632;</i> 添加</button>

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
    function refer() {
        var total=document.getElementById("totalPrice").value;
        var unitPrices=document.getElementById("unitPrice").value;
        var amounts=document.getElementById("amount").value;
        if(parseFloat(total)!=parseInt(amounts)*parseFloat(unitPrices)){
            alert("请仔细检查一下您的总额是否填写错误");
        }
    }

    function sub() {
        var exp = new RegExp("^[A-Za-z0-9]+$");
        var reg = new RegExp("^[0-9]*$");
        var reg1=new RegExp("^[0-9]*[1-9][0-9]*$");
        var reg2=new RegExp("^[0-9]+(.[0-9]{2})?$");

        var invoiceCode = $("#invoiceCode");
        var invoiceId = $("#invoiceId");
        var companyName = $("#companyName");
        var tel = $("#tel");
        var datetime = $("#datetime");
        var totalprice = $("#totalPrice");
        var category = $("#category");
        var amount=$("#amount");
        var unitPrice=$("#unitPrice");

        var msg = "";

        if ($.trim(invoiceCode.val()) == ""){
            msg = "编码不能为空！";
            invoiceCode.focus();
        }else if(!exp.test($.trim(invoiceCode.val()))){
            msg = "编码格式错误！";
            alert(msg);
            invoiceCode.focus();
        }else if ($.trim(invoiceId.val()) == ""){
            msg = "No.不能为空！";
            invoiceId.focus();
        }else if(!exp.test($.trim(invoiceId.val()))){
            msg = "No.格式错误！";
            alert(msg);
            invoiceId.focus();
        }else if ($.trim(companyName.val()) == ""){
            msg = "公司名称不能为空！";
            companyName.focus();
        }else if ($.trim(tel.val()) == ""){
            msg = "电话不能为空！";
            tel.focus();
        }else if(!reg.test($.trim(tel.val()))){
            msg = "电话格式错误！";
            alert(msg);
            tel.focus();
        }else if ($.trim(datetime.val()) == ""){
            msg = "开票日期不能为空！";
            datetime.focus();
        }else if ($.trim(category.val()) == ""){
            msg = "发票类型不能为空！";
            category.focus();
        }else if ($.trim(unitPrice.val()) == ""){
            msg = "单价不能为空！";
            unitPrice.focus();
        }else if(!reg2.test($.trim(unitPrice.val()))){
            msg = "单价格式错误！";
            alert(msg);
            unitPrice.focus();
        }else if($.trim(amount.val())==""){
            msg = "数量不能为空！";
            amount.focus();
        }else if(!reg1.test($.trim(amount.val()))){
            msg = "数量格式错误！";
            alert(msg);
            amount.focus();
        }else if($.trim(totalprice.val()) == ""){
            msg="总价不能为空";
            totalprice.focus();
        }else if(!reg2.test($.trim(totalprice.val()))){
            msg="金额格式错误";
            alert(msg);
            totalprice.focus();
        }if (msg != ""){
            return false;
        }
        $.ajax({

            type: "POST",

            url: "/add.do",

            data: {

                invoiceCode :document.getElementById("invoiceCode").value,

                invoiceId :document.getElementById("invoiceId").value,

                companyName :document.getElementById("companyName").value,

                tel: document.getElementById("tel").value,

                datetime:document.getElementById("datetime").value,

                unitPrice: document.getElementById("unitPrice").value,

                totalPrice: document.getElementById("totalPrice").value,

                category: document.getElementById("category").value,

                goodName: document.getElementById("goodName").value,

                amount: document.getElementById("amount").value,

                rate: document.getElementById("rate").value


            },
            dateType: "json",

            success: function () {

                window.location.href = "successaddinvoice.do";
            }

        });


    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>