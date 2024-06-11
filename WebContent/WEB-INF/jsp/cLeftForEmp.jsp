<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="p" uri="/tyyyTag/powerTag" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
#yuanjiao{
	color: red;
	display: inline;
 }
</style>
<script type="text/javascript">
	$(function(){
		$.post("${pageContext.request.contextPath }/theme/selCount", function(data) {
		  	if(data.countg==0){
		  		$('#yuanjiao').hide();
		  	}else{
		  		$('#yuanjiao').show();
		  	}
		});
	});
</script>
</head>
<body>
	<div class="tCleft">
			<ul id="accordion" class="accordion">
				<li>
					<div id="hEmpHome" class="link"><a href="${pageContext.request.contextPath}/view/empHome.html"><span class="glyphicon glyphicon-home"></span>首页</a></div>
				</li>
				<p:power authority="会员*">
				<li>
					<div id="hEmpMInfo" class="link"><span class="glyphicon glyphicon-star-empty"></span>会员管理<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></div>
					<ul class="submenu">
						<p:power authority="会员：全查">
						<li><a href="${pageContext.request.contextPath}/Member/selMemberAll.emp">会员信息</a></li>
						</p:power>
						<p:power authority="会员：等级-全查">
						<li><a href="${pageContext.request.contextPath}/MemLevel/selMemLevelAll.emp">会员等级</a></li>
						</p:power>
						<p:power authority="会员：职阶-全查">
						<li><a href="${pageContext.request.contextPath}/MemClass/selMemClassAll.emp">会员职阶</a></li>
						</p:power>
						<p:power authority="会员：签到-全查">
						<li><a href="${pageContext.request.contextPath}/Sign/selSignAll.emp">会员签到</a></li>
						</p:power>
					</ul>
				</li>
				</p:power>
				<p:power authority="健康管理*">
				<li>
					<div id="hEmpHealth" class="link"><span class="glyphicon glyphicon-heart-empty"></span>健康管理<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></div>
					<ul class="submenu">
						<p:power authority="健康：会员信息-查询">
						<li><a href="${pageContext.request.contextPath}/Member/selMem.emp">会员信息</a></li>
						</p:power>
						<p:power authority="健康：家属信息-查询">
						<li><a href="${pageContext.request.contextPath}/MemFamily/selMemFamilyAll.emp">家属信息</a></li>
						</p:power>
						<p:power authority="健康：健康信息-查看">
						<li><a href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.emp">健康信息</a></li>
						</p:power>
					</ul>
				</li>
				</p:power>
				<p:power authority="消息管理*">
				<li>
					<div id="hEmpMsg" class="link"><span class="glyphicon glyphicon-envelope"></span>消息管理<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></div>
					<ul class="submenu">
						<p:power authority="消息：留言主题-查看">
						<li><a href="${pageContext.request.contextPath}/theme/selThemeAll.emp">留言主题 <i id="yuanjiao">●</i></a></li>
						</p:power>
						<p:power authority="消息：站内消息-查看">
						<li><a href="${pageContext.request.contextPath}/message/selMessage.emp">站内消息</a></li>
						</p:power>
					</ul>
				</li>
				</p:power>
				<p:power authority="员工*">
				<li>
					<div id="hEmpUser" class="link"><span class="glyphicon glyphicon-user"></span>员工管理<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></div>
					<ul class="submenu">
						<p:power authority="员工：全查">
						<li><a href="${pageContext.request.contextPath}/Employee/selEmployeeAll.emp">员工信息</a></li>
						</p:power>
						<p:power authority="员工：角色-查看">
						<li><a href="${pageContext.request.contextPath}/empChar/selEmpCharAll.emp">角色管理</a></li>
						</p:power>
						<p:power authority="员工：权限-查看">
						<li><a href="${pageContext.request.contextPath}/view/empPower.html">权限管理</a></li>
						</p:power>
					</ul>
				</li>
				</p:power>
				<p:power authority="信息管理*">
				<li>
					<div id="hEmpTis" class="link"><span class="glyphicon glyphicon-bell"></span>信息管理<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></div>
					<ul class="submenu">
						<p:power authority="信息：贴士-查找">
						<li><a href="${pageContext.request.contextPath}/Tis/selTisAll.emp">文章管理</a></li>
						</p:power>
						<p:power authority="信息管理：医师-查找">
						<li><a href="${pageContext.request.contextPath}/doctor/selDoctor.emp">医师信息管理</a></li>
						</p:power>
						<p:power authority="信息：图片管理">
						<li><a href="${pageContext.request.contextPath}/view/empImg.html">图片管理</a></li>
						</p:power>
						<p:power authority="信息：访问-查找">
						<li><a href="${pageContext.request.contextPath}/Fz/selFzAll.emp">访问管理</a></li>
						</p:power>
					</ul>
				</li>
				</p:power>
			</ul>
	</div>
</body>
</html>