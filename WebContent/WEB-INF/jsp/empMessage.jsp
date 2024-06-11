<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="p" uri="/tyyyTag/powerTag"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@include file="dist.jsp"%>
<script type="text/javascript">
$(function() {
	//消息提示信息
	var msgg='${msgs}';
	msg(msgg);
	//展开列表
	
	currentPage("eM");
	//消息提示框
	if(msgg!=equals('')){
		
	miss();
	}
});
function sel(id){
	var a = id;
	$.ajax({
		data:{id:a},
		url:"${pageContext.request.contextPath}/message/selMessageById.emp",
		success:function(data){
		
			$("#mess_theme007").val(data.map.mess_theme);
			
			$("#theme007").val(data.map.theme);
		
		}
	}) 
	
}
function up1(id){
	var a = id;
	$.ajax({
		data:{id:a},
		url:"${pageContext.request.contextPath}/message/selMessageById.emp",
		success:function(data){
			$("#id007").val(a);
			$("#accpName").val(data.map.accpName);
			$("#mess_theme").val(data.map.mess_theme);
			$("#theme").val(data.map.theme);
		}
	}) 
}

function sendMsg(){
	$.ajax({
		url:"${pageContext.request.contextPath}/message/sendMsgPage.emp",
		success:function(data){
			$("#leavel").empty();
			$("#leavel").append($("<option>请选择级别</option>"));
			$("#member").empty();
			$("#member").append($("<option>请选择会员</option>"));
			for(var i = 0; i < data.list.length; i++){
				$option = $("<option value='" + data.list[i].id + "'>" + data.list[i].levelName + "</option>")
				$("#leavel").append($option);
			}
		}
	});
}

function changeLvl(lvl) {
	if(isNaN(lvl)){
		$("#member").empty();
		$("#member").append($("<option>请选择会员</option>"));
		return;
	}
	$.ajax({
		data:{lid:lvl},
		url:"${pageContext.request.contextPath}/message/changeMemLvl.emp",
		success:function(data){
			$("#member").empty();
			$("#member").append($("<option>请选择会员</option>"));
			for(var i = 0; i < data.list.length; i++){
				$option = $("<option value='" + data.list[i].id + "'>" + data.list[i].memName + "</option>")
				$("#member").append($option);
			}
		}
	});
}

function send(){
	if($("#member").val() == "" || $("#member").val() == "请选择会员"){
		alert("请选择会员");
		return false;
	}
	if($("#send_mess_theme").val() == ""){
		alert("请填写主题");
		return false;
	}
	if($("#send_theme").val() == ""){
		alert("请填写内容");
		return false;
	}
	return true;
}

