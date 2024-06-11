<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
  <%@ taglib prefix="p" uri="/tyyyTag/powerTag"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<%@include file="dist.jsp" %>
<script type="text/javascript">
$(function() {
	//消息提示信息
	var msgg='${msgs}';
	msg(msgg);
	//展开列表
	currentPage("eM");
	//消息提示框
	if(msgg!=('')){
		
	miss();
	}
});


	function up() {
		var up1=$("#up").attr("value");
		$("#fpage").val(up1)
		$("#fsubmit").submit();
		
	}
	//向下翻页
	function down() {
		var down1=$("#down").attr("value");
		$("#fpage").val(down1);
		$("#fsubmit").submit();
	}
	function now(now) {
		$("#fpage").val(now);
		$("#fsubmit").submit();
	}
</script>
</head>
<body>
	<div class="bgcc">
	<%@include file="headerForEmp.jsp" %>
	<div class="tContent">
		<!-- 菜单区域 -->
		<%@include file="cLeftForEmp.jsp" %>
			<!-- 内容区域 -->
		<div class="tCright">
			<!-- 消息反馈 -->
			<div id="alert" class="tCMsg alert alert-success" role="alert">
				<span id="msg"></span>
			</div>
			<!-- 路径导航 -->
			<ol class="breadcrumb">
			  <li id="uuOne" class="active">消息管理</li>
			  <li id="uuTwo" >留言主题</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
				<form class="form-inline" id="fsubmit" action="${pageContext.request.contextPath}/theme/selThemeAll.emp" method="post">
				<input style="height:35px;" type="text" placeholder="发送人姓名" name="memberName" id="" value ="${wuer.memberName}"/>
									<input style="height:35px;" type="text" placeholder="主题名" name="theme" id="" value ="${wuer.theme}"/>
									是否阅读<select name="empFlag">
										<option value="0">请选择</option>
										<option value="1"<c:if test="${wuer.empFlag==1 }">selected="selected"</c:if>>未读 未回复</option>
										<option value="2"<c:if test="${wuer.empFlag==2 }">selected="selected"</c:if>>已读 未回复</option>
										<option value="3"<c:if test="${wuer.empFlag==3 }">selected="selected"</c:if>>已读 已回复</option>
							
									</select>
									
									<input style="height: 35px; width:20px;" hidden="hidden" type="text" placeholder="当前页" name="page" id="fpage" value="${page}"/> 
				  <button type="submit" class="btn btn-default btn-xs">
				  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找
				  </button>
				</form>
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 1000px;">
			  	<col width="50px"/><col width="400px"/><col width="80px"/><col width="80px"/><col width="150px"/><col width="240px"/>
			    <thead>
					<tr>
						<th>编号</th><th>主题 </th><th>是否已读</th><th>发送人 </th><th>发送时间</th><th>操作 </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="emp" varStatus="i">
						<tr style="height:30px;"  >
							<td >${i.index+1}</td>
							<td id="theme"><c:if test="${fn:length(emp.theme)>7}"><c:out value="${fn:substring(emp.theme, 0, 10)}..."></c:out></c:if><c:if test="${fn:length(emp.theme)<=7}">${emp.theme}</c:if></td>
							<td id="theme">
								<c:if test="${emp.empFlag==3}">已读 已回复</c:if>
								<c:if test="${emp.empFlag==2}">已读 未回复</c:if>
								<c:if test="${emp.empFlag==1}">未读 未回复</c:if>
							</td>
							<td>${emp.memberName}</td>
							<td >
								<fmt:formatDate value="${emp.createDate}" pattern="yyyy-MM-dd"/> 
							</td>
							<td class='action-td'>
								
								<a href="${pageContext.request.contextPath}/building/selBuilding.emp?id=${emp.id}" class="btn btn-info btn-sm" ><span class="glyphicon glyphicon-remove"></span>回复</a>
								<p:power authority="消息：留言主题-修改">
								<a href="${pageContext.request.contextPath}/building/selBuilding1.emp?id=${emp.id}" class="btn btn-info btn-sm" ><span class="glyphicon glyphicon-remove"></span>修改</a>
								</p:power>
								<p:power authority="消息：留言主题-删除">
								<a href="${pageContext.request.contextPath}/theme/delThemes.emp?id=${emp.id}" class="btn btn-info btn-sm" ><span class="glyphicon glyphicon-remove"></span>删除</a>
								</p:power>
							</td>
						</tr>
				    </c:forEach> 
				</tbody>
			  </table>
			</div>
			<hr>
			<!-- 分页页码 -->
			<div class="text-center">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				    <li>
				      <a  id="down" onclick="down()" <c:if test="${page!=1}"> href="#" value="${page-1}" </c:if> aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				  
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a value="${page }" id="now" onclick="now(${i})" href="#">${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
						   			
				    <li>
				      <a id="up" onclick="up()" <c:if test="${page!=pages}"> href="#" value="${page+1}" </c:if> aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
			<!-- 分页页码 end -->
		</div>	
		<!-- 内容区域 end -->
	</div>
	<%@include file="footerForEmp.jsp" %>
		
	</div>
</body>
</html>