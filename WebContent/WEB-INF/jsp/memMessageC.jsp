<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="distM.jsp" %>
<body>
		<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody">
			<div class="boxg1">
				<div class="left">
					<ul>
						<c:if test="${type==1 }">
						<li class="active">
							<a href="${pageContext.request.contextPath }/theme/selThemeAll.do">留言</a><span><c:if test="${mess!=0 }">${mess}</c:if></span>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/message/selMessage.do">站内信</a><span><c:if test="${theme!=0 }">${theme}</c:if></span>
						</li>
						</c:if>
					<c:if test="${type==2 }">
						<li class="active">
							<a href="${pageContext.request.contextPath }/theme/doctorSelThemeAll.do">留言</a><span><c:if test="${mess!=0 }">${mess}</c:if></span>
						</li>
						<li >
							<a href="${pageContext.request.contextPath }/message/doctorSelMessage.do">站内信</a><span><c:if test="${theme!=0 }">${theme}</c:if></span>
						</li>
						</c:if>
					</ul>
				</div>
				<div class="right">
					<div class="body">
						<ul>
							<c:forEach items="${list}" var="a">
						
							<li>
								<span><jsp:useBean id="timer" class="java.util.Date"/>

					<fmt:formatDate value="${a.createDate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								<c:if test="${a.flag==1 }">
									<span class="circle"></span>
								</c:if> 
							<a href="${pageContext.request.contextPath }/building/doctorSelBuilding.do?id=${a.id}">${a.theme }</a>
							</li>
						
					</c:forEach>
						</ul>
						<div class="page">
							<ul>
								
								 <li  <c:if test="${page==1}">disabled</c:if>><a <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/theme/doctorSelThemeAll.do?page=${page-1}" </c:if>>&laquo; </a></li>
					   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
					   		 		<c:forEach var="i" begin="${begin}" end="${end}">
					   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/theme/doctorSelThemeAll.do?page=${i}" >${i}</a></li>
					   				</c:forEach>
					   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
					   			 <li <c:if test="${page==pages}">disabled</c:if>><a <c:if test="${page!=pages}"> href="${pageContext.request.contextPath}/theme/doctorSelThemeAll.do?page=${page+1}" </c:if>> &raquo;</a></li>
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