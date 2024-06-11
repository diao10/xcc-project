 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
 <%@ taglib prefix="p" uri="/tyyyTag/powerTag"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>

<style type="text/css">
		/* 页码标签颜色 */
		.pagination > .active > a
		 {
		  z-index: 2;
		  color: #2a6496;
		  cursor: default;
		  background-color: #eeeeee;
		  border-color: #eeeeee; 
		}

	
	</style>

<script type="text/javascript">
$(function() {
	//消息提示信息
	var msgg='${msg}';
	msg(msgg);
	//展开列表
	currentPage("eB");
	
});

//删除方法
function del(id) {

	var x;
	var r=confirm("是否确认删除!");
	if (r==true){
					 location.href = '${pageContext.request.contextPath}/Member/delMember.emp?id='+id;
	}
	else{
		return;
			}
}
//时间转换格式
			Date.prototype.format =function(format){
				var o = {
				"M+" : this.getMonth()+1, //month
				"d+" : this.getDate(), //day
				"h+" : this.getHours(), //hour
				"m+" : this.getMinutes(), //minute
				"s+" : this.getSeconds(), //second
				"q+" : Math.floor((this.getMonth()+3)/3), //quarter
				"S" : this.getMilliseconds() //millisecond
			}
				if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
				(this.getFullYear()+"").substr(4- RegExp.$1.length));
				for(var k in o)if(new RegExp("("+ k +")").test(format))
				format = format.replace(RegExp.$1,
				RegExp.$1.length==1? o[k] :
				("00"+ o[k]).substr((""+ o[k]).length));
				return format;
			}

//修改方法
function edit(id,see) {
	if(see==1){
		$('#myModalLabelsee').text("修改会员信息");		
	}
	 $('#fd').find("input").removeAttr("disabled",true);
	$('#fd').find("textarea").removeAttr("readonly","true");
	$('#fd').find("select").attr("disabled",false);
	$("#trueA").css("display","block");
	$("#q").html("");	 
		 $.ajax({
				 data:{id:id},
				 url:"${pageContext.request.contextPath}/Member/selMemberById.emp",
				 success:function(data){
					/*  var d= new Date(data.mem.memBirth);
					 var date=d.toLocaleDateString(); */
					var date1=new Date(data.mem.memBirth).format("yyyy-MM-dd");
					$("#q").append("<input id='aid' name='id' style='display:none' />")
				 	$("#aid").val(data.mem.id),
				 $("#amemName").val(data.mem.memName),
				 $("#amemPwd").val(data.mem.memPwd),
				 $("#areferrerId").val(data.mem.referrerId),
				 $("#amemGender").val(data.mem.memGender),
				 $("#amemEmail").val(data.mem.memEmail),
				 $("#amemTel").val(data.mem.memTel),
				 $("#amemBirth").val (date1),
				 $("#amemAddress").val(data.mem.memAddress),
				 $("#amemIntegral").val(data.mem.memIntegral),
				 $("#amemPoint").val(data.mem.memPoint),
				 $("#afiled1").val(data.mem.filed1),
				 $("#afiled2").val(data.mem.filed2),
				 $("#amemLevel").val(data.mem.memClass);
				 }
			 })
}
function see(id,see) {
	if(see==2){
	$('#myModalLabelsee').text("查看会员信息");		
	}
	$('#fd').find("input").attr("disabled",true);
	$('#fd').find("textarea").attr("readonly","true");
	$('#fd').find("select").attr("disabled",true);
	$("#trueA").css("display","none");
	 $.ajax({
			 data:{id:id},
			 url:"${pageContext.request.contextPath}/Member/selMemberById.emp",
			 success:function(data){
				/*  var d= new Date(data.mem.memBirth);
				 var date=d.toLocaleDateString(); */
				var date1=new Date(data.mem.memBirth).format("yyyy-MM-dd");
				$("#q").append("<input id='aid' name='id' style='display:none' />")
			 	$("#aid").val(data.mem.id),
			 $("#amemName").val(data.mem.memName),
			 $("#amemPwd").val(data.mem.memPwd),
			 $("#areferrerId").val(data.mem.referrerId),
			 $("#amemGender").val(data.mem.memGender),
			 $("#amemEmail").val(data.mem.memEmail),
			 $("#amemTel").val(data.mem.memTel),
			 $("#amemBirth").val (date1),
			 $("#amemAddress").val(data.mem.memAddress),
			 $("#amemIntegral").val(data.mem.memIntegral),
			 $("#amemPoint").val(data.mem.memPoint)
			 }
		 })
}
//修改积分
function saveI(id) {
		 $.ajax({
				 data:{id:id},
				 url:"${pageContext.request.contextPath}/Member/selMemberById.emp",
				 success:function(data){
					$("#qqqq").append("<input id='iid' name='id' style='display:none' />")
				 $("#iid").val(data.mem.id),
				 $("#imemName").val(data.mem.memName),
				 $("#ireferrerId").val(data.mem.referrerId),
				 $("#imemIntegral").val(data.mem.memIntegral),
				 $("#imemPoint").val(data.mem.memPoint),
				 $("#imemClass").val(data.mem.memClass)
				 }
			 })
}
//发送站内信
function send(id) {

	 $.ajax({
		 data:{id:id},
		 url:"${pageContext.request.contextPath}/Member/selMemberById.emp",
		 success:function(data){
		 $("#memId").val(data.mem.id),
		 $("#semp_Name").val(data.mem.memName),
		 $("#semp_Id").val(data.mem.id);
		 }
	 })
}
//向上翻页
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
//当前页
function now(now) {
	$("#fpage").val(now);
	$("#fsubmit").submit();
}
//时间排序
function date_desc4() {
	var date_desc4=$("#date_desc4").attr("value");
	alert(date_desc4);
	$("#dete_desc").val(date_desc4);
	$("#fsubmit").submit();
}
//姓名排序
function desc_Type2() {
	var desc_Type2=$("#desc_Type2").attr("value");
	$("#fdesc_Type").val(desc_Type2);
	$("#fsubmit").submit();
}

