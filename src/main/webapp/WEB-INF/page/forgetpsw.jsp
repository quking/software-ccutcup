<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="no-js ie6 lt8">
<html lang="en" class="no-js ie7 lt8">
<html lang="en" class="no-js ie8 lt8">
<html lang="en" class="no-js ie9">
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>找回密码</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="">
                    <strong>&laquo;From: </strong>CCUT
                </a>
                <span class="right">
                        <strong>工大的名义制作</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
                <h1>找回密码 <span>invoice System</span></h1>
			
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                                <h1>find psw</h1>
                                <p> 
                                    <label for="username" class="uname" > 请输入发送至管理员邮箱的验证码： </label>
                                    <input id="username" name="username" required="required" type="text" placeholder="验证码"/>
    
                                <p class="login button">
                            <input type="button" value="发送验证码" id="btn" onclick="settime();sendcode()"/>   <input type="submit" value="Login"  style="VISIBILITY: hidden" /> <input type="button" value="找回密码" onclick="fcheck()"/>
								</p>
                                   <p class="change_link">
                                       想起密码了？
                                    <a href="login.do" class="to_register">返回登录</a>
                                </p>

                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
    </body>
    <script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
    var countdown=60;
    function settime() {
        var obj=document.getElementById('btn');
        if(countdown==0){
            obj.removeAttribute('disabled');
            obj.value='重新发送';
            countdown=60;
            return;
        }else{
            obj.setAttribute('disabled',true);
            obj.value='重新发送('+countdown+')';
            countdown--;

        }
        setTimeout('settime()',1000);
    }
    function sendcode() {
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
    }
    function fcheck() {
        $.ajax({
            type:"post",
            url:"fcheck.do",
            dataType:"json",
            data:{"mcode":$("#username").val()},
            success:function (data) {
                if(data.result=="success"){
                    window.location.href='resetpassword.do';
                }else{
                    alert("验证码错误");
                }
            }

        });
    }
</script>
</html>