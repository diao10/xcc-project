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
	
	</style>
	<script type="text/javascript">
	 window.onload=function(){
		 var id = '${memLogin.id }'; 
		 var level = '${memLogin.memClass }';
		   $.ajax({
			 data:{id:id},
			url:"${pageContext.request.contextPath}/MemFamily/selMemFamilyAll.do",
			success:function(data){
				if(data.htmlName=="mh"){
					$("#mh").addClass("active");
					$("#indexs").removeClass("active");
				}
				  var len = data.memFamily.length;
				  if(level<9){
				for (var int = 0; int < len; int++) {
				  var d = new Date(data.memFamily[int].famBirth);
					 var date = d.toLocaleDateString(); 
					
					$("#div4").append("<div  style='border: 1px solid black;width:250px;height:150px;margin-top: 30px;margin-left: 70px;float:left'><div style='margin-left:180px;margin-top:1px;height:30px;width:20px;'><a onclick='del2("+data.memFamily[int].id+")' href='javascript:void(0)' type='button' class='btn'><span class='glyphicon glyphicon-trash'></span></a></div><ul style='margin-top:0px;'><li style='width:200px; '>姓名："+data.memFamily[int].famName+"</li><li style='width:200px;'>性别："+data.memFamily[int].famGender+"</li><li style='width:200px;'>出生日期："+date+"</li></ul></div>")
				}
				var dd = level-len;
				if(dd!=0){
					for (var int2 = 0; int2 <dd; int2++) {
						$("#div4").append("<div  style='border: 1px solid black;width:250px;height:150px;margin-top: 30px;margin-left: 70px;float:left'><div style='margin-left:180px;margin-top:1px;height:20px;width:20px;'><a onclick='sss()' href='javascript:void(0)' type='button' class='btn'><span class='glyphicon glyphicon-plus'></span></a></div><ul style='margin-top:0px;'><li style='width:180px;'></li><li style='width:180px;'></li><li style='width:180px;'></li>")
					}
				}
				  }
			 }
			
		
		});
	 }
	 
	 function sss() {
		 location.href = '${pageContext.request.contextPath }/view/memAddFamily.html';
	}
	 function del2(id) {
 		var r=confirm("是否确认删除!");
 		if (r==true){
 			 $.ajax({
 					 data:{id:id},
 					 url:"${pageContext.request.contextPath}/MemFamily/delMemFamily.do",
 					 success:function(data){
 						location.href = '${pageContext.request.contextPath }/view/memSelFamily.html';
 						
 					 }
 				 });
 		}
 		else{
 			return;
 				}
 		
 		
 	}
	
	</script>
</head>
<body>
		<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody">
			<div class="boxg1">
				<div class="left">
					<ul >
						<li  id="li1" >
							<a href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do" >个人健康信息</a>
						</li>
						<li id="li2" >
							 <a href="${pageContext.request.contextPath}/MemHealth/selFamHealth.do" >家属健康信息</a> 
						</li>
						<li id="li4" class="active">
							 <a href="#" onclick="selected4()">家属基本信息</a> 
						</li>
						<li id="li3" >
							<a href="${pageContext.request.contextPath}/view/memAddHealth.html">添加健康信息</a>
						</li>
						
					</ul>
				</div>
				<div class="right">
						
						<div class="body" id="div4" >
					<div style="margin-left:2%; font-size:20px;margin-top:15px;width:690px;height:40px;">家属基本信息</div>
						<div style="margin-left:2%;border:1px solid black;margin-top:5px;width:690px;height:1px;"></div>
							
						</div> 
						
					</div>
					
				
			</div>
		</div>
	</div>
		<%@include file="footerForMem.jsp" %>
	
</body>
</html>