//添加
var memName;
var memEmail;
var memTel;
var memPwd;
var referrerId;
var f=new Array();
for (var j = 0; j <5; j++) {
	f[j]=false;
}
//姓名验证	    
function nameValidate(){
	memName = $('#memName');
	if(memName.val() == ""){
		f[0] = false;
		$("#memNames").html("姓名不能为空！");
	}else{
		f[0] = true;
		$("#memNames").html("");
	}
}
//邮箱验证
function emailValidate(){
	memEmail = $('#memEmail');
	var patrn= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.)+([a-zA-Z0-9_-])+/; 
	if(memEmail.val()==""){
		f[1]=false;
		$("#memEmails").html("邮箱不能为空！");
	}else{
	if(!patrn.test(memEmail.val())){
		f[1] =false;
		$("#memEmails").html("邮箱格式不正确！");
	}else{
		$.ajax({
			url:'${pageContext.request.contextPath}/Member/emailT.emp',
			data:{email:memEmail.val()},
			type:'post',
			dataType:'text',
			success:function(data){
				if(data == "ok"){
					f[1] = true;
					$("#memEmails").html("");
				}else{
					f[1] =false;
					$("#memEmails").html("邮箱重复！");
				}
			}
		})
	}
	}
}
//电话验证
function telValidate(){
	memTel = $('#memTel');
	var patrn= /^[0-9]{11}$/; 
	if(memTel.val()==""){
		f[2]=false;
		$("#memTels").html("电话不能为空！");
	}else{
	if(!patrn.exec(memTel.val())){
		f[2] =false;
		$("#memTels").html("电话格式不正确！");
	}else{
		f[2] = true;
		$("#memTels").html("");
	}
	}
}
//密码验证
function pwdValidate(){
	memPwd = $('#memPwd');
	if(memPwd.val() == ""){
		f[3] =false;
		$("#memPwds").html("密码不能为空！");
	}else{
			f[3] = true;
			$("#memPwds").html("");
		}
}
//推荐码验证
function referrerValidate(){
	referrerId = $('#referrerId');
	if(referrerId.val()==""){
		f[4]=false;
		$("#referrerIds").html("推荐码不能为空！");
	}else{
	$.ajax({
		url:'${pageContext.request.contextPath}/Member/referrerIdT.emp',
		data:{referrer:referrerId.val()},
		type:'post',
		dataType:'text',
		success:function(data){
			if(data == "ok"){
				f[4] =true;
				$("#referrerIds").html("");
			}else{
				f[4] =false;
				$("#referrerIds").html("推荐码不存在！");
			}
		}
	})
	}
}

