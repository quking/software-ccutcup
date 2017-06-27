<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>Title</title>
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a href="first.do" class="maincolor">首页</a> <span class="c-gray en">&gt;</span> 数据统计 <span class="c-gray en">&gt;</span> 税率分析 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<br>&nbsp;&nbsp;&nbsp;
<span class="select-box" style="width:150px">
    <select class="select" name="brandclass" size="1" id="year"></select></span>&nbsp;年&nbsp;&nbsp;&nbsp;
<button onclick = "TaxyearOfPan()" class="btn btn-primary upload-btn">进/销项税额饼状图</button>&nbsp;
<div id = "outtax"></div>
<div id = "intax"></div>
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



    function TaxyearOfPan()
    {

        $.ajax({

            url:"TaxPanImg.do",

            type:"POST",

            data:{

                "year":document.getElementById("year").value

            },

            dataType:"json",

            success:function(data)
            {

                var rate =  ['17%税率的商品','13%税率的商品','11%税率的商品','6%税率的商品','0税率的商品'];

                $('#outtax').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: '销项税额比例图'
                    },
                    tooltip: {
                        headerFormat: '{series.name}<br>',
                        pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: '销项税额占比',
                        data: [
                            ['17%税率的商品',   data.outtax0],
                            ['13%税率的商品',       data.outtax1],
                            ['11%税率的商品',       data.outtax2],
                            ['6%税率的商品',    data.outtax3],
                            ['0税率的商品',     data.outtax4]
                        ]
                    }]
                });


                $('#intax').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: '进项税额比例图'
                    },
                    tooltip: {
                        headerFormat: '{series.name}<br>',
                        pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: '进项税额占比',
                        data: [
                            ['17%税率的商品',   data.intax0],
                            ['13%税率的商品',       data.intax1],
                            ['11%税率的商品',       data.intax2],
                            ['6%税率的商品',    data.intax3],
                            ['0税率的商品',     data.intax4]
                        ]
                    }]
                });



            }


        });







    }

    function TaxyearOfEachmonthPan()
    {

        $.ajax({

            url:"TotalPriceyearImg.do",

            type:"POST",

            data:{

                "year":document.getElementById("year").value

            },

            dataType:"json",

            success:function(data)
            {

                $('#intax').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: '销项额额比例图'
                    },
                    tooltip: {
                        headerFormat: '{series.name}<br>',
                        pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: '销项额占比',
                        data: [
                            ['1月',   data.outTotalPrice[0]],
                            ['2月',       data.outTotalPrice[1]],
                            ['3月',       data.outTotalPrice[2]],
                            ['4月',    data.outTotalPrice[3]],
                            ['5月',     data.outTotalPrice[4]],
                            ['6月',      data.outTotalPrice[5]],
                            ['7月',      data.outTotalPrice[6]],
                            ['8月',      data.outTotalPrice[7]],
                            ['9月',      data.outTotalPrice[8]],
                            ['10月',      data.outTotalPrice[9]],
                            ['11月',      data.outTotalPrice[10]],
                            ['12月',      data.outTotalPrice[11]]
                        ]
                    }]
                });



            }


        });



    }



</script>
</body>
</html>
