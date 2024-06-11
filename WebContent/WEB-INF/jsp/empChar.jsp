<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html >
<html>
<head>
	<%@include file="dist.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		//消息提示框
		$(function(){
			//消息提示信息
			var msgg='${msg}';
			msg(msgg);
			//展开列表
			currentPage("el");
		});
		//编辑
		function edit(id){
			
			window.location.href='${pageContext.request.contextPath}/view/empCharToPower.html?id='+id;
		}
		//删除方法
		function del(id) {
			var x;
			var r=confirm("是否确认删除!");
			if (r==true){
				location.href = '${pageContext.request.contextPath }/empChar/delEmpChar.emp?id='+id;
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
		<div class="tCright" style="">
		<!-- 消息反馈 -->
			<div id="alert" class="tCMsg alert alert-success" role="alert">
				<span id="msg"></span>
			</div>
			<!-- 路径导航 -->
			<ol class="breadcrumb">
			  <li id="uuOne"  class="active" >员工管理</li>
			  <li id="uuTwo" >角色管理</li>
			</ol>
			<!-- 表格 -->
			<div style=" width:80px; height:35px;float:right;margin-top:12px; " >
				<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myEmpModel">
			          <span class="glyphicon glyphicon-plus"></span> 添加
			    </button>
			</div>
			<div class="tCtableDiv clear">
			  <table id="t1" class="table-bordered table-hover tCtable" style="width: 500px;">
			  	<col width="100px"/><col width="200px"/><col width="200px"/>
			    <thead>
					<tr style="height:10px;"  >
					<th>ID &nbsp;</th>
					<th>角色名称 &nbsp;</th>
					<th>操作</th>
					</tr>
				</thead>
				<tbody id="tb" >
					<c:forEach items="${List}" var="empChar" >
						<tr style="height:30px;"  >
						<td >${empChar.cid}</td>
						<td>${empChar.charName}</td>
						<td class='action-td'>
							<button onclick="edit(${empChar.cid})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyEmpModel">
			          				<span class="glyphicon glyphicon-edit"></span>编辑
			   				</button>
								<a onclick="del(${empChar.cid})" href="javascript:void(0)" class="btn btn-info btn-sm" ><span class="glyphicon glyphicon-remove"></span>删除</a> 
						</td>
						</tr>
				    </c:forEach>
					</tbody> 
			  </table>
			</div>
			
		</div>
		<!-- 内容区域End -->
		</div>
		<%@include file="footerForEmp.jsp" %>
		<!-- 模态框 -->
		<div class="modal fade" id="myEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		            <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/empChar/addEmpChar.emp" accept-charset="utf-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">添加角色</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="charName">角色名称</label>
		                            <input class="form-control " type="text" autocorrect="off" autocomplete="off" id="charName" name="charName" value="" placeholder="角色名称">
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
	</div>	
</body>
</html>
