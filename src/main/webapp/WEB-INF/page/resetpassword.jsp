<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="no-js ie6 lt8">
<html lang="en" class="no-js ie7 lt8">
<html lang="en" class="no-js ie8 lt8">
<html lang="en" class="no-js ie9">
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />

        <title>修改密码</title>
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
            <div class="codrops-top">
                <a href="login.do">
                    <strong>&laquo;Return: </strong>首页
                </a>
                <span class="right">
                    <a href="http://www.ccut.edu.cn/">
                        <strong>工大的名义</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div>
            <header>
                <h1>重新设置密码 <span>invoice System</span></h1>
			
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                                <h1>Reset Psw</h1>
                                <p> 
                                    <label for="username" class="uname"  ></label>
                                    <input id="username" name="username" required="required" type="password" placeholder="新密码" onblur="pw1()"/>
                                </p>
                                <p> 
                                    <label for="username" class="uname"></label>
                                    <input id="username2" name="username2" required="required" type="password" placeholder="再次确定新密码"/>
                                </p>
    
                                <p class="login button"> 
                                 <input type="button" value="确定" id="bbtn"/>
								</p>
                                   <p class="change_link">
                                       不知道
                                    <a href="https://jingyan.baidu.com/article/48a42057e16db4a9242504ff.html" class="to_register">如何设置安全密码?</a>
                                </p>

                        </div>
                    </div>
                </div>  
            </section>
        </div>
        <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript">
        function pw1() {
          if($("#username").val().length<8){
              alert("warnning: 您的密码长度太短");
          }
        }
        function pw2() {
            if($("#username").val()!=$("#username2").val()){
                alert("两次密码不同");
                return false;
            }
        }
        $("#bbtn").click(function () {
            pw2();
           $.ajax({
               type:"post",
               url:"updatepsw.do",
               dataType:"json",
               data:{"password":$("#username2").val()},
               success:function () {
              window.location.href="successpsw.do";
               },
               error:function () {
                   alert("网络错误");
               }
           });
        });
    </script>
    </body>
</html>