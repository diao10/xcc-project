<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="distM.jsp" %>
	<style type="text/css">
		.tyMainBody .boxg1{
			height: 1000px;
		}
		span{
		 display: inline;
		}
	</style>
</head>
<body>
		<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody">
			<div class="boxg1">
				<div class="left">
					<ul >
						<li class="active" id="li1" >
							<!-- <a href="#" onclick="selected1()">健康小贴士</a> -->
							<a>为人父母者</a>
						</li>
						<li class="active" id="li2" >
							<a>不知医为不慈</a>
						</li>
						<li class="active" id="li3" >
							<a>为人子女者</a>
						</li>
						<li class="active" id="li4" >
							<a>不知医为不孝</a>
						</li>
					</ul>
				</div>
				<div class="right" style="overflow: auto;">
						
						<div class="body " id="div2" >
						    <br/>
							<div ><h3 id="tisName" style="text-align: center;">${tis.tisName}</h3>
							</div>
							<div><span id="createTime" style=" float: right; margin-right: 60px"><fmt:formatDate value="${tis.createTime}" pattern="yyyy-MM-dd"/></span></div>
							<div id="tisContent"  style="word-wrap: break-word;margin-top: 30px;font-size: 20px;margin-left: 50px;width:620px">
							${tis.tisContent}
							</div>
							
						</div>
						</div>
			</div>
		</div>
	</div>
		<%@include file="footerForMem.jsp" %>
</body>
</html>