<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- jsp文件头和头部 -->
<%@ include file="/WEB-INF/system/admin/top.jsp"%>

</head>
<body>



	<div class="container-fluid" id="main-container">
		
		<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a>首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
					<li class="active">全球祭祀祈福网</li>
				</ul>
				<!--.breadcrumb-->
			</div>
			<!--#breadcrumbs-->



    <div id="main" style="height:400px;width: 800px;"></div>














		</div>
		<!-- #main-content -->
<script src="<%=path%>/resources/echarts/echarts-all.js"></script>
     <script type="text/javascript">
        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('main')); 
        
        option = {
        	    title : {
        	        text: '本月注册用户数及墓园数',
        	        subtext: '按天显示本月新注册用户'
        	    },
        	    tooltip : {
        	        trigger: 'axis'
        	    },
        	    legend: {
        	        data:['用户数','墓园数']
        	    },
        	    toolbox: {
        	        show : true,
        	        feature : {
        	            mark : {show: true},
        	            dataView : {show: true, readOnly: false},
        	            magicType : {show: true, type: ['line', 'bar']},
        	            restore : {show: true},
        	            saveAsImage : {show: true}
        	        }
        	    },
        	    calculable : true,
        	    xAxis : [
        	        {
        	            type : 'category',
        	            boundaryGap : false,
        	            data : []
        	        }
        	    ],
        	    yAxis : [
        	        {
        	            type : 'value',
        	            axisLabel : {
        	                formatter: '{value}'
        	            }
        	        }
        	    ],
        	    series : [
        	        {
        	            name:'用户数',
        	            type:'line',
        	            data:[${users}],
        	            markPoint : {
        	                data : [
        	                    {type : 'max', name: '最大值'},
        	                    {type : 'min', name: '最小值'}
        	                ]
        	            },
        	            markLine : {
        	                data : [
        	                    {type : 'average', name: '平均值'}
        	                ]
        	            }
        	        },
        	        {
        	            name:'墓园数',
        	            type:'line',
        	            data:[1, -2, 2, 5, 3, 2, 0],
        	            markPoint : {
        	                data : [
        	                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
        	                ]
        	            },
        	            markLine : {
        	                data : [
        	                    {type : 'average', name : '平均值'}
        	                ]
        	            }
        	        }
        	    ]
        	};
        	          

        // 为echarts对象加载数据 
        myChart.setOption(option); 
        hangge();
    </script>
</body>
</html>
