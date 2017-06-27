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
<nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="##" class="maincolor">发票管理</a>
    <span class="c-999 en">&gt;</span>
    <span class="c-666">修改发票</span>
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
    <div class="form form-horizontal" id="form-article-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发票编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="invoiceCode" name="invoiceCode" value="${requestScope.invoicecode}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>No.：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  id="invoiceId" name="invoiceId" value="${requestScope.invoiceid}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>公司名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  id="companyName" name="companyName" value="${requestScope.companyname}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="tel" name="tel" value="${requestScope.tel}">
            </div>

        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>开票日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text"  cssClass="Wdate"
                       onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'});"
                       name="datetime" id="datetime" value="${requestScope.datetime}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发票类型：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="category" class="select" id="category">
                	<option value="">发票类型</option>
					<option value="0">进项发票</option>
					<option value="1">销项发票</option>
				</select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发票税率：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="rate" id="rate" class="select">
                	<option value="">选择税率</option>
					<option value="0.17">17%</option>
					<option value="0.13">13%</option>
                    <option value="0.11">11%</option>
                    <option value="0.06">6%</option>
                    <option value="0">0%</option>
				</select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="goodName" name="price" value="${requestScope.goodsName}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>单价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="price" name="price" value="${requestScope.price}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="number" name="price" value="${requestScope.number}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>总额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="allmoney" name="price" value="${requestScope.allmoney}">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onClick="sub()" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">
                    &#xe632;</i> 确认修改</button>
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
    $("#rate option[value='${requestScope.rate}']").attr("selected","selected");
    $("#category option[value='${requestScope.category}']").attr("selected","selected");

    function sub() {

        var invoiceCode = $("#invoiceCode");
        var invoiceId = $("#invoiceId");
        var companyName = $("#companyName");
        var tel = $("#tel");
        var datetime = $("#datetime");
        var price = $("#price");
        var rate = $("#rate");
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
        }else if ($.trim(rate.val()) == ""){
            msg = "税额不能为空！";
            rate.focus();
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

                goodName:document.getElementById("goodName").value,

                rate: document.getElementById("rate").value,

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