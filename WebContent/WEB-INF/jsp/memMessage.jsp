<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>天蕴私人医生管家</title>
<style type="text/css">
 .circle {
	margin-top:22px;
	float: left;
	display:block;
    width: 5px;
    height: 5px;
    background: red;
    -moz-border-radius: 2.5px;
    -webkit-border-radius: 2.5px;
    border-radius: 2.5px;
}
</style>
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
							<a href="${pageContext.request.contextPath }/theme/selThemeAll.do">咨询回复</a><%-- <span ><c:if test="${mess!=0 }">${mess}</c:if></span>--%>
						</li>
						
						<li>
							<a href="${pageContext.request.contextPath }/doctor/selDoctor.do">专家咨询</a>
						</li>
						</c:if>
						<c:if test="${type==2 }">
						<li class="active">
							<a href="${pageContext.request.contextPath }/theme/doctorSelThemeAll.do">咨询回复</a><span ><c:if test="${theme!=0 }">${theme}</c:if></span>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/message/doctorSelMessage.do">站内信</a><span><c:if test="${mess!=0 }">${theme}</c:if></span>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/doctor/selDoctor.do">专家咨询</a>
						</li>
						</c:if>
					</ul>
				</div>
				<div class="right">
					<div class="body">
						<ul>
							<c:forEach items="${list}" var="a">
						
							<li>
								<span style="float: right;margin-right: 30px"><jsp:useBean id="timer" class="java.util.Date"/>
								<fmt:formatDate value="${a.createDate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								<a href="${pageContext.request.contextPath }/building/selBuilding.do?sid=${a.id}">
									<c:if test="${a.flag==1 }">
										<span class="circle" style="float: left;"></span>&nbsp;
									</c:if> 		
									<c:if test="${fn:length(a.theme)>15}">
										(${a.rname })<c:out value="${fn:substring(a.theme, 0, 15)}..."></c:out>
									</c:if>
									<c:if test="${fn:length(a.theme)<=15}">  
	         							(${a.rname })${a.theme}
	   								</c:if> 
	               				</a>
							</li>
					</c:forEach>
						</ul>
						<c:if test="${page!=0}">
						<div class="page">
							<ul>
								
								 <li  <c:if test="${page==1}">disabled</c:if>><a <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/theme/selThemeAll.do?page=${page-1}" </c:if>>&laquo; </a></li>
					   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
					   		 		<c:forEach var="i" begin="${begin}" end="${end}">
					   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/theme/selThemeAll.do?page=${i}" >${i}</a></li>
					   				</c:forEach>
					   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
					   			 <li <c:if test="${page==pages}">disabled</c:if>><a <c:if test="${page!=pages}"> href="${pageContext.request.contextPath}/theme/selThemeAll.do?page=${page+1}" </c:if>> &raquo;</a></li>
							</ul>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@include file="footerForMem.jsp" %>
</body>
</html>
