<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="p" uri="/tyyyTag/powerTag"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>
<title>Insert title here</title>

<script type="text/javascript">
$(function() {
	//消息提示信息
	var msgg='${msg}';
	msg(msgg);
	//展开列表
	currentPage("eB");
	//消息提示框
});
/* var e=false;
 function name1() {
	var nameV=$("#lMin").val();
	if(nameV==null||nameV==""){
		e=false;
		if($("#min" ).css("display")=="none"){
            $("#min" ).css("display", "block");
            $("#min" ).css("color", "red");
            }
	}else{
		e=true;
		 $("#min" ).css("display", "none");
	}
}
function name2() {
	var type=$("#lMax").val();
	if(type==null||type==""){
		e=false;
		if($("#max" ).css("display")=="none"){
            $("#max" ).css("display", "block");
            $("#max" ).css("color", "red");
            }
	}else{
		e=true;
		 $("#max" ).css("display", "none");
	}
}  */
function name3() {
	var type=$("#lName").val();
	if(type==null||type==""){
		e=false;
		if($("#name" ).css("display")=="none"){
            $("#name" ).css("display", "block");
            $("#name" ).css("color", "red");
            }
	}else{
		e=true;
		 $("#name" ).css("display", "none");
	}
} 
//删除方法
function del(id) {

	var x;
	var r=confirm("是否确认删除!");
	if (r==true){
		 location.href="${pageContext.request.contextPath}/MemLevel/delMemLevel.emp?id="+id;
	}
	else{
		return;
			}
	}
//修改方法
function edit(id) {
		 $.ajax({
				 data:{id:id},
				 url:"${pageContext.request.contextPath}/MemLevel/selMemLvById.emp",
				 success:function(data){
				 	$("#aid").val(data.lv.id),
				 	$("#lvMin").val(data.lv.levelMin),
				 	$("#lvMax").val(data.lv.levelMax),
				 	$("#lvName").val(data.lv.levelName);
				 }
			 })
}
function name1() {
	var nameV=$("#lMin").val();
	var patrn= /^([0-9])+/; 
	if(nameV==null||nameV==""){
		e[0]=false;
		if($("#nameE" ).css("display")=="none"){
            $("#nameE" ).css("display", "block");
            $("#nameE" ).css("color", "red");
            $("#sdf" ).css("display", "none");
            }
	}else{
		e[0]=true;
		 $("#nameE" ).css("display", "none");
		 if(patrn.exec(nameV)){
			 e[1]=true;
			 $("#sdf" ).css("display", "none");
		 }else{
			 e[1]=false; 
			 $("#sdf" ).css("display", "block");
			  $("#sdf" ).css("color", "red");
			  $("#nameE" ).css("display", "none");
		 }
	}
}
function name2() {
	var nameV=$("#lMax").val();
	var patrn= /^([0-9])+/; 
	if(nameV==null||nameV==""){
		e[0]=false;
		if($("#nameS" ).css("display")=="none"){
            $("#nameS" ).css("display", "block");
            $("#nameS" ).css("color", "red");
            $("#sd" ).css("display", "none");
            }
	}else{
		e[0]=true;
		 $("#nameS" ).css("display", "none");
		 if(patrn.exec(nameV)){
			 e[1]=true;
			 $("#sd" ).css("display", "none");
		 }else{
			 e[1]=false; 
			 $("#sd" ).css("display", "block");
			  $("#sd" ).css("color", "red");
			  $("#nameS" ).css("display", "none");
		 }
	}
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
			  <li id="uuOne" class="active">会员管理</li>
			  <li id="uuTwo" >会员等级</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
			<p:power authority="会员：等级-增加">
				  <button style="float: right;margin-right: 30px" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myEmpModel">
				  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加
				  </button>
				  </p:power>
				  
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 1000px;">
			  	<col width="250px"/><col width="250px"/><col width="250px"/><col width="250px"/>
			    <thead>
					<tr>
						<th>最小值</th><th>最大值</th><th>等级名称</th><th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pb.list}" var="lv" >
						<tr style="height:30px;"  >
						<td >${lv.levelMin}</td>
						<td>${lv.levelMax}</td>
						<td>${lv.levelName}</td>
						<td class='action-td'>
						<p:power authority="会员：等级-修改">
						<button onclick="edit(${lv.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyModal">
		          				<span class="glyphicon glyphicon-edit"></span>修改
		   				</button>
		   				</p:power>
		   				<p:power authority="会员：等级-删除">
							<a onclick="del(${lv.id})" href="javascript:void(0)" class="btn btn-info btn-sm" >
								<span class="glyphicon glyphicon-remove"></span>删除</a>
						</p:power>
						</td>
						</tr>
				    </c:forEach>
				</tbody>
			  </table>
			</div>
			<hr>
		</div>	
		<!-- 内容区域 end -->
	</div>
	<%@include file="footerForEmp.jsp" %>
	
		<!-- 添加模态框 -->
		<div class="modal fade" id="myEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/MemLevel/addMemLevel.emp" accept-charset="utf-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">添加等级信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">最小值</label>
		                            <input class="form-control " type="text"  id="lMin" name="levelMin" onblur="name1()" >
		                            <p id="sdf" style="display:none;" >请输入数字！</p>
		                    			<p id="nameE" style="display:none;" >变更积分不能为空！</p>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">最大值</label>
		                            <input class="form-control  " type="text" id="lMax" name="levelMax" onblur="name2()" >
		                        	<p id="sd" style="display:none;" >请输入数字！</p>
		                    			<p id="nameS" style="display:none;" >变更积分不能为空！</p>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">等级名称</label>
		                            <input class="form-control" type="text" id="lName" name="levelName" onblur="name3()" placeholder="等级名称">
		                        	<p id="name" style="display:none;" >类型不能为空！</p>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <a data-dismiss="modal" class="btn btn-info " href="#">取消</a>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<!-- 修改模态框 -->
		<div class="modal fade" id="amyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/MemLevel/updateMemLevel.emp" accept-charset="utf-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">修改等级信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		            	 <div class="row" style="display: none;">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">id</label>
		                            <input class="form-control " type="text"  id="aid" name="id" placeholder="id">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">最小值</label>
		                            <input class="form-control " type="text"  id="lvMin" name="levelMin" placeholder="最小值">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">最大值</label>
		                            <input class="form-control  " type="text" id="lvMax" name="levelMax" placeholder="最大值">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">等级名称</label>
		                            <input class="form-control" type="text" id="lvName" name="levelName" placeholder="等级名称">
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <a data-dismiss="modal" class="btn btn-info " href="#">取消</a>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>