//提交验证
function ft() {
	for (var j = 0;j <f.length; j++) {
		if(!f[j]){
			return false;
		}				
	}
	return true;
}
//修改
var amemName;
var amemEmail;
var amemTel;
var amemPwd;
var areferrerId;
var e=new Array();
for (var i = 0; i <5; i++) {
	e[i]=false;
}
//姓名验证	    
function amemNames(){
	amemName = $('#amemName');
	if(amemName.val() == ""){
		e[0] = false;
		$("#amemNames").html("姓名不能为空！");
	}else{
		e[0] = true;
		$("#amemNames").html("");
	}
}
//邮箱验证
function amemEmails(){
	amemEmail = $('#amemEmail');
	var patrn= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.)+([a-zA-Z0-9_-])+/; 
	if(amemEmail.val()==""){
		e[1]=false;
		$("#amemEmails").html("邮箱不能为空！");
	}else{
	if(!patrn.test(amemEmail.val())){
		e[1] =false;
		$("#amemEmails").html("邮箱格式不正确！");
	}else{
		$.ajax({
			url:'${pageContext.request.contextPath}/Member/emailU.emp',
			data:{email:amemEmail.val()},
			type:'post',
			dataType:'text',
			success:function(data){
				if(data == "ok"){
					e[1] = true;
					$("#amemEmails").html("");
				}else{
					e[1] =false;
					$("#amemEmails").html("邮箱重复！");
				}
			}
		})
	}
	}
	
}
//电话验证
function amemTels(){
	amemTel = $('#amemTel');
	var patrn= /^[0-9]{11}$/; 
	if(amemTel.val()==""){
		e[2]=false;
		$("#amemTels").html("电话不能为空！");
	}else{
	if(!patrn.exec(amemTel.val())){
		e[2] =false;
		$("#amemTels").html("电话格式不正确！");
	}else{
		e[2] = true;
		$("#amemTels").html("");
	}
	}
}
//密码验证
function amemPwds(){
	amemPwd = $('#amemPwd');
	if(amemPwd.val() == ""){
		e[3] =false;
		$("#amemPwds").html("密码不能为空！");
	}else{
			e[3] = true;
			$("#amemPwds").html("");
		}
}
//推荐码验证
function areferrerIds(){
	areferrerId = $('#areferrerId');
	if(areferrerId.val()==""){
		e[4]=false;
		$("#areferrerIds").html("推荐码不能为空！");
	}else{
	$.ajax({
		url:'${pageContext.request.contextPath}/Member/referrerIdT.emp',
		data:{referrer:areferrerId.val()},
		type:'post',
		dataType:'text',
		success:function(data){
			if(data == "ok"){
				e[4] =true;
				$("#areferrerIds").html("");
			}else{
				e[4] =false;
				$("#areferrerIds").html("推荐码不存在！");
			}
		}
	})
	}
}

