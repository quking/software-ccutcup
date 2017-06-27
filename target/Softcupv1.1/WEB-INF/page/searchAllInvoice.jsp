<%--
  Created by IntelliJ IDEA.
  User: songyexiang
  Date: 2017/5/12
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../../js/jquery.js"></script>
</head>
<body>
<h1>Hellow</h1>
<div id="display"></div>
<script>
    $.ajax({

        type:"POST",

        url:"/searchAll.do",

        data:{"":""},

        dataType:"json",

        success : function(data)
        {

            var category = "";

            var str = "";

            if(data.error!=1)
            {
                for(var i=0;i< data.invoice_list.length;i++)
                {
                    if(data.invoice_list[i].category == 0)

                        category = "进项发票";

                    else

                        category = "销项发票";

                    str += "<div>" + data.invoice_list[i].invoiceCode + "</div>";

                    str += "<div>" + data.invoice_list[i].invoiceId + "</div>";

                    str += "<div>" + data.invoice_list[i].companyName + "</div>";

                    str += "<div>" + data.invoice_list[i].tel + "</div>";

                    str += "<div>" + data.invoice_list[i].datetime + "</div>";

                    str += "<div>" + data.invoice_list[i].price + "</div>";

                    str += "<div>" + data.invoice_list[i].rate + "</div>";

                    str += "<div>" +category + "</div>";
                }
                $('#display').html(str);
            }
            else

                $("#display").html("No Invoice.");
        }
    });
</script>
</body>
</html>
