<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="zh-CN">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function esc() {
		var x;
		var r=confirm("是否确认退出？");
		if (r==true){
			 location.href="${pageContext.request.contextPath}/Login/employeeEsc.emp";
		}
		else{
			return;
				}
	}
</script>
</head>
<body>
	<header>
		<div style="width: 500px;"><img src="${pageContext.request.contextPath}/dist/img/logo3.jpg"/>
			<span style="font-size: 18pt;">后台管理系统</span>
		</div>
		<div style="float: right;margin-top: 20px;margin-right: 50px">
			<h4><a href="${pageContext.request.contextPath}/view/employeeMyself.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${empChar.charName},${employeeSession.emp_Name},个人码：${employeeSession.emp_Id }</a>  &nbsp;&nbsp;&nbsp;&nbsp;
				<a onclick="esc()" href="#"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出</a>
			</h4>
		</div>
	</header>
</body>
</html>