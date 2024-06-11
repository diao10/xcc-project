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
	#pagination > .active > a
		 {
		  z-index: 2;
		  color: #2a6496;
		  cursor: default;
		  background-color: #eeeeee;
		  border-color: #eeeeee; 
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
				<div class="right" style="overflow: auto-y;">
					<div class="body " id="div1" >
						<ul id="aaa1" >
						 <c:forEach items="${pb.list}" var="pb">
							<li>
								<span style="float: right;margin-right: 25px"><fmt:formatDate value="${pb.createTime}" pattern="yyyy-MM-dd"/> </span>
								<a href="${pageContext.request.contextPath}/Tis/selTisById.do?id=${pb.id }">${pb.tisName}</a> 
							</li>
							</c:forEach>
						</ul>
						<div class="page text-center" style="margin-top: 100px; ">
							<ul id="pagination" >
									 <li  <c:if test="${page==1}">disabled</c:if>><a onclick="down()" <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/Tis/selTis.do?page=${page-1}" </c:if>>&lt;&lt; </a></li>
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/Tis/selTis.do?page=${i}" >${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
						   			 <li <c:if test="${page==pages}">disabled</c:if>><a onclick="up()" <c:if test="${page!=pages}"> href="${pageContext.request.contextPath}/Tis/selTis.do?page=${page+1}" </c:if>> &gt;&gt;</a></li> 
							</ul>
						</div>
						</div>
						</div>
			</div>
		</div>
	</div>
		<%@include file="footerForMem.jsp" %>
	
</body>
</html>