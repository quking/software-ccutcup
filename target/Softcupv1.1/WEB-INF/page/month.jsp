<%--
  Created by IntelliJ IDEA.
  User: mtl
  Date: 17-5-9
  Time: 下午9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>Title</title>
    <script src="../../js/jquery.js"></script>
    <script src="../../js/highcharts.js"></script>
    <script src="../../js/drilldown.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="../../css1/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="../../css1/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
</head>
<body>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a href="first.do" class="maincolor">首页</a> <span class="c-gray en">&gt;</span> 数据统计 <span class="c-gray en">&gt;</span> 月度统计 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<span class="select-box" style="width:150px">
<select class="select" name="brandclass" size="1" id="year"></select></span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class="select-box" style="width:150px">
            <select class="select" name="brandclass" size="1" id="month"></select></span>月&nbsp;&nbsp;&nbsp;&nbsp;
<button onclick = "TaxmonthOfLine()" class="btn btn-primary upload-btn">增值税数据月度统计折线图</button>
<button onclick = "TaxmonthOfColumn()" class="btn btn-primary upload-btn">增值税数据月度统计柱状图</button>
<button onclick = "TotalPricemonthOfLine()" class="btn btn-primary upload-btn">销售额数据统计折线图</button>
<button onclick = "TotalPricemonthOfColumn()" class="btn btn-primary upload-btn">销售额数据统计柱状图</button>
<div id = "windows"></div>
<script>
    $.ajax({

        type:"POST",

        url:"/getYear.do",

        data:{

            "":""
        },

        dataType:"json",

        success:function(data)
        {

            var str = "";

            for(var i=0;i<data.yearList.length;i++)

                str += "<option>" + data.yearList[i] + "</option>";

            document.getElementById("year").innerHTML = str;

        }

    });

    var str = "";

    for(var i=0;i<12;i++)

        str += "<option>" + (i+1) + "</option>"

    document.getElementById("month").innerHTML = str;

    function TaxmonthOfLine()
    {
        $.ajax({

            type:"POST",

            url:"/TaxmonthImg.do",

            data:{

                year : document.getElementById("year").value,

                month: document.getElementById("month").value

            },

            dataType:"json",

            success : function(data)
            {

                var chart = new Highcharts.Chart('windows', {
                    title: {
                        text: '增值税月度统计折线图',
                        x: -20
                    },
                    subtitle: {
                        text: '',
                        x: -20
                    },
                    xAxis: {
                        categories: data.x
                    },
                    yAxis: {
                        title: {
                            text: '金额(元)'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: '元'
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: [

                        {

                            name:"进项税",

                            data:data.intax

                        },
                        {

                            name:"销项税",

                            data:data.outtax

                        },
                        {

                            name:"增值税",

                            data:data.subtax

                        }

                    ]
                });



            }


        });


    }

    function TaxmonthOfColumn()
    {

        $.ajax({

            url:"TaxmonthImg.do",

            type:"POST",

            data:{

                "year":document.getElementById("year").value,

                "month":document.getElementById("month").value

            },

            dataType:"json",

            success:function(data)
            {

                $('#windows').highcharts({
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: '增值税月度统计柱状图'
                    },
                    subtitle: {
                        text: ''
                    },
                    xAxis: {
                        categories: data.x,
                        crosshair: true
                    },
                    yAxis: {

                        title: {
                            text: '金额 (元)'
                        }
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true
                    },
                    plotOptions: {
                        column: {
                            pointPadding: 0.2,
                            borderWidth: 0
                        }
                    },
                    series: [{
                        name: '销项税',
                        data: data.outtax
                    }, {
                        name: '进项税',
                        data: data.intax
                    }, {
                        name: '增值税',
                        data: data.subtax
                    }]
                });





            }


        });






    }

    function TotalPricemonthOfLine()
    {

        $.ajax({

            type:"POST",

            url:"/TotalPricemonthImg.do",

            data:{

                year : document.getElementById("year").value,

                month: document.getElementById("month").value

            },

            dataType:"json",

            success : function(data)
            {

                var chart = new Highcharts.Chart('windows', {
                    title: {
                        text: '销售额数据统计折线图',
                        x: -20
                    },
                    subtitle: {
                        text: '',
                        x: -20
                    },
                    xAxis: {
                        categories: data.x
                    },
                    yAxis: {
                        title: {
                            text: '金额 (元)'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: '元'
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: [

                        {

                            name:"进项额",

                            data:data.inTotalPrice

                        },
                        {

                            name:"销项额",

                            data:data.outTotalPrice

                        },
                        {

                            name:"盈利",

                            data:data.subTotalPrice

                        }

                    ]
                });



            }


        });





    }

    function TotalPricemonthOfColumn()
    {

        $.ajax({

            url:"TotalPricemonthImg.do",

            type:"POST",

            data:{

                "year":document.getElementById("year").value,

                "month":document.getElementById("month").value

            },

            dataType:"json",

            success:function(data)
            {

                $('#windows').highcharts({
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: '销售额月度统计柱状图'
                    },
                    subtitle: {
                        text: ''
                    },
                    xAxis: {
                        categories: data.x,
                        crosshair: true
                    },
                    yAxis: {

                        title: {
                            text: '金额 (元)'
                        }
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true
                    },
                    plotOptions: {
                        column: {
                            pointPadding: 0.2,
                            borderWidth: 0
                        }
                    },
                    series: [{
                        name: '销项额',
                        data: data.outTotalPrice
                    }, {
                        name: '进项额',
                        data: data.inTotalPrice
                    }, {
                        name: '盈利',
                        data: data.subTotalPrice
                    }]
                });



            }

        });

    }




</script>
</body>
</html>
