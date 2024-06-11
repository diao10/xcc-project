<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="distM.jsp" %>
	<script type="text/javascript">
	 function  selected1() {
				 $("#div1").css("display","block");
				 $("#div2").css("display","none");
				$("#li1").removeClass().addClass("active"); 
				$("#li2").removeClass().addClass("");
				$("#li3").removeClass().addClass("");
	 }
	  function del(id) {
  		var r=confirm("是否确认删除!");
  		if (r==true){
  			 $.ajax({
  					 data:{id:id},
  					 url:"${pageContext.request.contextPath}/MemHealth/delMemHealth.do",
  					 success:function(data){
  						 location.href = '${pageContext.request.contextPath }/MemHealth/selMemHealthAll.do';
  					 }
  				 });
  		}
  		else{
  			return;
  				}
  	}
	  function sel(id) {
		  $("#div1").css("display","none");
			 $("#div2").css("display","block");
  	    $.ajax({
  					 data:{id:id},
  					 url:"${pageContext.request.contextPath}/MemHealth/selById.do",
  					 success:function(data){
  						 var d = new Date(data.memHealth.diag_Date);
  						 var date = d.toLocaleDateString(); 
  						$('#memName2').html("<b>姓名：</b>"+data.memHealth.memName);
  						 $('#diag_Date1').html("<b>诊断时间：</b>"+date);
  						 $('#diag_Ill').html("<b>诊断疾病：</b>"+data.memHealth.diag_Ill);
  						 $('#diag_Hos').html("<b>诊断医院：</b>"+data.memHealth.diag_Hos);
  						 $('#medication').html("<b>用药情况：</b>"+data.memHealth.medication);
  						 $('#diag_opinion').html("<b>诊断意见：</b>"+data.memHealth.diag_opinion);
  						$('#memName1').html("<b>姓名：</b>"+data.memHealth.memName);
 						 $('#diag_Date2').html("<b>诊断时间：</b>"+date);
 						 $('#diag_Ill1').html("<b>诊断疾病：</b>"+data.memHealth.diag_Ill);
 						 $('#diag_Hos1').html("<b>诊断医院：</b>"+data.memHealth.diag_Hos);
 						 $('#medication1').html("<b>用药情况：</b>"+data.memHealth.medication);
 						 $('#diag_opinion1').html("<b>诊断意见：</b>"+data.memHealth.diag_opinion);
  						if(data.memHealth.aegrotat_url==null||data.memHealth.aegrotat_url==""){
							 $('#div11').css("display","none");
							 $('#div22').css("display","block");
						 }else{
							 $('#div11').css("display","block");
							 $('#div22').css("display","none");
							 var imgUrl = data.memHealth.aegrotat_url.split(";"); 
							 $('#img').attr("src","${pageContext.request.contextPath}"+imgUrl[0]);
							 for(var i = 1; i < imgUrl.length; i++){
								 if(imgUrl[i].length > 0){
									 var $img = $("<img style='width: 350px;margin-top:10px;'>")
									 $img.attr("src","${pageContext.request.contextPath}"+imgUrl[i]);
									 $('#img').after($img);
								 }
							 }
						 } 
  					 }
  				 });
	}
	</script>
	<style type="text/css">
		.tyMainBody .boxg1{
			height: 1000px;
		}
		/* 页码标签颜色 */
		#list2 > .active > a
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
							<a href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do" onclick="selected1()">个人健康信息</a>
						</li>
						<li id="li2" >
							 <a href="${pageContext.request.contextPath}/MemHealth/selFamHealth.do" >家属健康信息</a> 
						</li>
						<li id="li4" >
							 <a href="${pageContext.request.contextPath}/view/memSelFamily.html" >家属基本信息</a> 
						</li>
						<li id="li3" >
							<a href="${pageContext.request.contextPath}/view/memAddHealth.html" >添加健康信息</a>
						</li>
						
					</ul>
				</div>
				<div class="right" style="overflow: auto;">
					<div class="body " id="div1" >
						<ul id="aaa1" >
						 <c:forEach items="${pageBean2.list}" var="pbList2">
							<li>
								<span><a onclick="del(${pbList2.id })" href="javascript:void(0)" type="button" class="btn  " ><span class="glyphicon glyphicon-trash"></span></a></span>
								<span style="float: right;margin-right: 30px"><fmt:formatDate value="${pbList2.diag_Date}" pattern="yyyy-MM-dd"/> </span>
								<a href="#" onclick="sel(${pbList2.id })">${pbList2.diag_Ill }</a> 
							</li>
							</c:forEach>
						</ul>
						<div class="page text-center" style="margin-top: 100px; ">
							<ul id="list2"   >
									 <li  <c:if test="${page==1}">disabled</c:if>><a onclick="down()" <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do?page=${page-1}" </c:if>>&lt;&lt; </a></li>
						   		 		<c:if test="${begin2!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin2}" end="${end2}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do?page=${i}" >${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end2!=pages2 }"><li><a>...</a></li></c:if>
						   			 <li <c:if test="${page==pages2}">disabled</c:if>><a onclick="up()" <c:if test="${page!=pages2}"> href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do?page=${page+1}" </c:if>> &gt;&gt;</a></li> 
							</ul>
						</div>
						</div>
						<div class="body " id="div2" style="display: none">
							<div id="div11" style="display: none">
									<br/><br/>
									
								<p style="margin-left: 180px;" id="p1">
									<img style="width: 350px;" id="img">
								</p>
								<ul  >
									<li><span id="memName2" style="float: left "></span></li>
									<li><span id="diag_Date1" style="float: left"></span></li>
									<li><span id="diag_Ill" style="float: left"></span></li>
									<li><span id="diag_Hos" style="float: left"></span></li>
									<li><span id="medication" style="float: left"></span></li>
									<li><span id="diag_opinion" style="float: left"></span></li>
									<li></li><li></li><li></li><li></li><li></li><li></li><li></li>
								</ul> 
							
							</div>
							<div id="div22" style="display: none">
								<ul  >
									<li><span id="memName1" style="float: left"></span></li>
									<li><span id="diag_Date2" style="float: left"></span></li>
									<li><span id="diag_Ill1" style="float: left"></span></li>
									<li><span id="diag_Hos1" style="float: left"></span></li>
									<li><span id="medication1" style="float: left"></span></li>
									<li><span id="diag_opinion1" style="float: left"></span></li>
									<li></li><li></li><li></li><li></li><li></li><li></li>
									<li></li><li></li><li></li><li></li><li></li><li></li>
									<li></li><li></li><li></li><li></li><li></li>
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