//提交验证
function ftt() {
	amemNames();
	amemEmails();
	amemTels();
	amemPwds();
	areferrerIds(); 
	for (var i = 0; i <e.length; i++) {
		if(!e[i]){
			return false;
		}				
	return true;
	}
	
}
//判断显示按钮
window.onload=function(){
	if('${desc_Type}'==2){
		$("#descname").append("<a href='#'  id='desc_Type2'  class='glyphicon glyphicon-arrow-down' value='1' onclick='desc_Type2()'  style='cursor:pointer;'></a>")
	}else{
		$("#descname").append("<a href='#'  id='desc_Type2'  class='glyphicon glyphicon-arrow-up' value='2' onclick='desc_Type2()'  style='cursor:pointer;'></a>")
	}
	if('${date_desc}'==4){
		$("#datedesc").append("<a href='#' id='date_desc4' onclick='date_desc4()' value='3' class='glyphicon glyphicon-arrow-down'  style='cursor:pointer;'></a>")	
	}else{
		$("#datedesc").append("<a href='#' id='date_desc4' onclick='date_desc4()' value='4' class='glyphicon glyphicon-arrow-up'  style='cursor:pointer;'></a>")	
	}
	//加载日期控件
	 var picker1 = new Pikaday(  {
	        field: document.getElementById('memBirth'), 
	        firstDay: 1,
	        minDate: new Date('1950-01-01'),
	        maxDate: new Date('2020-12-31'),
	        yearRange: [1950,2020]
	    });
	 var picker2 = new Pikaday(  {
	        field: document.getElementById('amemBirth'), 
	        firstDay: 1,
	        minDate: new Date('1950-01-01'),
	        maxDate: new Date('2020-12-31'),
	        yearRange: [1950,2020]
	    });
}

