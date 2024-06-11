<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
  <%@ taglib prefix="p" uri="/tyyyTag/powerTag"%>
<!DOCTYPE html>
<html lang="zh-CN">
 
<head>

 <script src="${pageContext.request.contextPath }/dist/js/doctor.js"></script>

	<%@include file="dist.jsp" %>
<script type="text/javascript">
$(function() {
	//消息提示信息
	var msgg='${msgs}';
	msg(msgg);
	//展开列表
	currentPage("eT");
	//消息提示框
	if(msgg!=('')){
		
	miss();
	}
});
</script>
<script type="text/javascript">
	//删除方法
	function del(id) {
	
		
		var r=confirm("是否确认删除!");
		if (r==true){
			 $.ajax({
					 data:{id:id},
					 url:"${pageContext.request.contextPath}/doctor/delDoctor.emp",
					 success:function(data){
						 location.href ="${pageContext.request.contextPath}/doctor/selDoctor.emp";
					 }
				 })
		}
		
		
		
	}
function save(id) {
	
		
		$("#id008").val(id);
		
	}
	//修改方法
	function edit(id) {
	
	
			 $.ajax({
					 data:{id:id},
					 url:"${pageContext.request.contextPath}/doctor/selDoctorById.emp",
					 success:function(data){
						
						
					$('#id002').val(id);
					 $("#job1").val(data.mem.job);
					$("#empid").val(data.mem.empid);
					 $("#description1").val(data.mem.description);
					 $("#jobs1").val(data.mem.jobs);
					 $("#shortd1").val(data.mem.shortd);
					 $("#doctorName1").val(data.mem.doctorName);
				
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
	function aaa() {
		window.location.href="${pageContext.request.contextPath }/Employee/selEmployeeAll1.emp";
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
			  <li id="uuTwo" >医师信息管理</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
				<form class="form-inline" id="fsubmit" action="${pageContext.request.contextPath}/doctor/selDoctor.emp" method="post">
				<input style="height:35px;" type="text" placeholder="姓名" name="doctorName" id=""value="${doctor.doctorName }"/>
									<input style="height:35px;" type="text" placeholder="职阶" name="job" id=""value="${doctor.job }"/>
									<input style="height: 35px; width:20px;" hidden="hidden" type="text" placeholder="当前页" name="page" id="fpage" value="${page}"/> 
									  <button type="submit" class="btn btn-default btn-xs">
				  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找
				  </button>
		
				</form>
				<p:power authority="消息管理：医师-增加">
				  <button class="btn btn-default btn-sm" style="float: right;margin-right: 30px;" onclick="aaa()">
					<span class="glyphicon glyphicon-plus" ></span>添加
					</button>
				  </p:power>
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 1200px;">
			  	<col width="50px"/><col width="50px"/><col width="50px"/><col width="100px"/><col width="50px"/><col width="200px"/><col width="200px"/>
			    <thead>
					<tr>
						<th>医师编号</th><th>医师姓名 </th><th>医师职称</th><th>医师简介</th><th>医师专业</th><th>医师概述</th><th>操作 </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="member" >
				
											<tr style="height:30px;"  >
											<td >${member.id}</td>
											 <td >${member.doctorName}</td>
											<td >
												<c:if test="${fn:length(member.job)>5}">
													<c:out value="${fn:substring(member.job, 0, 5)}..."></c:out>
												</c:if>
												<c:if test="${fn:length(member.job)<=5}">  
                     								${member.job}  
	               								</c:if>
											</td>
											<td>
												<c:if test="${fn:length(member.description)>7}">
													<c:out value="${fn:substring(member.description, 0, 10)}..."></c:out>
												</c:if>
												<c:if test="${fn:length(member.description)<=7}">  
                     								${member.description}  
	               								</c:if> 
                   							</td>
                   							<td>
												<c:if test="${fn:length(member.jobs)>5}">
													<c:out value="${fn:substring(member.jobs, 0, 5)}..."></c:out>
												</c:if>
												<c:if test="${fn:length(member.jobs)<=5}">  
                     								${member.jobs}  
	               								</c:if>
                   							</td>
                   							<td>
											<c:if test="${fn:length(member.shortd)>7}">
													<c:out value="${fn:substring(member.shortd, 0, 10)}..."></c:out>
												</c:if>
												<c:if test="${fn:length(member.shortd)<=7}">  
                         								${member.shortd}  
                   								</c:if> 
                   							</td>
											<td class='action-td'>
											<p:power authority="消息管理：医师-修改">
											<button onclick="edit(${member.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyModal">
							          				<span class="glyphicon glyphicon-edit"></span>编辑
							   				</button>
							   				</p:power><p:power authority="消息管理：医师-删除">
												<a onclick="del(${member.id})" href="javascript:void(0)" class="btn btn-info btn-sm" ><span class="glyphicon glyphicon-remove"></span>删除</a>
												</p:power>
												<p:power authority="信息管理：医师-修改图片">
							   					  <button onclick="save(${member.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModa2">
							          				<span class="glyphicon glyphicon-plus"></span> 修改图片
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
				    <li>
				      <a  id="down" onclick="down()" <c:if test="${page!=1}"> href="#" value="${page-1}" </c:if> aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				  
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a value="${page }" id="now" onclick="now(${i})" href="#">${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
						   			
				    <li>
				      <a id="up" onclick="up()" <c:if test="${page!=pages}"> href="#" value="${page+1}" </c:if> aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
			<!-- 分页页码 end -->
		</div>	
		<!-- 内容区域 end -->
	</div>
	<%@include file="footerForEmp.jsp" %>
		
				<!-- 修改模态框 -->
				<div class="modal fade" id="amyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" >
		<div class="modal-content" >
			<button type="button" style="margin-top: 10px; margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			
          	<form id="fd" enctype="multipart/form-data" action="${pageContext.request.contextPath}/doctor/updateDoctor.emp" accept-charset="UTF-8"  method="post" >
				<div class="modal-header vertical-center">
                <h1 class="modal-title text-center" id="myModalLabel">修改信息</h1>
            </div>
            <input hidden="hidden" id="id002" name ="id">
            <input hidden="hidden" id="empid" name ="empid">
            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师姓名:</label>
		                            <input class="form-control " type="text"  id="doctorName1" name="doctorName" value="" placeholder="医师姓名">
		                            
		                        </div>
		                    </div>
		                </div>
		          
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师职称:</label>
		                            <input class="form-control " type="text"  id="job1" name="job" value="" placeholder="医师职称">
		                            
		                        </div>
		                    </div>
		                </div>
						 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师专业:</label>
		                            <input class="form-control " type="text"  id="jobs1" name="jobs" value="" placeholder="医师专业">
		                            
		                        </div>
		                    </div>
		                </div> <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师概述:</label>
		                            <input class="form-control " type="text"  id="shortd1" name="shortd" value="" placeholder="医师概述">
		                            
		                        </div>
		                    </div>
		                </div>
		            
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师简介:</label>
		                            <input class="form-control " type="text"  id="description1" name="description" value="" placeholder="医师简介">
		                            
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
            				</div>
    </div>
			
    </div>
    <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" >
		<div class="modal-content" >
			<button type="button" style="margin-top: 10px; margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			
          	<form id="fd" enctype="multipart/form-data" action="${pageContext.request.contextPath}/doctor/save.emp" accept-charset="utf-8"  method="post" >
				<div class="modal-header vertical-center">
                <h1 class="modal-title text-center" id="myModalLabel">修改图片</h1>
            </div>
          	<input hidden="hidden" id = "id008" name ="id">
		                <div class="modal-body vertical-center">
		               <div class="row" style="margin-top: 30px">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">医师头像:</label>
		                            <div style="margin-left:100px;margin-top:-41px;">
									 
	                        		  <input type="file" name ="file"  onchange="previewImage1(this,'preview1','imghead1')">
	                        			<div id="preview1" >
	                    				<img id="imghead1" style="width: 200px;height:200px;" src="${pageContext.request.contextPath }/dist/img/messImg.jpg">
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
            				</div>
    </div>
			
    </div>
		</div>

	
			
           
    
	
	


</body>
</html>