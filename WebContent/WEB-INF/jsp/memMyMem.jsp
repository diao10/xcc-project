<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="distM.jsp" %>
<script src="${pageContext.request.contextPath }/dist/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/dist/js/bootstrap.min.js"></script>
	<link rel='stylesheet'  href="${pageContext.request.contextPath }/dist/css/csshake.min.css">
	<link rel='stylesheet'  href="${pageContext.request.contextPath }/dist/css/xtDate.css">
<script src="${pageContext.request.contextPath }/dist/js/xtDate.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dist/js/clock.js" type="text/javascript"></script>
<script type="text/javascript">
	

	function sel(id){
		 $("#selO").html("");
		$("#sel").css("display","none");
		$.ajax({
			data:{id:id},
			type:'post'	,
			dataType:'json',
			url:'${pageContext.request.contextPath }/Member/selMemberById.do',
			success:function(data){
				$("#selO").css("display","block");
				$("#sel").css("display","none");
				 $("#selO").append("<li>姓名："+data.mems.memName+"</li><li>个人码："+data.mems.memId+"</li><li>性别："+data.mems.memGender+"</li><li>邮箱："+data.mems.memEmail+"</li><li>电话："+data.mems.memTel+"</li><li>积分："+data.mems.memIntegral+"</li><li>职阶："+data.mems.memClassName+"</li>"
							+"<li>点数："+data.mems.memPoint+"</li><li>等级："+data.mems.memLevelName+"</li>");
				
			}
		})
		
	}
 	window.onload=function(){	
	  var aa = new xtDate(document.getElementById("xtDate")); 
		 $.ajax({
			url:'${pageContext.request.contextPath }/Member/getInsertingMem.do',
			data:{referrerId:'${memLogin.memId}',id:'${memLogin.id}'},
			dataType:'json',
			success:function(data){
				aa.tabJson = data;
				aa.init();
			}
		}); 
	 mm='${memLogin.memClassName}'
	 mn='${memLogin.memLevelName}'
	 $("#a4").find("tr").each(function () {
			if($(this).children('td:eq(2)').text()==mn){
				$(this).css("font-weight", "bold")
			}
			});
	 $("#a3").find("tr").each(function () {
			if($(this).children('td:eq(2)').text()==mm){
				$(this).css("font-weight", "bold")
			}
			});
	 if('${signs}'==2){
		 $("#signs").append("<img alt='' src='${pageContext.request.contextPath}/dist/img/signs.png'>");
	 }else{
		 $("#signs").html("");
	 }
	}
	
	function getId(id){
		$("#send").modal();
		$("#sId").val(id);
		aw1.click();
	}
</script>
<style type="text/css">
.ccca{
	width: 505px;
	height: 100%;
	margin-top: 50px;
	margin-left: 100px;
}
.cb{
	width: 505px;
	height: 100%;
	margin-top: 50px;
	margin-left: 100px;
}
	/* 页码标签颜色 */
		#pagination > .active > a
		 {
		  z-index: 2;
		  color: #2a6496;
		  cursor: default;
		  background-color: #eeeeee;
		  border-color: #eeeeee; 
		}
</style>
<body>
		<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody">
			<div class="boxg1">
				<div class="left">
					<ul>
						<li id="a7" >
							<a href="${pageContext.request.contextPath}/MemClass/selMemClassAll.do">会员签到详情</a>
						</li>
						<li id="a1" class="">
							<a href="${pageContext.request.contextPath}/MemClass/selMemClassAll.do?a=1" >会员职阶详情</a>
						</li>
						<li id="a2" class="" >
							<a href="${pageContext.request.contextPath}/MemClass/selMemClassAll.do?a=2" >会员等级详情</a>
						</li>
						<li id="aw1" class="active">
							<a href="${pageContext.request.contextPath}/MemClass/selMyMem.do" onclick="aw()">我的会员</a>
						</li>
					</ul>
				</div>
				<div class="right">
					<div class="body" >
		<div id="aw" class="body "  style="width:720px;height:800px;" >
					<ul id="sel"  >
						 <c:forEach items="${pb3.list}" var="mem">
						<li>
								<span><a onclick="sel(${mem.id })" href="javascript:void(0)" type="button" class="btn  " ><span class="glyphicon glyphicon-home">&nbsp;详情</span></a></span>
								<a href="#">${mem.memName}</a> 
							</li>
							</c:forEach>
						</ul>
						<ul id="selO" style="display:none" >
						</ul>
		<div class="page text-center" >
							<ul id="pagination"  >
									 <li  <c:if test="${page==1}">disabled</c:if>><a onclick="down()" <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/MemClass/selMyMem.do?page=${page-1}" </c:if>>&lt;&lt; </a></li>
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/MemClass/selMyMem.do?page=${i}" >${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
						   			 <li <c:if test="${page==pages}">disabled</c:if>><a onclick="up()" <c:if test="${page!=pages}"> href="${pageContext.request.contextPath}/MemClass/selMyMem.do?page=${page+1}" </c:if>> &gt;&gt;</a></li> 
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