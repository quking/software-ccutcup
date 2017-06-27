<%--
  Created by IntelliJ IDEA.
  User: songyexiang
  Date: 2017/5/24
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="content-type" content="text/html" charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="../../css1/lib/html5.js"></script>
    <script type="text/javascript" src="../../css1/lib/respond.min.js"></script>
    <script src="../../js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="../../js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="../../js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="../../js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../../js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
    <link href="../../js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui.admin/css/style.css" />

    <title></title>
    <style>
        a{ text-decoration:none}
        .ep-pages{padding:10px 12px;clear:both;text-align:center;
            font-family:Arial, "\5B8B\4F53", sans-serif;font-size:14px;vertical-align:top}
        .ep-pages a, .ep-pages span{display:inline-block;height:23px;line-height:23px;padding:0 8px;
            margin:5px 1px 0 0;background:#fff;border:1px solid #e5e5e5;overflow:hidden;vertical-align:top}
        .ep-pages a:hover{background:#cc1b1b;border:1px solid #cc1b1b;text-decoration:none}
        .ep-pages a, .ep-pages a:visited{color:#252525}
        .ep-pages a:hover, .ep-pages a:active{color:#ffffff}
        .ep-pages .current{background:#007799;border:1px solid #CCEEFF;color:#CCEEFF}
        .ep-pages a.current, .ep-pages a.current:visited{color:#ffffff}
        .ep-pages a.current:hover, .ep-pages a.current:active{color:#ffffff}
        .ep-pages-ctrl{font-family:"\5B8B\4F53", sans-serif;font-weight:bold;font-size:16px}
        .ep-pages-e5e5e5{color:#e5e5e5}
        .ep-pages-all{font-size:12px;vertical-align:top}

    </style>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript">
        $.ajax({
            type:'post',
            url:'loadnotices.do',
            dataType:'json',
            success:function (data) {
                var tbody=document.getElementById("tobodt");
            for(var i=0;i<data.titlelist.length;i++){
                var tr=document.createElement("tr");
                tr.setAttribute("class","text-c");
                tr.setAttribute("id",data.nid[i]);
                tbody.appendChild(tr);
                var td1=document.createElement("td");
                td1.innerHTML='<input type="checkbox" name="chckBox" value='+data.nid[i]+'>';
                tr.appendChild(td1);
                var td2=document.createElement("td");
                td2.innerHTML=data.titlelist[i];
                tr.appendChild(td2);
                var td3=document.createElement("td");
                td3.innerHTML=data.personlist[i];
                tr.appendChild(td3);
                var td4=document.createElement("td");
                td4.innerHTML=data.contentlist[i];
                tr.appendChild(td4);
                var td5=document.createElement("td");
                td5.innerHTML=data.datelist[i];
                tr.appendChild(td5);
                var td6=document.createElement("td");
                td6.innerHTML='<a href="/deleteNotice.do?noticeId='+data.nid[i]+'"><i class="Hui-iconfont">&#xe6e2;</i></a>';
                tr.appendChild(td6);

            }

            },error:function () {
             alert("网络异常");
            }
        });
    </script>
</head>
<body>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a href="first.do" class="maincolor">首页</a>
    <span class="c-gray en">&gt;</span>
    公告管理
    <span class="c-gray en">&gt;</span>
    查询公告
</nav>
    <article class="cl pd-20">
        <div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
				<a href="javascript:;" onClick="deleSeltedRecords()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
				<a class="btn btn-primary radius" data-title="添加公告" href="/addNotice.do" onClick="article_add('添加发票','article-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加公告</a>
				</span>
            <span class="r">共有数据：<strong id="lenthes">${page.total}</strong> 条</span>
        </div>
        <div class="">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" id="ckb" value="checkAll" onclick="seltAll()"></th>
                    <th width="100">标题</th>
                    <th width="80">发布人</th>
                    <th width="">内容</th>
                    <th width="150">发布时间</th>
                    <th width="80">操作</th>
                </tr>
                </thead>
                <tbody id="tobodt">



                </tbody>
            </table>
        </div>

    <div class="ep-pages">
        <a href="/turnToNotice.do?page=${page.prePage}&pages=${page.pages}" target="_self" class="ep-pages-ctr1">共${page.pages}页</a>
        <a href="/turnToNotice.do?page=${page.firstPage}&pages=${page.pages}" target="_self" class="ep-pages-ctrl">首页</a>
        <a href="/turnToNotice.do?page=${page.prePage}&pages=${page.pages}" target="_self" class="ep-pages-ctrl">&lt;上一页</a>
        <a href="/turnToNotice.do?page=${page.prePage}&pages=${page.pages}" target="_self" class="current">第${page.pageNum}页</a>
        <a href="/turnToNotice.do?page=${page.nextPage}&pages=${page.pages}" target="_self" class="ep-pages-ctrl">&gt;下一页</a>
        <a href="/turnToNotice.do?page=${page.lastPage}&pages=${page.pages}" target="_self" class="ep-pages-ctrl">尾页</a>
    </div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../../css1/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../css1/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../css1/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="../../css1/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../../css1/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../../css1/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../css1/lib/laypage/1.2/laypage.js"></script>
<!--/请在上方写此页面业务相关的脚本-->
        <script type="text/javascript">

            /** 给预览绑定点击事件 */
            $("a[id^='prev_']").click(function(){
                var noticeId = this.id.replace('prev_','');
                $.ligerDialog.open({
                    title:'预览公告',
                    height: 500,
                    url: '/previewNotice.do?id='+noticeId,
                    width: 750,
                    showMax: true,
                    showToggle: true,
                    showMin: true,
                    isResize: true,
                    slide: false
                });
            })

            function seltAll(){
                var chckBoxSign = document.getElementById("ckb");       //ckb 全选/反选的选择框id
                var chckBox = document.getElementsByName("chckBox");    //所有的选择框其那么都是chckBox
                var num = chckBox.length;
                if(chckBoxSign.checked){
                    for(var index =0 ; index<num ; index++){
                        chckBox[index].checked = true;
                    }
                }else{
                    for(var index =0 ; index<num ; index++){
                        chckBox[index].checked = false;
                    }
                }
            }

            function deleSeltedRecords(){
                var chckBox = document.getElementsByName("chckBox");
                var num = chckBox.length;
                var arra=new Array();
                for(var index =0 ; index<num ; index++){
                    if(chckBox[index].checked){
                        arra.push(chckBox[index].value);
                    }
                }
                if(arra.length==0){
                    alert("对不起!,您未选中任何内容");
                    return false;
                }
                if(window.confirm("确定删除所选记录？")){
                    $.ajax( {
                        type : "post",
                        url : "/deleteSelectNotice.do",
                        data:{arrays: arra},
                        dataType : "json",
                        success : function(data) {
                            var len=parseInt(data.len);
                            for(var i=0;i<arra.length;i++){

                                var thisnode=document.getElementById(""+arra[i]);
                                thisnode.parentNode.removeChild(thisnode);
                                len--;
                            }
                            document.getElementById("lenthes").innerHTML=len;

                        },
                        error : function() {
                            alert("删除失败");
                        }
                    });

                }else{
                    alert("请选择要删除的记录");
                }
            }


        </script>
</body>
</html>
