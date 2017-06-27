<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: songyexiang
  Date: 2017/5/2
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title>报表</title>
    <style>
        ul{border:0; text-align:center; margin:auto 0px;}

        #pagination-flickr li{
            text-align:center;
            border:0; margin:0; padding:0;
            font-size:16px;
            list-style:none;
        }
        #pagination-flickr a{
            border:solid 1px #DDDDDD;
            margin-right:2px;
        }
        #pagination-flickr .next a,
        #pagination-flickr .previous a {
            font-weight:bold;
            border:solid 1px #FFFFFF;
        }
        #pagination-flickr a:link,
        #pagination-flickr a:visited {
            color:#0063e3;
            display:block;
            float:left;
            padding:3px 6px;
            text-decoration:none;
        }
        #pagination-flickr a:hover{
            border:solid 1px #666666;
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a href="first.do" class="maincolor">首页</a>
    <span class="c-gray en">&gt;</span>
    企业报表
    <span class="c-gray en">&gt;</span>
    年度报表

    <a class="btn btn-danger radius r" style="line-height:1.6em;margin-top:3px" href="javascript:printresult();" title="打印" >打印</a>
</nav>
<div class="Hui-article">
    <article class="cl pd-20">
        <form action="/search.do" method="post">
            <div class="text-c">
				<span class="select-box inline">
				<select name="category" id="category" class="select">
					<option value="">发票类型</option>
					<option value="0">进项发票</option>
					<option value="1">销项发票</option>
				</select>
				</span>&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="select-box inline">
				<select name="category" id="year" class="select" onclick="addyear()">
					<option value="">选择年份</option>

				</select>
				</span>&nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn btn-success" type="button" onclick="producttable()"><i class="Hui-iconfont">&#xe665;</i>生成报表</button>
                <button class="btn btn-success" type="button" onclick="exporttable()"><i class="Hui-iconfont">&#xe665;</i>导出报表</button>

            </div>
        </form>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
				</span>

        </div>
        <div class="">
            <table class="table table-border table-bordered table-bg table-hover table-sort" id="baobiao">
                <thead>
                <tr class="text-c">
                    <th width="77">商品\月份</th>
                    <th width="77">一月</th>
                    <th width="77">二月</th>
                    <th width="77">三月</th>
                    <th width="77">四月</th>
                    <th width="77">五月</th>
                    <th width="77">六月</th>
                    <th width="77">七月</th>
                    <th width="77">八月</th>
                    <th width="77">九月</th>
                    <th width="77">十月</th>
                    <th width="77">十一月</th>
                    <th width="77">十二月</th>
                </tr>
                </thead>
                <tbody id="tbod">

                </tbody>
            </table>
        </div>
    </article>


    <!--_footer 作为公共模版分离出去-->
    <script type="text/javascript" src="../../css1/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../css1/lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="../../css1/static/h-ui/js/H-ui.js"></script>
    <script type="text/javascript" src="../../css1/static/h-ui.admin/js/H-ui.admin.page.js"></script>
    <!--/_footer /作为公共模版分离出去-->

    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="../../js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="../../js/jquery-migrate-1.2.1.js"></script>
    <script src="../../js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="../../js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="../../js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="../../js/ligerUI/js/plugins/ligerResizable.jss" type="text/javascript"></script>

    <script type="text/javascript" src="../../css1/lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <script type="text/javascript" src="../../css1/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../css1/lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/jquery.table2excel.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-migrate-1.2.1.js"></script>
    <script type="text/javascript" src="../../js/jquery.jqprint-0.3.js"></script>

    <script type="text/javascript">
        function addyear(){
            var today=new Date();
            var s=parseInt(today.getFullYear());
          var year=document.getElementById("year");
          for(var i=s;i>1990;i--){
              var newNode = document.createElement("option");
              newNode.value=i;
              newNode.innerText=i;
              year.appendChild(newNode);
          }
        }
         function producttable() {
             document.getElementById("tbod").innerHTML="";
            var category=document.getElementById("category").value;
            var year=document.getElementById("year").value;
            if(category==""||year==""){
                alert("不能为空");
                return false;
            }
            $.ajax({
                type:'post',
                url:'/selectdate.do',
                dataType:'json',
                data:{"category":category,"year":year},
                success:function (data) {

                    for(var j=0;j<data.goods.length;j++){
                        var parent=document.getElementById("tbod");
                        var nodes=document.createElement("tr");
                        nodes.setAttribute("id",j);
                        nodes.setAttribute("class","text-c");
                        parent.appendChild(nodes);
                        for(var i=0;i<13;i++){
                            var parent2=document.getElementById(j);
                            var newNode = document.createElement("th");
                            if(i==0)
                                newNode.innerText=data.goods[j];
                            else
                            newNode.innerText=(data.Allmoney[i-1][j]*1).toFixed(2);
                            parent2.appendChild(newNode);  
                        }
                    }
                },error:function () {
                    alert('网络错误');
                }
            });

      }
        function exporttable() {
            $("#baobiao").table2excel({
                exclude: ".noExl",//不导出的表格数据选择器，不导出的数据加class加上 noExl就可以了
                name: "Excel Document Name",
                filename: "myFileName",
                fileext: ".xls",
                exclude_img: true,
                exclude_links: true,
                exclude_inputs: true
            });
        }
        function printresult() {
            $("#baobiao").jqprint();
        }
    </script>
</body>
</html>