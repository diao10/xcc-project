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


<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Contenbiaoqianyanset-Type" content="text/html; charset=UTF-8" />
	<script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>	
<script type="text/javascript">
$(function() {
	//消息提示信息
	var msgg='${msg}';
	msg(msgg);
	//展开列表
	currentPage("eT");
	//消息提示框
});
function xiugai1(id,cd) {
$("#z1").val(id)
$("#z2").val(cd)
 
	}
//修改方法
function xiugai(id,cd) {
$("#id007").val(id)
$("#cd007").val(cd)


	}
function numTest(){
	var num=$("#cd007").val();
	
	if(isNaN(num)){
		alert("请输入数字类型数据");
	}
}
/* function xiugai(id){
		alert(id);
		$.ajax({
				data:{id:id},
				url:"${pageContext.request.contextPath}/Fz/selFzAllById.emp",
				success:function(data){
					$("#id007").val(data.map.id),
					$("#cd007").val(data.map.cd),
					$("#z1").val(data.map.id),
					$('#z2').val(data.map.cd);
				}
		});
} */

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
			  <li id="uuOne" class="active">信息管理</li>
			  <li id="uuTwo" >访问数量</li>
			</ol>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 1000px;">
			  	<col width="250px"/><col width="150px"/>
			    <thead>
					<tr>
						<th>访问人数</th><th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr >
					<td >${fz1.cd}</td>
					<td class='action-td'>
					<p:power authority="信息：访问-修改">
						<a onclick="xiugai(${fz1.id},${fz1.cd})" href="javascript:void(0)" class="btn btn-info btn-sm" data-toggle="modal" data-target="#amyModal2" >
							<span class="glyphicon glyphicon-remove"></span>修改</a>
					</p:power>
					</td>
					</tr>
				</tbody>
			  </table>
			   <table class="table-bordered table-hover tCtable" style="width: 1000px;">
			  	<col width="250px"/><col width="150px"/>
			    <thead>
					<tr>
						<th>首页浮动贴士标题</th><th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr >
					<td >${fz3.cd}</td>
					<td class='action-td'>
						<a onclick="xiugai1(${fz3.id},'${fz3.cd}')" href="javascript:void(0)" class="btn btn-info btn-sm" data-toggle="modal" data-target="#amyModal23" >
							<span class="glyphicon glyphicon-remove"></span>修改</a>
					</td>
					</tr>
				</tbody>
			  </table>
			  <table class="table-bordered table-hover tCtable" style="width: 1000px;">
			  	<col width="250px"/><col width="150px"/>
			    <thead>
					<tr>
						<th>首页浮动贴士内容</th><th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr >
					<td >${fz2.cd}</td>
					<td class='action-td'>
						<a onclick="xiugai1(${fz2.id},'${fz2.cd}')" href="javascript:void(0)" class="btn btn-info btn-sm" data-toggle="modal" data-target="#amyModal23" >
							<span class="glyphicon glyphicon-remove"></span>修改</a>
					</td>
					</tr>
				</tbody>
			  </table>
			</div>
			<hr>
		</div>	
		<!-- 内容区域 end -->
	</div>
	<%@include file="footerForEmp.jsp" %>
	
		<!-- 添加模态框 -->
		<div class="modal fade" id="amyModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/Fz/updateFz.emp" accept-charset="UTF-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">修改访问</h4>
		            </div>
		            <div class="modal-body vertical-center">
		            <input id="id007" name="id" hidden="hidden">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">访问数量:</label>
		                            <input class="form-control " type="text"  id="cd007" name="cd" value="" placeholder="访问数量" onchange="numTest()">
		                        </div>
		                        <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
		                    </div>
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
		<div class="modal fade" id="amyModal23" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/Fz/updateFz.emp" accept-charset="UTF-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel1">修改</h4>
		            </div>
		            <div class="modal-body vertical-center">
		            <input id="z1" name="id" hidden="hidden">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">修改内容:</label>
		                            <input class="form-control " type="text"  id="z2" name="cd" value="" placeholder="修改内容" >
		                        </div>
		                        <div class="row">
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
		    
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>