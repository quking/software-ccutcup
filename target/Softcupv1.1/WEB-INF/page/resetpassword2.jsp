<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="no-js ie6 lt8">
<html lang="en" class="no-js ie7 lt8">
<html lang="en" class="no-js ie8 lt8">
<html lang="en" class="no-js ie9">
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <title>重设密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>

</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="first.do" class="maincolor">首页</a>
    <span class="c-999 en">&gt;</span>
    <span class="c-666">用户管理</span>
    <span class="c-999 en">&gt;</span>
    <span class="c-666">修改密码</span>

</nav>
<div style="padding: 60px 100px 10px;">
    <form class="bs-example bs-example-form" role="form">
        <div class="input-group">
            <span class="input-group-addon">原密码</span>
            <input type="password" id="username0" name="username0" required="required" class="form-control" placeholder="旧密码" style="width:300px" onchange="pw0()">
            <p id="ulabel"></p>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">验证码</span>
            <input type="text" id="checkcodes" name="checkcodes" required="required" class="form-control" placeholder="验证码" style="width:180px"><input type="button" class='btn' id="send" style="width:120px; background: lightgrey;color: grey" value="获取验证码"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">新密码</span>
            <input type="password" id="username" name="username" required="required" class="form-control"  style="width:300px" placeholder="新密码" onblur="pw1()">
            <p style="color: grey;size: 8px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;建议密码10位以上14位以下</p>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">确定新密码</span>
            <input type="password" id="username2" name="username2" required="required" class="form-control"  style="width:273px" placeholder="再次确定新密码" onchange="chang()"/>
            <p id="warn"></p>
        </div>
        <br>
        <input type="button" class='btn btn-danger' style="margin-left:140px;float:left;width:70px;" onclick="save();" value="保存"/>
        <br>
        <br>
        <br>
        <p class="change_link"><a href="https://jingyan.baidu.com/article/48a42057e16db4a9242504ff.html" class="to_register" target="_Blank" style="margin-left:120px;float:left;">如何设置安全密码?</a></p>

    </form>
</div>

<script type="text/javascript">
    function pw1() {
        if($("#username").val().length<10){
            alert("您的密码长度太短，存在安全隐患");
        }
    }
    var countdown=60;
    function settime() {
        var obj=document.getElementById('send');
        if(countdown==0){
            obj.removeAttribute('disabled');
            obj.value='重新获取';
            countdown=60;
            return;
        }else{
            obj.setAttribute('disabled',true);
            obj.value='重新发送（'+countdown+')';
            countdown--;

        }
        setTimeout('settime()',1000);
    }
    function save() {
        if($("#username").val()!=$("#username2").val()){
            $("#warn").html("<p style='color: red;size: 8px'>&nbsp;&nbsp;&nbsp;&nbsp;两次输入密码不同</p>");
            return false;
        }
        $.ajax({
            type:"post",
            url:"fcheck.do",
            dataType:"json",
            data:{"mcode":$("#checkcodes").val()},
            success:function (data) {
                if(data.result=="success"){
                    fcheck();
                }else{
                    alert("验证码错误");
                }
            }
        });
    }

    function fcheck() {
        $.ajax({
            type:"post",
            url:"updatepd.do",
            dataType:"json",
            data:{"oldpassword":$("#username0").val()},
            success:function (data) {
                if(data.result=="successes"){
                    updatepswd();
                }else{
                    $("#ulabel").html("<p style='color: red'> &nbsp;&nbsp;&nbsp;密码验证错误！！！</p>");
                    return false;
                }
            },
            error:function () {
                alert("网络错误");
            }
        });
    }
    function updatepswd() {
        $.ajax({
            type:"post",
            url:"updatepsw.do",
            dataType:"json",
            data:{"password":$("#username2").val()},
            success:function () {
                window.location.href="successresetpsw.do";
            },
            error:function () {
                alert("网络错误");
            }
        });

    }
    function chang() {
        $("#warn").html("");
    }
    function pw0() {
        $("#ulabel").html("");

    }

    $("#send").click(function () {
        settime();
        $.ajax({
            type:'post',
            url:"sendmail.do",
            dataType:"text",
            success:function () {
                alert("成功发送");
            },
            error:function () {
                alert("网络错误");
            }
        });
    });


</script>
</body>
</html>