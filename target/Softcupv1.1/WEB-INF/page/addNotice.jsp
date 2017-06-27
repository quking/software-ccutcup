<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
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
    <!--/meta 作为公共模版分离出去-->

    <title>添加公告</title>
    <meta name="keywords" content="工大的名义">
    <meta name="description" content=" 工大的名义">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a href="first.do" class="maincolor">首页</a>
    <span class="c-gray en">&gt;</span>
    公告管理
    <span class="c-gray en">&gt;</span>
    查询公告
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
    <form class="form form-horizontal" id="noticeForm" action="/addNotice1.do" method="post">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>公告标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="title" name="title">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>发布人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" id="noticePerson" name="noticePerson">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>公告内容：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="content" class="textarea" placeholder="说点什么...最少输入10个字符"></textarea>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>

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
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>