<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   <%-- 在IE运行最新的渲染模式 --%>
    <meta name="viewport" content="width=device-width, initial-scale=1">   <%-- 初始化移动浏览显示 --%>
    <meta name="Author" content="Dreamer-1.">

    <!-- 引入各种CSS样式表 -->
    <link rel="stylesheet" href="../../css1/css/style.css">
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/font-awesome.css">
    <link rel="stylesheet" href="../../css/index.css">    <!-- 修改自Bootstrap官方Demon，你可以按自己的喜好制定CSS样式 -->
    <link rel="stylesheet" href="../../css/font-change.css"><!-- 将默认字体从宋体换成微软雅黑（个人比较喜欢微软雅黑，移动端和桌面端显示效果比较接近） -->
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <style type="text/css">
        .bbb{
            padding-left: 120px;
        }
        .ccc{

            width: 100%;
            height:100%;
        }
        .sss{
            font-family: microsoft yahei;
            font-size: small;
            color:grey;
        }
        li{list-style: none;}
        .navbar{
            background-color: #2e6da4;
        }

        .StatBarL{position:absolute;
            top:50px;
            right:0px;
            z-index:1;
            display: inline-block;
        }﻿
    </style>

    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap-dropdown.js"></script>
    <script type="text/javascript" src="../../css1/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../css1/lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="../../css1/static/h-ui/js/H-ui.js"></script>
    <script type="text/javascript" src="../../css1/static/h-ui.admin/js/H-ui.admin.page.js"></script>

    <title>- 发票管理系统 -</title>
</head>

<body>
<!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
<nav class="navbar navbar-inverse navbar-fixed-top">

    <div class="navbar-header">
        <img src="../../css1/images/logo.jpg">
    </div>

    <div class="StatBarL">
        <img src="../../css1/images/StatBarL.jpg" style="position:absolute; right:0"/>
        <div class="StatBar_time">
            <img src="../../css1/images/StatBar_time.gif" style="position:absolute; top:10px;right:450px">
        </div>
        <span style="position:absolute; top:5px; right:200px" > <font style="color: #999999;">上一次登录时间:${sessionScope.lastlogintime}</font></span>
        <img src="../../css1/images/top_exit.gif" style="position:absolute;top:10px;right:150px">
        <a href="loginout.do">
            <span style="position:absolute; top:5px; right:100px"><font color="#999999" >注销</font></span>
            </a>
    </div>
</nav>

<!-- 左侧菜单选项========================================= -->
<!--_menu 作为公共模版分离出去-->
<aside class="Hui-aside" style="background: url('../../images/9.png')">

    <div class="menu_dropdown">
        <dl id="menu-admin">
            <dt style="background: url('../../images/left_nav_expand2.jpg')"><i class="Hui-iconfont">&#xe62d;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul style="background-color: #E8FFF5">
                    <li ><a href="#" onclick="changepage('resetpassword2.do')">修改密码</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-article">
            <dt style="background: url('../../images/left_nav_expand2.jpg')"><i class="Hui-iconfont">&#xe616;</i> 发票管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul style="background-color:#E8FFF5 ">
                    <li><a href="#" onclick="changepage('addInvoice.do')" title="资讯管理">添加发票</a></li>
                    <li><a href="#" onclick="changepage('invoice.do')" title="资讯管理">查询发票</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-picture">
            <dt style="background: url('../../images/left_nav_expand2.jpg')"><i class="Hui-iconfont">&#xe613;</i> 发票存根管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul style="background-color:#E8FFF5">
                    <li><a href="#" onclick="changepage('addPhoto1.do')" title="图片管理">上传发票图片</a></li>
                    <li><a href="#" onclick="changepage('showPhoto.do')" title="图片管理">查看发票图片</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-tongji">
            <dt  style="background: url('../../images/left_nav_expand2.jpg')"><i class="Hui-iconfont">&#xe61a;</i> 数据统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul style="background-color:#E8FFF5">
                    <li><a href="#" onclick="changepage('month.do')" title="月度查询">月度查询</a></li>
                    <li><a href="#" onclick="changepage('year.do')" title="年度查询">年度查询</a></li>
                    <li><a href="#" onclick="changepage('pan.do')" title="税率查询">税率分析</a></li>
                    <li><a href="#" onclick="changepage('pan1.do')" title="税率查询">销项额分析</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-tongj">
            <dt  style="background: url('../../images/left_nav_expand2.jpg')"><i class="Hui-iconfont">&#xe62e;</i> 企业报表<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul style="background-color:#E8FFF5">
                    <li><a href="#" onclick="changepage('baobiao.do')" title="综合报表">综合报表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt  style="background: url('../../images/left_nav_expand2.jpg')"><i class="Hui-iconfont">&#xe622;</i> 公告管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul style="background-color:#E8FFF5">
                    <li><a href="#" onclick="changepage('addNotice.do')" title="评论列表">上传公告</a></li>
                    <li><a href="#" onclick="changepage('showNotice.do')" title="意见反馈">查看公告</a></li>
                </ul>
            </dd>
        </dl>
    </div>
</aside>
<!-- 右侧内容展示==================================================   -->
<section class="Hui-article-box">
    <iframe src="first.do" class="ccc"frameborder=0 id="frame"></iframe>
</section>

<script type="text/javascript">

    /*
     * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
     * （实现左侧菜单中的标签点击后变色的效果）
     */
    $(document).ready(function () {
        $('ul.nav > li').click(function (e) {
            //e.preventDefault();    加上这句则导航的<a>标签会失效
            $('ul.nav > li').removeClass('active');
            $(this).addClass('active');
        });
    });

    /*
     * 利用div实现左边点击右边显示的效果（以id="content"的div进行内容展示）
     * 注意：
     *   ①：js获取网页的地址，是根据当前网页来相对获取的，不会识别根目录；
     *   ②：如果右边加载的内容显示页里面有css，必须放在主页（即例中的index.jsp）才起作用
     *   （如果单纯的两个页面之间include，子页面的css和js在子页面是可以执行的。 主页面也可以调用子页面的js。但这时要考虑页面中js和渲染的先后顺序 ）
     */

    $(function () {
        $(".bbb li").hide();
        $(".aaa").click(function () {
            $(this).children('ul').find('li').removeClass("menu_chioce");
            $(".menu_chioce").slideUp();
            $(this).children('ul').find('li').slideToggle();
            $(this).children('ul').find('li').addClass("menu_chioce");
        });
    });
    function changepage(page) {
        var frame=document.getElementById("frame");
        frame.src=page;
    }
</script>

</body>
</html>