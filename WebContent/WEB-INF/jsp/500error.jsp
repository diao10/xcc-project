<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="distM.jsp" %>
<style type="text/css">
	.tyMainBody .errorBox{
		width: 600px;
		margin: 0 auto;
	}
	
</style>
<body>
	<div class="tyMain">
		<%@include file="headerForMem.jsp" %>
		<div class="tyMainBody">
			<div class="errorBox">
				<img style="" src="${pageContext.request.contextPath }/dist/img/500.png">
			</div>
		</div>
		<%@include file="footerForMem.jsp" %>
	</div>
</body>
</html>