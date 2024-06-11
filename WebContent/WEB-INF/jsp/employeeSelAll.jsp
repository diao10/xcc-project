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
<title>Insert title here</title>
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
	currentPage("el");
});
//判断排序显示按钮
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
};
//删除方法
function del(id) {

	var x;
	var r=confirm("是否确认删除!");
	if (r==true){
		 location.href="${pageContext.request.contextPath}/Employee/delEmployee.emp?id="+id;
	}
	else{
		return;
			}
	
	
}
//修改方法
function edit(id,see) {
	if(see==1){
		$('#myModalLabelsee').text("修改员工信息");
	}
	$('#formNewsletters').find("input").removeAttr("disabled",false);
	$('#formNewsletters').find("textarea").removeAttr("readonly","true");
	$('#formNewsletters').find("select").attr("disabled",false);
	$("#trueA").css("display","block");
	$("#qq").html("");
		 $.ajax({
				 data:{id:id},
				 url:"${pageContext.request.contextPath}/Employee/selEmployeeById.emp",
				 success:function(data){
				
					$("#qq").append("<input id='aid' name='id' style='display:none' />")
				 $("#aid").val(data.emp.id),
				 $("#aemp_Id").val(data.emp.emp_Id),
				 $("#aemp_Name").val(data.emp.emp_Name),
				 $("#aemp_Admin").val(data.emp.emp_Admin),
				 $("#aemp_Password").val(data.emp.emp_Password),
				 $("#aemp_Char").val(data.emp.emp_Char),
				 $("#aemp_Gender").val(data.emp.emp_Gender),
				 $("#aemp_Tel").val(data.emp.emp_Tel),
				 $("#aemp_Email").val(data.emp.emp_Email),
				 $("#aemp_Address").val(data.emp.emp_Address);
				
				 }
			 })
}
//查看方法
function see(id,see) {
	if(see=2){
	$('#myModalLabelsee').text("查看员工信息");
		
		
	}
	$('#formNewsletters').find("input").attr("disabled",true);
	$('#formNewsletters').find("textarea").attr("readonly","true");
	$('#formNewsletters').find("select").attr("disabled",true);
	$("#trueA").css("display","none");
		 $.ajax({
				 data:{id:id},
				 url:"${pageContext.request.contextPath}/Employee/selEmployeeById.emp",
				 success:function(data){
				
					$("#qq").append("<input id='aid' name='id' style='display:none' />")
				 $("#aid").val(data.emp.id),
				 $("#aemp_Id").val(data.emp.emp_Id),
				 $("#aemp_Name").val(data.emp.emp_Name),
				 $("#aemp_Admin").val(data.emp.emp_Admin),
				 $("#aemp_Password").val(data.emp.emp_Password),
				 $("#aemp_Char").val(data.emp.emp_Char),
				 $("#aemp_Gender").val(data.emp.emp_Gender),
				 $("#aemp_Tel").val(data.emp.emp_Tel),
				 $("#aemp_Email").val(data.emp.emp_Email),
				 $("#aemp_Address").val(data.emp.emp_Address);
				
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
var e=new Array();
for (var i = 0; i <3; i++) {
	e[i]=false;
}
//判断姓名是否为空
function name1() {
	var nameV=$("#emp_Name").val();
	if(nameV==null||nameV==""){
		e[0]=false;
		if($("#nameE" ).css("display")=="none"){
            $("#nameE" ).css("display", "block");
            $("#nameE" ).css("color", "red");
            }
	}else{
		e[0]=true;
		 $("#nameE" ).css("display", "none");
	}
}
function adminN() {
	var admin=$("#emp_Admin").val();
	if(admin==null||admin==""){
		e[3]=false;
		if($("#adminN").css("display")=="none"){
			$("#adminN").css("display","block");
			   $("#adminN" ).css("color", "red");
		}
	}else{
		$.ajax({
			url:'${pageContext.request.contextPath}/Employee/admin.emp',
			data:{admin:admin},
			type:'post',
			dataType:'text',
			success:function(data){
				if(data == "ok"){
					e[3] = true;
					$("#aadminN").html("");
				}else{
					e[3] =false;
					$("#aadminN").html("用户名重复！");
					   $("#aadminN" ).css("color", "red");
				}
			}
		})
		e[3]=true;
		 $("#adminN").css("display", "none");
	}
}
//判断密码
function emp_Password1() {
	var pwd=$("#emp_Password").val();
	if(pwd==null||pwd==""){
		e[1]=false;
		if($("#emp_PasswordE").css("display")=="none"){
			$("#emp_PasswordE").css("display","block");
			   $("#emp_PasswordE" ).css("color", "red");
		}
	}else{
		e[1]=true;
		 $("#emp_PasswordE").css("display", "none");
	}
}
//判断电话
function emp_Tel1() {
	var tel=$("#emp_Tel").val();
	if(tel==null||tel==""){
		e[2]=false;
		if($("#emp_TelE").css("display")=="none"){
			$("#emp_TelE").css("display","block");
			   $("#emp_TelE" ).css("color", "red");
		}
	}else{
		e[2]=true;
		 $("#emp_TelE").css("display", "none");
	}
}
function ft() {
	for (var i = 0; i < e.length; i++) {
		if(!e[i]){
			return false;
		}				
	}
	return true;
}

var f=new Array();
for (var i = 0; i <2; i++) {
	f[i]=false;
}

function aemp_Passwords() {
	var n=$("#aemp_Password").val();
	if(n==null||n==""){
		f[0]=false;
		$("#aemp_Passwords").html("密码不能为空！")
	}else{
		f[0]=true;
		$("#aemp_Passwords").html("")
	}
}

function aemp_Admins() {
	var p=$("#aemp_Admin").val();
	if(p==null||p==""){
		f[1]=false;
		$("#aemp_Admins").html("用户名不能为空！")
	}else{
		$.ajax({
			url:'${pageContext.request.contextPath}/Employee/admin.emp',
			data:{admin:p},
			type:'post',
			dataType:'text',
			success:function(data){
				if(data == "ok"){
					f[1] = true;
					$("#aemp_Admins").html("")
				}else{
					f[1] =false;
					$("#aemp_Admins").html("用户名重复!")
				}
			}
		})
		f[1]=true;
		$("#aemp_Admins").html("")
	}
}

function ftt() {
	aemp_Passwords(); 
	aemp_Admins(); 
	for (var i = 0; i < f.length; i++) {
		if(!f[i]){
			return false;
		}				
	}
	return true;
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
			  <li id="uuOne"  class="active" >员工管理</li>
			  <li id="uuTwo">员工信息</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
				<form id="fsubmit" class="form-inline" action="${pageContext.request.contextPath}/Employee/selEmployeeAll.emp" method="post">
				 					<input  type="text" placeholder="姓名" name="emp_Name" id="" value="${emp_Name}" />
									<input placeholder="电话" name="emp_Tel" id="" value="${emp_Tel}"/>
									<input  placeholder="地址" name="emp_Address" id="" value="${emp_Address}"/>
									<input  hidden="hidden" type="text" placeholder="当前页" name="page" id="fpage" value="${page}"/> 
									<input  hidden="hidden" type="text" placeholder="姓名排序类型" name="desc_Type" id="fdesc_Type" value="${desc_Type}"/>
									<input  hidden="hidden" type="text" placeholder="时间排序类型" name="date_desc" id="dete_desc" value="${date_desc}"/>
				  <button type="submit" class="btn btn-default btn-xs">
				  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找
				  </button>
				</form>
				<p:power authority="员工：增加">
				  <button style="float: right;margin-right: 30px" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myEmpModel">
				  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加
				  </button>
				  </p:power>
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 1500px;">
			  	<col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/>
			  	<col width="100px"/><col width="100px"/><col width="100px"/><col width="150px"/><col width="100px"/><col width="300px"/>
			    <thead>
					<tr>
									<th >编号 &nbsp;</th>
									<th >姓名  &nbsp;
									<span id="descname"></span>
									</th>
									<th >密码  &nbsp;</th>
									<th >用户名  &nbsp;</th>
									<th >角色  &nbsp;</th>
									<th >性别  &nbsp;</th>
									<th >电话 &nbsp;</th>
									<th >邮箱  &nbsp;</th>
									<th >地址  &nbsp;</th> 
									<th > 创建日期  &nbsp;
									<span id="datedesc"></span>
									</th>
									<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pb.list}" var="emp" >
											<tr style="height:30px;"  >
										
											<td >${emp.emp_Id}</td>
											<td>${emp.emp_Name}</td>
											<td>${emp.emp_Password}</td>
											<td>${emp.emp_Admin}</td>
											<td>${emp.charList[0].charName}</td>
											<td>${emp.emp_Gender}</td>
											<td>${emp.emp_Tel}</td>
											<td>${emp.emp_Email}</td>
											<td >
												<c:if test="${fn:length(emp.emp_Address)>7}">
													<c:out value="${fn:substring(emp.emp_Address, 0, 10)}..."></c:out>
												</c:if>
												<c:if test="${fn:length(emp.emp_Address)<=7}">  
                         								${emp.emp_Address}  
                   								</c:if>  
											</td>
											<td >
												<fmt:formatDate value="${emp.create_Date}" pattern="yyyy-MM-dd"/> 
											</td>
											<td class='action-td' ">
											<p:power authority="员工：修改">
											<button onclick="edit(${emp.id},1)" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyEmpModel">
							          				<span class="glyphicon glyphicon-edit"></span>修改
							   				</button>
							   				</p:power>
							   				<p:power authority="员工：全查">
							   				<button onclick="see(${emp.id},2)" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyEmpModel">
							          				<span class="glyphicon glyphicon-eye-open"></span>查看
							   				</button>
							   				</p:power>
							   				<p:power authority="员工：删除">
												<a onclick="del(${emp.id})" href="javascript:void(0)" class="btn btn-info btn-sm" ><span class="glyphicon glyphicon-remove"></span>删除</a>
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
				   
							<li <c:if test="${page==1}">disabled</c:if>><a id="down"
								onclick="down()"
								<c:if test="${page!=1}"> href="#" value="${page-1}" </c:if>>&laquo;
							</a></li>
							<c:if test="${begin!=1 }">
								<li><a>...</a></li>
							</c:if>
							<c:forEach var="i" begin="${begin}" end="${end}">
								<li <c:if test="${i==page }">class="active"</c:if>><a
									id="now" value="${i}" onclick="now(${i})" href="#">${i}</a></li>
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
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath}/Employee/addEmployee.emp" accept-charset="utf-8"  method="post" onsubmit="return ft()">
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">添加员工信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >姓名</label>
		                            <input class="form-control " type="text"  id="emp_Name" name="emp_Name" value="" placeholder="姓名" onblur="name1()">
		                        </div>
		                        <p id="nameE" style="display:none;" >姓名不能为空！</p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >用户名</label>
		                            <input class="form-control  " type="text" id="emp_Admin" name="emp_Admin" value="" placeholder="用户名" onblur="adminN()">
		                        </div>
		                        <p id="adminN" style="display:none;" >用户名不能为空！</p>
		                         <p id="aadminN" style="color:red;" ></p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >密码</label>
		                            <input class="form-control  " type="text" id="emp_Password" name="emp_Password" value="" placeholder="密码" onblur="emp_Password1()">
		                        </div>
		                        <p id="emp_PasswordE" style="display:none;" >密码不能为空！</p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label">角色</label>
		                            <select   name="emp_Char"  id="emp_Char" style="width:370px;height:30px;font-size:15px;" >
		                         <c:forEach items="${el}" var="el" >
								    		<option value="${el.cid }">${el.charName }</option>
							    </c:forEach>
							    		</select>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >性别</label><br/>
		                        	<select   name="emp_Gender"  id="emp_Gender" style="width:370px;height:30px;font-size:15px;" >
							    		<option value="男">男</option>
							    		<option value="女">女</option>
							    	</select>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >电话</label>
		                            <input class="form-control  " type="text" id="emp_Tel" name="emp_Tel" value="" placeholder="电话" onblur="emp_Tel1()">
		                        </div>
		                        <p id="emp_TelE" style="display:none;" >电话不能为空！</p>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >Email</label>
		                            <input class="form-control  " type="text" id="emp_Email" name="emp_Email" value="" placeholder="Email">
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >住址</label>
		                            <textarea class="form-control  "style="resize:none;width:370px;height:80px;" type=text" id="emp_Address" name="emp_Address" value="" placeholder="住址"></textarea>
		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <button id="" class="btn btn-danger" type="submit">取消</button>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<!-- 修改员工模态框 -->
		<div class="modal fade" id="amyEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletters" action="${pageContext.request.contextPath}/Employee/updateEmployee.emp" accept-charset="utf-8"  method="post" onsubmit="return ftt()" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabelsee">修改员工信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		            <div class="row" style="display:none;">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >个人码</label>
		                            <input readonly="readonly" class="form-control" type="text" id="aemp_Id" name="emp_Id" value="" >
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                       <div id="qq" class="form-group">
		                        </div>
		                        <div  class="form-group">
		                            <label class="form-label" >姓名</label>
		                            <input  class="form-control " type="text"  id="aemp_Name" name="emp_Name" value="" >
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >用户名</label>
		                            <input class="form-control  " type="text" id="aemp_Admin" name="emp_Admin" value="" placeholder="用户名" onblur="aemp_Admins()">
		                        	<p id="aemp_Admins" style="color:red;"></p>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >密码</label>
		                            <input class="form-control  " type="text" id="aemp_Password" name="emp_Password" value="" placeholder="密码" onblur="aemp_Passwords()">
		                        	<p id="aemp_Passwords" style="color:red;"></p>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label">角色</label>
		                           <select   name="emp_Char"  id="aemp_Char" style="width:370px;height:30px;font-size:15px;" >
		                         <c:forEach items="${el}" var="el" >
								    		<option value="${el.cid }">${el.charName }</option>
							    </c:forEach>
							    		</select>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >性别</label><br/>
		                        	<select   name="emp_Gender"  id="aemp_Gender" style="width:370px;height:30px;font-size:15px;" >
							    		<option value="男">男</option>
							    		<option value="女">女</option>
							    	</select>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >电话</label>
		                            <input class="form-control  " type="text" id="aemp_Tel" name="emp_Tel" value="" placeholder="电话">
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >Email</label>
		                            <input class="form-control  " type="text" id="aemp_Email" name="emp_Email" value="" placeholder="Email">
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >住址</label>
		                            <textarea class="form-control  " style="resize:none;width:370px;height:80px;"type=text" id="aemp_Address" name="emp_Address" value="" placeholder="住址"></textarea>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div id="trueA" class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <button id="" class="btn btn-danger" type="submit" data-dismiss="modal" aria-hidden="true">取消</button>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>