<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 17-4-26
  Time: 下午6:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码修改成功</title>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript">
        $.ajax({
            type:'post',
            url:'loginout2.do',
            dataType:'json',
            success:function () {
            },error:function () {
                alert("error");
            }
        });

        var count=5;
       $(function () {
          settime();
       });
        function settime() {
            var divs=document.getElementById('successpsw');
            if(count==0){
                window.location.href="login.do";
                return;
            }else{
               divs.innerHTML='<h1>密码修改成功<br><br>'+count+'秒后跳转到登录页面..........<h1>';
                count--;

            }
            setTimeout('settime()',1000);
        }

    </script>
    <style>
        div{ margin:50px auto; width:800px; height:200px; border:1px}
    </style>
</head>
<body background="/images/jump.jpg">
<div id="successpsw"></div>

</body>
</html>
