<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>天蕴药业</title>
<style type="text/css">
 /* .body1{
 	 margin: 0 auto;
 	 font-family:黑体;
 	 font-size:20px;
 	 text-align:center;
 	 width: 720px;
 	 margin-top: 20%;
 	 height: 200px

 } */
 .tyMain .tyMainBody .right .header1{
 	 width: 720px;
 	 height: 100px;
 	 background-color: white;
 	 text-align: center;

 }
 .tyMain .tyMainBody .right .body1{
  	 font-family:黑体;
 	 font-size:20px;
 	 width: 720px;
 	 height: 400px;
 	 background-color: white;
 	 text-align: center;
	 margin: 0 auto;
	 margin-top: 100px;
 }
 .tyMain .tyMainBody .right .foot1 a{
 	 width: 50px;
 	 height: 50px;
 	 background-color: white;
 	 text-align: center;
	 margin-top 200px;
	 margin-left: 670px;
 }

</style>
<script type="text/javascript">
function f1(id) {
	$("#div1").css("display","none");
	$("#div2").css("display","block")
	
	$.ajax({
		data:{id:id},
		url:"${pageContext.request.contextPath }/message/selMessageById.do",
		success:function(data){
			
			$("#div4").text(data.mess.theme);
			
		}
		
	})
}


</script>
<%@include file="distM.jsp" %>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
		<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody">
			<div class="boxg1">
				<div class="left">
					<ul>
						<c:if test="${type==1}">
						<li >
							<a href="${pageContext.request.contextPath }/theme/selThemeAll.do">留言</a><span><c:if test="${theme!=0 }">${theme}</c:if></span>
						</li>
						<li class="active">
							<a href="${pageContext.request.contextPath }/message/selMessage.do">站内信</a><span><c:if test="${mess!=0 }">${mess}</c:if></span>
						</li>
						</c:if>
						<c:if test="${type==2 }">
						<li >
							<a href="${pageContext.request.contextPath }/theme/doctorSelThemeAll.do">留言</a><span><c:if test="${theme!=0 }">${theme}</c:if></span>
						</li>
						<li class="active">
							<a href="${pageContext.request.contextPath }/message/doctorSelMessage.do">站内信</a><span><c:if test="${mess!=0 }">${mess}</c:if></span>
						</li>
						</c:if>
					</ul>
				
				</div>
				<div class="right">
					 <div class="body" id = "div1">
						<ul>
							<c:forEach items="${list}" var="a">
						
							<li>
								<span><jsp:useBean id="timer" class="java.util.Date"/>

					<fmt:formatDate value="${a.createDate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								<c:if test="${a.flag==1 }">
									<span class="circle"></span>
								</c:if> 
							<a onclick="f1(${a.id})">${a.mess_theme }</a>
							</li>
						
					</c:forEach>
						</ul>
						<div class="page">
							<ul>
								
								  <li  <c:if test="${page==1}">disabled</c:if>><a <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/message/docotrSelMessage.do?page=${page-1}" </c:if>>&laquo; </a></li>
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/message/docotrSelMessage.do?page=${i}" >${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
						   			 <li <c:if test="${page==pages}">disabled</c:if>><a <c:if test="${page!=pages}"> href="${pageContext.request.contextPath}/message/docotrSelMessage.do?page=${page+1}" </c:if>> &raquo;</a></li>
							</ul>
						</div>
					</div>
					<div class="body" id = "div2" style="display: none">
							<div  class="header1">
								
							</div>
							<div id ="div4" class="body1">
							
							</div>
							<div  class="foot1">
								<a href='${pageContext.request.contextPath }/message/doctorSelMessage.do'>返回</a>
							</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
		<%@include file="footerForMem.jsp" %>
</body>
</html>