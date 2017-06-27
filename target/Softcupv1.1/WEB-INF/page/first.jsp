<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../../css2/css/popup.css">
    <title>企业增值税发票数据分析系统</title>
</head>
<body>

<div class="popup-container">
    <div class="img-flex"></div>
</div>
<script type="text/javascript" src="../../css2/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../../css2/js/fragment.js"></script>
<script type="text/javascript">
    $(function() {
        var fragmentConfig = {
            container : '.img-flex',//显示容器
            line : 10,//多少行
            column : 24,//多少列
            width : (screen.width - 200),//显示容器的宽度
            animeTime : 3000,//最长动画时间,图片的取值将在 animeTime*0.33 + animeTime*0.66之前取值
            img : 'css2/images/1.jpg'//图片路径
        };
        fragmentImg(fragmentConfig);
    });
</script>
</body>
</html>