</script>
</head>
<body class="empBody">
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
			  <li id="uuOne"  class="active">会员管理</li>
			  <li id="uuTwo">会员信息</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
				<form class="form-inline" id="fsubmit" action="${pageContext.request.contextPath}/Member/selMemberAll.emp" method="post">
				<input style="height:35px;" type="text" placeholder="姓名" name="memName" id="" value="${memName}"/>
									<input style="height: 35px;" type="text" placeholder="积分等级" name="memLevelName" id="" value="${memLevelName}"/>
									<input style="height: 35px; width:20px;" hidden="hidden" type="text" placeholder="当前页" name="page" id="fpage" value="${page}"/> 
									<input style="height: 35px; width:20px;" hidden="hidden" type="text" placeholder="姓名排序类型" name="desc_Type" id="fdesc_Type" value="${desc_Type}"/>
									<input style="height: 35px; width:20px;" hidden="hidden" type="text" placeholder="时间排序类型" name="date_desc" id="dete_desc" value="${date_desc}"/>
				  <button type="submit" class="btn btn-default btn-xs">
				  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找
				  </button>
				</form>
				<p:power authority="会员：增加">
				  <button style="float: right;margin-right: 30px" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myEmpModel">
				  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加
				  </button>
				</p:power>
			</div>
			<hr>
			<div class="tCtableDiv clear">
			 <c:if test="${empty(pb.list) }" var="l">
			 	<center>对不起,暂时还没有属于您的会员.</center>
			 </c:if>
			 <c:if test="${!l }">
			  <table class="table-bordered table-hover tCtable" style="width: 2500px;">
			  	<col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/>
			  	<col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="300px"/>
			    <thead>
					<tr>
						<th style="width:100px;">会员编号 &nbsp;</th>
								 	<th >推荐编号 &nbsp;</th>
									<th >会员姓名  &nbsp;
										<span id="descname"></span>
									</th>
									<th >密码  &nbsp;</th>
									<th >性别  &nbsp;</th>
									<th >邮箱  &nbsp;</th>
									<th>电话 &nbsp;</th>
									<th>微信 &nbsp;</th>
									<th>QQ &nbsp;</th>
									<th > 生日  &nbsp;</th>
									<th >地址  &nbsp;</th> 
									<th >上次登录时间  &nbsp;</th>
									<th >本次登录时间  &nbsp;</th>
									<th >会员积分 &nbsp;</th>
									<th >会员职阶名称 &nbsp;</th>
									<th>会员点数  &nbsp;</th>
									<th >会员等级名称 &nbsp;</th>
									<th>连续签到天数 &nbsp;</th>
									<th >创建日期  &nbsp;
									<span id="datedesc"></span>
									</th>
									<th >操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${pb.list}" var="member" >
											<tr   >
											<td >${member.memId}</td>
											 <td >${member.referrerId}</td>
											<td >${member.memName}</td>
											<td >${member.memPwd}</td>
											<td >${member.memGender}</td>
											<td >${member.memEmail}</td>
											<td >${member.memTel}</td>
											<td >${member.filed1}</td>
											<td >${member.filed2}</td>
											<td >
											<fmt:formatDate value="${member.memBirth}" pattern="yyyy-MM-dd"/> 
											</td>
											<td >
												<c:if test="${fn:length(member.memAddress)>7}">
													<c:out value="${fn:substring(member.memAddress, 0, 10)}..."></c:out>
												</c:if>
												<c:if test="${fn:length(member.memAddress)<=7}">  
                         								${member.memAddress}  
                   								</c:if>  
											</td>
											<td >
												<fmt:formatDate value="${member.lastLoginTime}" pattern="yyyy-MM-dd"/> 
											</td>
											<td >
												<fmt:formatDate value="${member.theLoginTime}" pattern="yyyy-MM-dd"/> 
											</td>
											<td >${member.memIntegral} </td>
											<td >${member.memClassName}</td>
											<td >${member.memPoint}</td>
											<td >${member.memLevelName}</td>
											<td >${member.signCount}</td>
											<td >
											<fmt:formatDate value="${member.createDate}" pattern="yyyy-MM-dd"/> 
											</td>
											<td class='action-td'>
											<p:power authority="会员：修改">
											<button onclick="edit(${member.id},1)" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyEmpModel">
						          				<span class="glyphicon glyphicon-edit"></span>修改
							   				</button>
							   				</p:power>
							   				<p:power authority="会员：全查">
							   				<button onclick="see(${member.id},2)" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyEmpModel">
							          				<span class="glyphicon glyphicon-eye-open"></span>查看
							   				</button>
							   				</p:power>
							   				<p:power authority="消息：站内消息-添加">
												<a onclick="del(${member.id})" href="javascript:void(0)" class="btn btn-info btn-sm" ><span class="glyphicon glyphicon-remove"></span>删除</a>
											<button onclick="send(${member.id})" class="btn btn-success btn-sm" data-toggle="modal" data-target="#smyModal">
							          				<span class="glyphicon glyphicon-share"></span>发送
							   				</button>
							   				</p:power>
							   				<p:power authority="会员：积分变更">
							   				<button onclick="saveI(${member.id})" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#imyEmpModel">
							          				<span class="glyphicon glyphicon-share"></span>积分变更
							   				</button>
							   				</p:power>
											</td>
											</tr>
					</c:forEach>
				</tbody>
			  </table>
			  </c:if>
			</div>
			<hr>
			<!-- 分页页码 -->
			<c:if test="${!l }">
			<div class="text-center">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
							<li <c:if test="${page==1}">disabled</c:if>><a id="down"
								onclick="down()"
								<c:if test="${page!=1}"> href="#" value="${page-1}" </c:if>>&laquo;
							</a></li>
							<c:if test="${begin!=1 }">
								<li><a>...</a></li>
							</c:if>
							<c:forEach var="i" begin="${begin}" end="${end}">
								<li <c:if test="${i==page }">class="active"</c:if>><a id="now" value="${i}" onclick="now(${i})" href="#">${i}</a></li>
							</c:forEach>
							<c:if test="${end!=pages }">
								<li><a>...</a></li>
							</c:if>
							<li <c:if test="${page==pages}">disabled</c:if>><a id="up"
								onclick="up()"
								<c:if test="${page!=pages}"> href="#"  value="${page+1}"</c:if>>
									&raquo;</a></li>
						</ul>
				</nav>
			</div>
			</c:if>
			<!-- 分页页码 end -->
		</div>	
		<!-- 内容区域 end -->
	</div>
	<%@include file="footerForEmp.jsp" %>
	
		<!-- 模态框 -->
		<div class="modal fade" id="myEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath}/Member/addMember.emp" accept-charset="utf-8"  method="post" onsubmit="return ft()" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">添加用户信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >推荐编号</label>
		         	               	<input class="form-control " type="text" id="referrerId" name="referrerId" value="" placeholder="推荐编号" onblur="referrerValidate()">
		                       		<p id="referrerIds" style="color:red;"></p>
		                     </div>
		                 </div>
		             	 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >会员姓名</label>
		                        	<input class="form-control " type="text" id="memName" name="memName" value="" placeholder="会员姓名" onblur="nameValidate()">
		                       		<p id="memNames" style="color:red;"></p>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >密码</label>
		                        	<input class="form-control " type="text" id="memPwd" name="memPwd" value="" placeholder="密码"onblur="pwdValidate()">
		                       		<p id="memPwds" style="color:red;"></p>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >性别</label><br/>
		                        	<select   name="memGender"  id="memGender" style="width:370px;height:30px;font-size:15px;" >
							    		<option value="男">男</option>
							    		<option value="女">女</option>
							    	</select>
		                       		
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >邮箱</label>
		                        	<input class="form-control " type="text" id="memEmail" name="memEmail" value="" placeholder="邮箱" onblur="emailValidate()">
		                       		<span id="memEmails" style="color:red;"></span>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >电话</label>
		                        	<input  class="form-control " type="text" id="memTel" name="memTel" value="" placeholder="电话" onblur="telValidate()">
		                       		<span id="memTels" style="color:red;"></span>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >微信</label>
		                        	<input  class="form-control " type="text" id="filed1" name="filed1" value="" placeholder="微信号码" >
		                       		<span id="filed1" style="color:red;"></span>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >QQ</label>
		                        	<input  class="form-control " type="text" id="filed2" name="filed2" value="" placeholder="QQ号码" >
		                       		<span id="filed2" style="color:red;"></span>
		                     </div>
		                 </div>
		                
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">生日</label>
		                            <input class="form-control" type="text" id="memBirth" name="memBirth" value="" placeholder="生日">
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >地址</label>
		                        	<textarea class="form-control " style="resize:none;width:370px;height:80px;" id="memAddress" name="memAddress" placeholder="地址"></textarea>
		                       		
		                     </div>
		                 </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                     <button id="" class="btn btn-danger" type="button" data-dismiss="modal" aria-hidden="true">取消</button>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		
	
		<!-- 修改模态框 -->
		
		<div class="modal fade" id="amyEmpModel"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="fd" action="${pageContext.request.contextPath}/Member/updateMember.emp" accept-charset="utf-8"  method="post" onsubmit="return ftt()">
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabelsee">修改用户信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		             	 <div class="row">
		             	  <div id="q" class="col-sm-12 form-col form-col--first form-col--last">
		                     </div>
		                    <div  class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >会员姓名</label>
		                        	<input class="form-control " type="text" id="amemName" name="memName" value=""onblur="amemNames()">
		                     		<span id="amemNames" style="color:red;"></span>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >密码</label>
		                        	<input class="form-control " type="text" id="amemPwd" name="memPwd" value="" placeholder="密码" onblur="amemPwds()">
		                     		<span id="amemPwds" style="color:red;"></span>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >级别</label>
		                            <select style="width:370px;height:30px;font-size:15px;" id="amemLevel" name="memClass">
		                            	<option>请选择会员级别</option>
		                            	<option value="1">无级别</option>
		                            	<option value="2">见习</option>
		                            	<option value="3">助教</option>
		                            	<option value="4">讲师</option>
		                            	<option value="5">导师</option>
		                            	<option value="6">专家</option>
		                            	<option value="7">教授</option>
		                            	<option value="8">首席</option>
		                            	<option value="9">元老</option>
		                            </select>
		                     		<span id="amemPwds" style="color:red;"></span>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div  class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >推荐编号</label>
		                       		<input class="form-control" type="text" id="areferrerId" name="referrerId" value="" onblur="areferrerIds()">
		                    		<span id="areferrerIds" style="color:red;"></span>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >性别</label><br/>
		                        	<select   name="memGender"  id="amemGender" style="width:370px;height:30px;font-size:15px;" >
							    		<option value="男">男</option>
							    		<option value="女">女</option>
							    	</select>
		                       		
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >邮箱</label>
		                        	<input class="form-control " type="text" id="amemEmail" name="memEmail" value="" onblur="amemEmails()">
		                       		<span id="amemEmails" style="color:red;"></span>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >电话</label>
		                        	<input class="form-control " type="text" id="amemTel" name="memTel" value="" onblur="amemTels()">
		                       		<span id="amemTels" style="color:red;"></span>
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >微信</label>
		                        	<input class="form-control " type="text" id="afiled1" name="filed1" value="" >
		                       		
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >QQ</label>
		                        	<input class="form-control " type="text" id="afiled2" name="filed2" value="" >
		                       		
		                     </div>
		                 </div>
		                
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">生日</label>
		                            <input class="form-control" type="text" id="amemBirth" name="memBirth" value="" >
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >地址</label>
		                        	<textarea class="form-control "style="resize:none;width:370px;height:80px;"  id="amemAddress" name="memAddress"  ></textarea>
		                       		
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >会员积分</label>
		                       		<input class="form-control" type="text" id="amemIntegral" name="memIntegral" value="">
		                     </div>
		                 </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >会员点数</label>
		                       		<input class="form-control" type="text" id="amemPoint" name="memPoint" value="">
		                     </div>
		                 </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div id="trueA" class="row" style="margin-right: 30px;">
		                   	<button id="btn1" class="btn btn-success"  type="submit">确定</button>
		                    <button id="" class="btn btn-danger" type="button" data-dismiss="modal" aria-hidden="true">取消</button>
		                </div>
		            </div>
					
		            </form>
		          </div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div> 
		
		           
		 
		
		
		<!-- 修改积分模态框 -->
		<div class="modal fade" id="imyEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="fff" action="${pageContext.request.contextPath}/Member/saveIntegral.emp" accept-charset="utf-8"  method="post"  >
					<input type="hidden" id="imemClass" name="memClass">
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">积分信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                 <div class="row">
		                    <div id="qqqq" class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >姓名</label>
		                       		<input class="form-control" readonly="readonly" type="text" id="imemName" name="memName" value="">
		                     </div>
		                 </div>
		                 <div class="row" style="display:none;">
		                    <div  class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >推荐编号</label>
		                       		<input class="form-control" readonly="readonly" type="text" id="ireferrerId" name="referrerId" value="">
		                     </div>
		                 </div>
		                 <div class="row">
		                     <div  class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >当前积分</label>
		                       		<input class="form-control" readonly="readonly" type="text" id="imemIntegral" name="memIntegral" value="">
		                     </div>
		                 </div>
		                 
		                 <div class="row" style="display:none;">
		                     <div  class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >当前点数</label>
		                       		<input class="form-control"  type="text" id="imemPoint" name="memPoint" value="">
		                     </div>
		                 </div>
		              
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >操作</label><br/>
		                        	<select   name="amtype"  id="amtype" style="width:370px;height:30px;font-size:15px;" >
							    		<option value="1">增加</option>
							    		<option value="2">减少</option>
							    	</select>
		                     </div>
		                  </div>
		                 <div class="row">
		                    <div  class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >变更积分</label>
		                       		 <input class="form-control" type="text" id="integral" name="integral" value="" onblur="name1()">
		                    			<p id="sdf" style="display:none;" >请输入数字！</p>
		                    			<p id="nameE" style="display:none;" >变更积分不能为空！</p>
		                     </div>
		                 </div>
		                 	
		                 </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		               		 <button id="" class="btn btn-danger" type="button" data-dismiss="modal" aria-hidden="true">取消</button>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		
	<!-- 发送信息模态框 -->
	<div class="modal fade" id="smyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="sff" action="${pageContext.request.contextPath}/message/add.emp" accept-charset="utf-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">发送站内信</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >主题</label>
		         	               	<input class="form-control " type="text" id="mess_theme" name="mess_theme" value="" placeholder="主题">
		                       		<input  type="hidden"  id="memId" name="memId" >
		                     </div>
		                 </div>
		             	 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                            <label class="form-label" >内容</label>
		                        	  <textarea  class="form-control" id="theme" name="theme" value="" placeholder="内容"></textarea>
		                       		
		                     </div>
		                 </div>
		                  <input hidden="hidden" id="semp_Id" name="accpId" value="">
		                
		                
		                        	<input type="text" id="semp_Name" name="accpName" value="" hidden="hidden">
		                 
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <button id="" class="btn btn-danger" type="button" data-dismiss="modal" aria-hidden="true">取消</button>
		                </div>
		            </div>
					</div>
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>