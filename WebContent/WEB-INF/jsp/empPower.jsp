<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib prefix="p" uri="/tyyyTag/powerTag" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html >
<html>
<head>
	<%@include file="dist.jsp" %>	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
	//
	var loader1= function () {
			$.ajax({
				url:"${pageContext.request.contextPath}/Power/selPowerAll.emp",
				success:function(data){
					for (var i = 0; i < data.list.length; i++) {
						
						/* 拼接上级元素 */
						if(data.list[i].superId==0){
							$('#tb').append("<tr onclick=tt(this) class='parent' id="+data.list[i].pid+"><td>"+data.list[i].pid+"</td><td>"+data.list[i].powerName+"</td><td>"+data.list[i].powerType+"</td><td>"+data.list[i].superId+"</td><td>"+data.list[i].url+"</td><td class='action-td'><a onclick='del("+data.list[i].pid+")' href='javascript:void(0)' class='btn btn-info btn-sm'><span class='glyphicon glyphicon-remove'></span>删除</a></td></tr>")
						}
						/* 拼接下级元素 */
					 	for (var i2 = 0; i2 < data.list.length; i2++){
							if(data.list[i2].superId==data.list[i].pid){
								$('#tb').append("<tr class='child_"+data.list[i].pid+"' style='display:none'><td>"+data.list[i2].pid+"</td><td>"+data.list[i2].powerName+"</td><td>"+data.list[i2].powerType+"</td><td>"+data.list[i2].superId+"</td><td>"+data.list[i2].url+"</td><td class='action-td'><a onclick='del("+data.list[i2].pid+")' href='javascript:void(0)' class='btn btn-info btn-sm'><span class='glyphicon glyphicon-remove'></span>删除</a></td></tr>")
							}
						} 
					}
				}
			});
		};  
		 
		function tt(a){
			var id = a.id;
			var $parent = $(a);
			$('.child_'+id)
			$parent.toggleClass("selected");
			$parent.siblings('.child_'+id).toggle(); 
			
		}
	  	$(function(){
			loader1();
		}); 
	
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
	}
	//消息提示框
	$(function() {
		//消息提示信息
		
		var msgg='${msg}';
		
		msg(msgg);
		//展开列表
		currentPage("el");
	});
	//删除方法
	function del(id) {
		var x;
		var r=confirm("是否确认删除!");
		if (r==true){
			location.href = '${pageContext.request.contextPath }/Power/delPower.emp?id='+id;
		}
		
	}
	function qxChange(values){
		if(values=="1"){
			document.getElementById('sid').style.display = 'none';
			document.getElementById('urlId').style.display = 'none';
		}else{
			document.getElementById('sid').style.display = '';
			document.getElementById('urlId').style.display = '';
		}
	}
	
	</script> 
	</head>
<body>
	<div class="bgcc" >
		<%@include file="headerForEmp.jsp" %>
		<div class="tContent">
		<!-- 菜单区域 -->
		<%@include file="cLeftForEmp.jsp" %>
		<!-- 内容区域 -->
		<div class="tCright" style="overflow: scroll;">
		<!-- 消息反馈 -->
			<div id="alert" class="tCMsg alert alert-success" role="alert">
				<span id="msg"></span>
			</div>
			<!-- 路径导航 -->
			<ol class="breadcrumb">
			  <li id="uuOne" class="active">员工管理</li>
			  <li id="uuTwo" >权限管理</li>
			</ol>
			<!-- 表格 -->
			<div style=" width:80px; height:35px;float:right;margin-top:12px; " >
				<%-- <p:power authority="员工：权限-增加"> --%>
				<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myEmpModel">
			          <span class="glyphicon glyphicon-plus"></span> 添加
			    </button>
				<%-- </p:power> --%>
			</div>
			<div class="tCtableDiv clear">
			  <table id="t1" class="table-bordered table-hover tCtable" style="width: 900px;">
			  	<col width="100px"/><col width="350px"/><col width="50px"/><col width="100px"/><col width="350px"/><col width="250px"/>
			    <thead>
					<tr style="height:10px;"  >
						<th>ID &nbsp;</th>
						<th>权限  &nbsp;</th>
						<th>类型  &nbsp;</th>
						<th>上级ID &nbsp;</th>
						<th>路径  &nbsp;</th>
						<th>操作 &nbsp;</th>
					</tr>
				</thead>
				<tbody id="tb"></tbody>
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
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/Power/addPower.emp" accept-charset="utf-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">添加权限</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="powerName">权限名称</label>
		                            <input class="form-control " type="text" autocorrect="off" autocomplete="off" id="powerName" name="powerName" value="" placeholder="权限名">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	
		                        <div class="form-group">
		                            <label class="form-label" for="pid">权限ID</label>
		                            <input class="form-control  " type="text" autocorrect="off" autocomplete="off" autocapitalize="off" id="pid" name="pid" value="" placeholder="权限ID，模块级个位数，下级两位数">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	
		                        <div class="form-group">
		                            <label class="form-label" for="powerType">权限类型</label>
		                            <select class="form-control" id="powerType" name="powerType" onchange='qxChange(this[selectedIndex].value);'>
		                            	<option value="0" selected="selected">请选择（模块级或权限级）</option>
		                            	<option value="1">模块</option>
		                            	<option value="2">权限</option>
		                            </select>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	
		                        <div class="form-group" id="sid">
		                            <label class="form-label" for="superId">上级ID</label>
		                            <input class="form-control" type="text" id="superId" name="superId" value="" placeholder="上级ID">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	
		                        <div class="form-group" id="urlId">
		                            <label class="form-label" for="url">URL</label>
		                            <input class="form-control" type="text" id="url" name="url" value="" placeholder="权限路径">
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <button id="" class="btn btn-danger" data-dismiss="modal" aria-hidden="true">取消</button>
		                </div>
		            </div>
		           </form>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>
