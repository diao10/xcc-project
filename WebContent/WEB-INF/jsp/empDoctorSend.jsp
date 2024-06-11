<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath }/dist/js/doctor.js"></script>
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
	currentPage("eT");
	//消息提示框
	if(msgg!=('')){
		
		
	miss();
	}
});
//判断排序显示按钮
window.onload=function(){
	if('${desc_Type}'==2){
		$("#descname").append("<a href='#'  id='desc_Type2'  class='glyphicon glyphicon-arrow-down' value='1' onclick='desc_Type2()'  style='cursor:pointer;'></a>")
	}else{
		$("#descname").append("<a href='#'  id='desc_Type2'  class='glyphicon glyphicon-arrow-up' value='2' onclick='desc_Type2()'  style='cursor:pointer;'></a>")
	}
	
};
//删除方法

function add(id,name){
	
	$("#id007").val(id)
	$("#doctorName").val(name)
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

function adminN() {
	var pwd=$("#emp_Admin").val();
	if(pwd==null||pwd==""){
		e[3]=false;
		if($("#adminN").css("display")=="none"){
			$("#adminN").css("display","block");
			   $("#adminN" ).css("color", "red");
		}
	}else{
		e[3]=true;
		 $("#adminN").css("display", "none");
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
				<form id="fsubmit" class="form-inline" action="${pageContext.request.contextPath}/Employee/selEmployeeAll1.emp" method="post">
				 					<input  type="text" placeholder="姓名" name="emp_Name" id="" value="${emp_Name}" />
									
									<input  hidden="hidden" type="text" placeholder="当前页" name="page" id="fpage" value="${page}"/> 
									<input  hidden="hidden" type="text" placeholder="姓名排序类型" name="desc_Type" id="fdesc_Type" value="${desc_Type}"/>
									
				  <button type="submit" class="btn btn-default btn-xs">
				  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找
				  </button>
				</form>
				
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 1000px;">
			  	<col width="100px"/><col width="100px"/><col width="100px"/><col width="100px"/>
			  	
			    <thead>
					<tr>
									<th >编号 &nbsp;</th>
									<th >姓名  &nbsp;
									<span id="descname"></span>
									</th>
								
									<th >用户名  &nbsp;</th>
								
									<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pb.list}" var="emp" >
											<tr style="height:30px;"  >
										
											<td >${emp.emp_Id}</td>
											<td>${emp.emp_Name}</td>
											
											<td>${emp.emp_Admin}</td>
											
											<td class='action-td' ">
											<button onclick="add('${emp.id}','${emp.emp_Name}')" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyEmpModel">
							          				<span class="glyphicon glyphicon-edit"></span>添加医师
							   				</button>
							   			
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
		<div class="modal fade" id="amyEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter"  action="${pageContext.request.contextPath}/doctor/addDoctor.emp" accept-charset="utf-8"  method="post" enctype="multipart/form-data">
			<div class="modal-header vertical-center">
                <h1 class="modal-title text-center" id="myModalLabel">添加信息</h1>
            </div>
             <div class="modal-body vertical-center">
              	 		<input hidden="hidden" id="id007" name="empid">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师姓名:</label>
		                            <input class="form-control " type="text"  id="doctorName" name="doctorName" value="" placeholder="医师姓名">
		                            
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师职称:</label>
		                            <input class="form-control " type="text"  id="job" name="job" value="" placeholder="医师职称">
		                            
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师专业:</label>
		                            <input class="form-control " type="text"  id="jobs" name="jobs" value="" placeholder="医师专业">
		                            
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师概述:</label>
		                            <input class="form-control " type="text"  id="shortd" name="shortd" value="" placeholder="医师概述">
		                            
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师简介:</label>
		                            <input class="form-control " type="text"  id="description" name="description" value="" placeholder="医师简介">
		                            
		                        </div>
		                    </div>
		                </div>
		                <div class="row" style="margin-top: 30px">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师头像:</label>
		                            <div style="margin-left:100px;margin-top:-41px;">
									 
	                        		  <input type="file" name ="file"  onchange="previewImage1(this,'preview','imghead')">
	                        			<div id="preview" >
	                    				<img id="imghead" style="width: 200px;height:200px;" src="${pageContext.request.contextPath }/dist/img/messImg.jpg">
                        			</div>
		                        </div>
		                    </div>
		                </div>
		             </div>
		             </div>
            
             <div class="modal-footer vertical-center" style="width: 500px;margin-left:45px;">
            	
                    <div >
                    	<button  id="" class="btn btn-primary" type="submit" >确认</button>
											<a data-dismiss="modal" class="btn btn-info " href="#">Cancel</a>
                    </div>
           
            </div>
			
           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		
	</div>
</body>
</html>