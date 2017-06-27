<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 17-4-16
  Time: 下午7:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>登录界面</title>
</head>
<style>
    .ceshi{

        width:100%;
        position:fixed;
        bottom:0px;
        font-size:12px;
        text-align:center;
        left:0px;
        color:white;

    }
    .ceshi a{
        color:#fff;
    }
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
    body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,p,blockquote,th,td{margin:0;padding:0;border:none;}
    body{font-size:12px;serifbackground:#fff;color:#2b2b2b;}
    address,caption,cite,code,dfn,em,strong,th,var{font-style:normal;font-weight:normal;}
    select,input,img{vertical-align:middle;}
    table{border-collapse:collapse;border-spacing:0;}
    table,td,tr,th{font-size:12px;}
    a{text-decoration:none;cursor:pointer;}
    fieldset,img{border:0;}

    .main{ position:absolute;left:50%; top:50%; background:url(/images/login.jpg) no-repeat; width:772px; height:468px; margin:-234px 0 0 -386px;}

    .input-box{ position:absolute; top:110px; left:410px;color:#0952a1;}
    .input-box input{ border:1px solid #7491b5; width:154px; height:28px; background-color:#f5fafe; padding-left:4px; line-height:28px;}
    .input-box p{ line-height:40px;}
    .input-box .check{ width:14px; height:14px; margin-left:48px;}
    .input-box .record{ margin-left:6px;}
    .input-box .link{ margin-top:14px; margin-left:70px;}
    a{ height:28px; width:72px; display:inline-block; color:#fff; line-height:28px; text-align:center; margin-top:10px;}
    p a{color: blue;}
    .log{ background:url(/images/log.png) no-repeat; margin-right:16px; margin-left:48px}

    .reset{ background:url(/images/reset.png) no-repeat; color:#6d6d6d;}
    .main-box .copy{ text-align:center; margin-top:8px; color:#666666;}
    .text{ text-align:center; color:#fff; margin-top:398px; line-height:24px;}
    body {
        background-image:url(/images/keji.jpg);
        background-attachment:fixed;
    }

</style>
<script src="js/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        $(".log").click(function () {
            $.ajax({
                type:"post",
                url:"loginchecks.do",
                dataType:"json",
                data:{"username":$("#username").val(),"password":$("#password").val(),"charcode":$("#codes").val()},
                success:function (data) {
                    if(data.result=="errorcode"){
                     $("#font").html("  验证码错误！！")
                        refresh();
                    }else if(data.result=="success"){
                        window.location.href='main.do';
                    }else
                       document.getElementById("error").innerText="账号或密码错误";
                },
                error:function () {
                    alert("网络错误");
                }

});

        });
        $(".reset").click(function () {
         document.getElementById("username").value="";
            document.getElementById("password").value="";
            document.getElementById("codes").value="";

        });

    });
    function refresh() {
        document.getElementById("code").src="checkcode.do?id="+Math.random();
    }
    function clear() {
document.getElementById("token").innerHTML="";
    }
    function clear2() {
        document.getElementById("font").innerText="";
    }
    function clear3() {
        document.getElementById("error").innerHTML="";
    }

</script>
<body>

<div class="main">
    <div class="login-box">
        <div class="input-box">
            <p style="color: red;font-size: 16px" id="token">${requestScope.token}</p>
            <p>用户名：<input type="text" class="user" placeholder="管理员账号" name="username" id="username" onchange="clear();clear3()"/><font color="red" id="error"></font></p>
            <p><span style=" padding-right:12px;">密</span>码：<input type="password" class="password" placeholder="密码" name="password" id="password" onchange="clear();clear3()" /><a href="forgetpsw.do">忘记密码？</a></p>
            <p>验证码：<input type="text" class="checkcode" placeholder="验证码" id="codes" onchange="clear2()"/><font color="red"id="font"></font></p>
            <p><span style=" padding-right:22px;"></span><span style=" padding-right:12px;"></span><span style=" padding-right:12px;"></span><img alt="验证码" src="checkcode.do" id="code"><a href="" onclick="refresh()">看不清?</a> </p>
            <a href="#" class="log">登&nbsp;录</a><a href="#" class="reset">重&nbsp;置</a></div>
    </div>
</div>
<div class="ceshi"> Copyright @2017 &nbsp; &nbsp;鲁ICP备17016222号</div>
</body>
</html>

