<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>天蕴药业员工后台</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrap.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/tydist/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/tydist/css/unicorn.main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/tydist/css/unicorn.grey.css" class="skin-color" />  
		<link href='${pageContext.request.contextPath}/dist/css/fullcalendar.css' rel='stylesheet' />
		<link href='${pageContext.request.contextPath}/dist/css/fullcalendar.print.css' rel='stylesheet' media='print' />
        <script src="${pageContext.request.contextPath}/tydist/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/tydist/js/unicorn.js"></script>
        <script src="${pageContext.request.contextPath}/dist/js/jquery-3.1.1.min.js"></script>
	    <script src="${pageContext.request.contextPath}/tydist/js/bootstrap.m.js"></script>
		<script src='${pageContext.request.contextPath}/dist/js/moment.min.js'></script>
		<script src='${pageContext.request.contextPath}/dist/js/jquery.min.js'></script>
		<script src='${pageContext.request.contextPath}/dist/js/fullcalendar.min.js'></script>
		<script src='${pageContext.request.contextPath}/dist/js/zh-cn.js'></script>
		<script>

	$(document).ready(function() {

		 $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,listMonth'
								/* 月，周，日，日程表 */
			},
			defaultDate: '2017-1-12',
			navLinks: true, // can click day/week names to navigate views
			businessHours: true, // display business hours
			editable: true, 
			
			 events: [
				{
					title: '已签到',
					start: '2017-1-19',
					color: '#ee0000',
				},
				
			] 
		 }); 
		
	});
	

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: 微软雅黑;/* 设置字体 */
		font-size: 14px;
	}

	#calendar {
		max-width: 600px;
		margin: 0 auto;
	}

</style>
</head>
<body>
<div id="header" style="height:100px;">
		<div style="height:98px;width:180px;float:left;" ><img src="${pageContext.request.contextPath}/dist/img/logo3.jpg"/></div>
		</div>
	 	<div id="user-nav" style="margin-top:7px;">
               <a title=""><i class="icon icon-user"></i> <span class="text" style="font-size:15px;">欢迎  ${employeeSession.emp_Name}</span></a>
          &nbsp; <a title="" href="#"><i class="icon icon-user"></i> <span class="text" style="font-size:15px;">退出</span></a>
        </div> 
        <!-- 包含在此 -->   
		<%@ include file="menu.jsp" %> 
		<div id="content">
			<div id="content-header">
		</div>
			<div id='calendar'></div>
		</div>
	</body>
</html>
