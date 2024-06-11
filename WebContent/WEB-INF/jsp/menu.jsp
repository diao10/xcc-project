<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>天蕴药业</title>
</head>
<body>
<div id="sidebar">
			<ul>
				<li class="active"><a href="${pageContext.request.contextPath}/view/empIndex.html"><i class="icon icon-home"></i> <span>主页</span></a></li>
				<li class="submenu">
					<a href="#"><i class="iglyphicon glyphicon-th"></i> <span>表格管理</span></a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/Employee/selEmployeeAll.emp">员工表</a></li>
						<li><a href="${pageContext.request.contextPath}/view/empPower.html">权限表</a></li>
						<li><a href="${pageContext.request.contextPath}/empChar/selEmpCharAll.emp">角色表</a></li>
						<li><a href="${pageContext.request.contextPath}/Member/selMemberAll.emp">会员表</a></li>
						<li><a href="${pageContext.request.contextPath}/MemLevel/selMemLevelAll.emp">会员等级表</a></li>
						<li><a href="${pageContext.request.contextPath}/MemClass/selMemClassAll.emp">会员职阶表</a></li>
						<li><a href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.emp">会员健康表</a></li>
						<li><a href="${pageContext.request.contextPath}/MemFamily/selMemFamilyAll.emp">会员家属表</a></li>
						<li><a href="${pageContext.request.contextPath}/message/selMessage.emp">消息表</a></li>
						<li><a href="${pageContext.request.contextPath}/theme/selThemeAll.emp">主题表</a></li><!-- 待命 -->
						<li><a href="${pageContext.request.contextPath}/building/selBuildingA.emp">留言楼表</a></li>
						<li><a href="${pageContext.request.contextPath}/doctor/selDoctor.emp">医生表</a></li>
						<li><a href="${pageContext.request.contextPath}/">备用表</a></li>
					</ul>
				</li>
				<li><a href=""><i class="icon icon-th-list"></i> <span>留言板</span></a></li>
				<li><a href="${pageContext.request.contextPath}/view/employeeMyself.html"><i class="icon icon-th-list"></i> <span>个人中心</span></a></li>
			</ul>
		</div>
</body>
</html>