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
//删除方法
function del(id) {

	var x;
	var r=confirm("是否确认删除!");
	if (r==true){
					 location.href = '${pageContext.request.contextPath}/Tis/delTis.emp?id='+id;
	}
	else{
		return;
			}
	}
	//修改方法
function edit(id) {
		 $.ajax({
				 data:{id:id},
				 url:"${pageContext.request.contextPath}/Tis/selTisById.emp",
				 success:function(data){
					$("#aid").val(data.tis.id),
				 	$("#atisName").val(data.tis.tisName),
				 	$("#acreateBy").val(data.tis.createBy);
				 }
			 })
}
//判断是否为空
var e=new Array();
for (var i = 0; i <2; i++) {
	e[i]=false;
}
function name1() {
	var nameV=$("#tisName").val();
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
function name2() {
	var nameF=$("#createBy").val();
	if(nameF==null||nameF==""){
		e[0]=false;
		if($("#anameE" ).css("display")=="none"){
            $("#anameE" ).css("display", "block");
            $("#anameE" ).css("color", "red");
            }
	}else{
		e[0]=true;
		 $("#anameE" ).css("display", "none");
	}
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
function aaa() {
	window.location.href = "${pageContext.request.contextPath}/view/empTisAdd.html";
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
			  <li id="uuOne" class="active">信息管理</li>
			  <li id="uuTwo" >信息管理</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
				<form class="form-inline" id="fsubmit" action="${pageContext.request.contextPath}/Tis/selTisAll.emp" method="post">
				<input style="height:35px;" type="text" placeholder="文章名称" name="tisName" id="" value="${tis.tisName}"/>
				<input style="height:35px;" type="text" placeholder="创建人" name="createBy" id="" value="${tis.createBy}"/>
									<input style="height: 35px; width:20px;" hidden="hidden" type="text" placeholder="当前页" name="page" id="fpage" value="${page}"/> 
				  <button type="submit" class="btn btn-default btn-xs">
				  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找
				  </button>
				</form>
				<p:power authority="信息：贴士-增加">
				<button class="btn btn-default btn-sm" style="float: right;margin-right: 30px;" onclick="aaa()">
					<span class="glyphicon glyphicon-plus" ></span>添加
				</button>
				</p:power>
				
			</div>
			
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 1000px;">
			  	<col width="600px"/><col width="150px"/>
			    <thead>
					<tr>
						<th>文章名称</th><th>创建人</th><th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pb.list}" var="tis" >
						<tr >
						<td >${tis.tisName}</td>
						<td>${tis.createBy}</td>
						<td class='action-td'>
						<p:power authority="信息：贴士-修改">
						<a href="${pageContext.request.contextPath}/Tis/selTisById.emp?id=${tis.id}" href="javascript:void(0)" class="btn btn-info btn-sm" >
		          				<span class="glyphicon glyphicon-edit"></span>编辑</a>
						</p:power>
		   					<p:power authority="信息：贴士-删除">
							<a onclick="del(${tis.id})" href="javascript:void(0)" class="btn btn-info btn-sm" >
								<span class="glyphicon glyphicon-remove"></span>删除</a>
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
				  <ul class="pagination" id="pagess">
				    <li  <c:if test="${page==1}">disabled</c:if>><a id="down" onclick="down()" <c:if test="${page!=1}"> href="#" value="${page-1}" </c:if>>&laquo; </a></li>
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a id="now" value="${i}" onclick="now(${i})" href="#">${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
						   			 <li <c:if test="${page==pages}">disabled</c:if>><a id="up" onclick="up()" <c:if test="${page!=pages}"> href="#"  value="${page+1}"</c:if>> &raquo;</a></li>
				  </ul>
				  <ul class="pagination  pagination-lg">
						</ul>
				</nav>
			</div>
			<!-- 分页页码 end -->
		</div>	
		<!-- 内容区域 end -->
	</div>
	<%@include file="footerForEmp.jsp" %>
	
		<!-- 添加模态框 -->
		<div class="modal fade" id="myEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/Tis/addTis.emp" accept-charset="UTF-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">添加贴士</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">贴士名称:</label>
		                            <input class="form-control " type="text"  id="tisName" name="tisName" value="" placeholder="贴士名称" onblur="name1()">
		                            <p id="nameE" style="display:none;" >内容不能为空！</p>
		                        </div>
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">创建人:</label>
		                            <input class="form-control " type="text"  id="createBy" name="createBy" value="" placeholder="创建人" onblur="name2()">
		                            <p id="anameE" style="display:none;" >内容不能为空！</p>
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