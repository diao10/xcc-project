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
					 location.href = '${pageContext.request.contextPath }/MemClass/delMemClass.emp?id='+id;
	}
	else{
		return;
			}
	
	
}
//修改方法
function edit(id) {
		 $.ajax({
				 data:{id:id},
				 url:"${pageContext.request.contextPath}/MemClass/selMemClassById.emp",
				 success:function(data){
					$("#qs").append("<input id='aid' name='id' style='display:none' />")
					 $("#aid").val(data.map.id),
				 
				 $("#aclassMax").val(data.map.classMax),
				 $("#aclassMin").val(data.map.classMin),
				 $("#aclassName").val(data.map.className),
				 $("#adeleteFlag").val(data.map.deleteFlag);
				
				 }
			 })
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
			  <li id="uuOne" class="active">会员管理</li>
			  <li id="uuTwo" >会员职阶</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
			<p:power authority="会员：职阶-增加">
				  <button style="float: right;margin-right: 30px" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myEmpModel">
				  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加
				  </button>
			</p:power>
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 900px;">
			  	<col width="200px"/><col width="200px"/><col width="200px"/><col width="300px"/>
			    <thead>
					<tr>
									<th >最大分数 &nbsp;</th>
									<th >最小分数 &nbsp;</th>
									<th >职阶名称 &nbsp;</th>
									<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pb.list}" var="memClass" >
											<tr style="height:30px;"  >
										
											<td >${memClass.classMax}</td>
											<td>${memClass.classMin}</td>
											<td>${memClass.className}</td>
											<td class='action-td'>
											<p:power authority="会员：职阶-修改">
											<button onclick="edit(${memClass.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyEmpModel">
							          				<span class="glyphicon glyphicon-edit"></span>修改
							   				</button>
											</p:power>
											<p:power authority="会员：职阶-删除">
												<a onclick="del(${memClass.id})" href="javascript:void(0)" class="btn btn-info btn-sm" ><span class="glyphicon glyphicon-remove"></span>删除</a>
											</p:power>
											</td>
											</tr>
									    </c:forEach>
			  </table>
			</div>
			<hr>
		</div>	
		<!-- 内容区域 end -->
	</div>
	<%@include file="footerForEmp.jsp" %>
	
		<!-- 模态框 -->
		<div class="modal fade" id="myEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="f" action="${pageContext.request.contextPath}/MemClass/addMemClass.emp" accept-charset="utf-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">添加用户信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >最大</label>
		                       		<input class="form-control" type="text" id="classMax" name="classMax" >
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >最小</label>
		                       		<input class="form-control" type="text" id="classMin" name="classMin" value="">
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >职阶名称</label>
		                       		 <input class="form-control" type="text" id="className" name="className" value="">
		                        </div>
		                    </div>
		                </div>
		               
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <button id="" class="btn btn-danger" type="submit" data-dismiss="modal" aria-hidden="true">取消</button>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		
		<div class="modal fade" id="amyEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath}/MemClass/updateMemClass.emp" accept-charset="utf-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">修改职阶信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div id="qs" class="form-group">
		                            <label class="form-label" >最大</label>
		                       		<input class="form-control" type="text" id="aclassMax" name="classMax" >
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >最小</label>
		                       		<input class="form-control" type="text" id="aclassMin" name="classMin" value="">
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" >职阶名称</label>
		                       		 <input class="form-control" type="text" id="aclassName" name="className" value="">
		                        </div>
		                    </div>
		                </div>
		               
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <button id="" class="btn btn-danger" type="submit"data-dismiss="modal" aria-hidden="true">取消</button>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>