function deleteMsg(id){
	var uri = "${pageContext.request.contextPath}/message/delete.emp?id=" + id;
	if(confirm("确认要删除吗?")){
		window.location.href = uri;
	}
}
	function up() {
		var up=$("#up").attr("value");
		$("#fpage").val(up)
		$("#fsubmit").submit();
		
	}
	//向下翻页
	function down() {
		var down=$("#down").attr("value");
		$("#fpage").val(down);
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
		<%@include file="headerForEmp.jsp"%>
		<div class="tContent">
			<!-- 菜单区域 -->
			<%@include file="cLeftForEmp.jsp"%>
			<!-- 内容区域 -->
			<div class="tCright">
				<!-- 消息反馈 -->
				<div id="alert" class="tCMsg alert alert-success" role="alert">
					<span id="msg"></span>
				</div>
				<!-- 路径导航 -->
				<ol class="breadcrumb">
					<li id="uuOne" class="active">消息管理</li>
					<li id="uuTwo">站内消息</li>
				</ol>
				<!-- 查询条 -->
				<div style="margin-left: 30px;">
					<form class="form-inline" id="fsubmit"
						action="${pageContext.request.contextPath}/message/selMessage.emp"
						method="post">
						<input style="height: 35px;" type="text" placeholder="收信人姓名"
							name="accpName" id="" value="${mess.accpName }" /> <input
							style="height: 35px;" type="text" placeholder="发信人姓名"
							name="messMemName" id="" value="${mess.messMemName }" /> <input
							style="height: 35px;" type="text" placeholder="主题"
							name="mess_theme" id="" value="${mess.mess_theme }" />
							<!--  是否阅读<select
							name="flag">
							<option value="2">请选择</option>
							<option value="0"
								<c:if test="${mess.flag==0 }">selected="selected"</c:if>>未读</option>
							<option value="1"
								<c:if test="${mess.flag==1 }">selected="selected"</c:if>>已读</option>
							 -->
						</select> <input style="height: 35px; width: 20px;" hidden="hidden"
							type="text" placeholder="当前页" name="page" id="fpage"
							value="${page}" />

						<button type="submit" class="btn btn-default btn-xs">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							查找
						</button>
						<button type="button" onclick="sendMsg();" class="btn btn-default btn-xs"
							data-toggle="modal" data-target="#amyModaSend">
							<span class="glyphicon glyphicon-tint"></span> 发送站内信
						</button>
					</form>
				</div>
				<hr>
				<div class="tCtableDiv clear">
					<table class="table-bordered table-hover tCtable"
						style="width: 1000px;">
						<col width="30px" />
						<col width="70px" />
						<col width="70px" />
						 <col width="230px" /> 
						<!--<col width="70px" />-->
						<col width="100px" />
						<col width="150px" />
						<thead>
							<tr>
								<th>编号</th>
								<th>发信人</th>
								<th>收信人</th>
								<th>主题</th>
								<!-- <th>是否阅读</th>  -->
								<th>创建日期</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="mess" varStatus="i">
								<tr style="height: 30px;">
									<td>${i.count}</td>
									<td>${mess.messMemName}</td>
									<td>${mess.accpName}</td>
									<td>${mess.mess_theme}</td>
									<!-- <td>
										<c:if test="${mess.flag==0 }">未读</c:if> 
										<c:if test="${mess.flag==1 }">已读</c:if>
									</td> -->
									<td>
										<fmt:formatDate value="${mess.createDate}" pattern="yyyy-MM-dd" />
									</td>
									<td class='action-td'>
										<button onclick="sel(${mess.id})"
											class="btn btn-primary btn-sm" data-toggle="modal"
											data-target="#amyModal">
											<span class="glyphicon glyphicon-edit"></span>查看
										</button> 
										<p:power authority="消息：站内消息-删除">
											<a href="javascript:;"
												class="btn btn-info btn-sm" onclick="deleteMsg(${mess.id })">
												<span class="glyphicon glyphicon-remove"></span>删除
											</a>
										</p:power> 
										<p:power authority="消息：站内消息-修改">
											<button onclick="up1(${mess.id})"
												class="btn btn-primary btn-sm" data-toggle="modal"
												data-target="#amyModal2">
												<span class="glyphicon glyphicon-edit"></span>修改
											</button>
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
							<li><a id="down" onclick="down()"
								<c:if test="${page!=1}"> href="#" value="${page-1}" </c:if>
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>

							<c:if test="${begin!=1 }">
								<li><a>...</a></li>
							</c:if>
							<c:forEach var="i" begin="${begin}" end="${end}">
								<li <c:if test="${i==page }">class="active"</c:if>><a
									value="${page }" id="now" onclick="now(${i})" href="#">${i}</a></li>
							</c:forEach>
							<c:if test="${end!=pages }">
								<li><a>...</a></li>
							</c:if>

							<li><a id="up" onclick="up()"
								<c:if test="${page!=pages}"> href="#" value="${page+1}" </c:if>
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
				<!-- 分页页码 end -->
			</div>
			<!-- 内容区域 end -->
		</div>
		<%@include file="footerForEmp.jsp"%>
		<!-- 修改模态框 -->
		<div class="modal fade" id="amyModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<button type="button" style="margin-top: 10px; margin-right: 10px"
						class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<form id="formNewsletter"
						action="${pageContext.request.contextPath}/message/update.emp"
						accept-charset="utf-8" method="post">
						<div class="modal-header vertical-center">
							<h1 class="modal-title text-center" id="myModalLabel">修改信息</h1>
						</div>
						<input type="hidden" id="id007" name="id">

						<div class="modal-body vertical-center">
							<div class="row">
								<div class="col-sm-12 form-col form-col--first form-col--last">
									<div class="form-group">
										<label class="form-label" for="nameRoEmail">主题:</label> <input
											class="form-control " type="text" id="mess_theme"
											name="mess_theme" value="" placeholder="主题">

									</div>
								</div>
							</div>
						</div>
						<div class="modal-body vertical-center">
							<div class="row">
								<div class="col-sm-12 form-col form-col--first form-col--last">
									<div class="form-group">
										<label class="form-label" for="nameRoEmail">内容:</label>
										<!-- <input " type="text"  id="theme" name="theme" value="" placeholder="内容"> -->
										<textarea class="form-control" id="theme" name="theme"
											value="" placeholder="内容"></textarea>
									</div>
								</div>
							</div>
						</div>

						<div class="modal-footer vertical-center"
							style="width: 500px; margin-left: 45px;">
							<div>
								<button id="" class="btn btn-primary" type="submit">确认</button>
								<a data-dismiss="modal" class="btn btn-info " href="#">Cancel</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 查看模态框 -->
		<div class="modal fade" id="amyModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<button type="button" style="margin-top: 10px; margin-right: 10px"
						class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<div class="modal-header vertical-center">
						<h1 class="modal-title text-center" id="myModalLabel">查看信息</h1>
					</div>

					<div class="modal-body vertical-center">
						<div class="row">
							<div class="col-sm-12 form-col form-col--first form-col--last">
								<div class="form-group">
									<label class="form-label" for="nameRoEmail">主题:</label> <input
										class="form-control " type="text" id="mess_theme007"
										name="mess_theme007" value="" placeholder="主题"
										readonly="readonly">

								</div>
							</div>
						</div>
					</div>
					<div class="modal-body vertical-center">
						<div class="row">
							<div class="col-sm-12 form-col form-col--first form-col--last">
								<label class="form-label" for="nameRoEmail">内容:</label>
								<textarea class="form-control" id="theme007" name="theme007"
									value="" placeholder="内容" readonly="readonly"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 发送站内信 -->
		<div class="modal fade" id="amyModaSend" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<button type="button" style="margin-top: 10px; margin-right: 10px"
						class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<form id="formNewsletter"
						action="${pageContext.request.contextPath}/message/add.emp"
						accept-charset="utf-8" method="post" onsubmit="return send();">
						<div class="modal-header vertical-center">
							<h1 class="modal-title text-center" id="myModalLabel">发送信息</h1>
						</div>
						<div class="modal-body vertical-center">
							<div class="row">
								<div class="col-sm-12 form-col form-col--first form-col--last">
									<div class="form-group">
										<label class="form-label" for="nameRoEmail">级别:</label>
										<select style="width: 130px;" onchange="changeLvl(this.value);"
											class="form-control " id="leavel">
											<option>请选择级别</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-body vertical-center">
							<div class="row">
								<div class="col-sm-12 form-col form-col--first form-col--last">
									<div class="form-group">
										<label class="form-label" for="nameRoEmail">会员:</label>
										<select style="width: 130px;" class="form-control " id="member" name="memId">
											<option>请选择会员</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-body vertical-center">
							<div class="row">
								<div class="col-sm-12 form-col form-col--first form-col--last">
									<div class="form-group">
										<label class="form-label" for="nameRoEmail">主题:</label> <input
											class="form-control " type="text" id="send_mess_theme"
											name="mess_theme" value="" placeholder="主题">

									</div>
								</div>
							</div>
						</div>
						<div class="modal-body vertical-center">
							<div class="row">
								<div class="col-sm-12 form-col form-col--first form-col--last">
									<div class="form-group">
										<label class="form-label" for="nameRoEmail">内容:</label>
										<!-- <input " type="text"  id="theme" name="theme" value="" placeholder="内容"> -->
										<textarea class="form-control" id="send_theme" name="theme"
											value="" placeholder="内容"></textarea>
									</div>
								</div>
							</div>
						</div>

						<div class="modal-footer vertical-center"
							style="width: 500px; margin-left: 45px;">
							<div>
								<button id="" class="btn btn-primary" type="submit">确认</button>
								<a data-dismiss="modal" class="btn btn-info " href="#">Cancel</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>