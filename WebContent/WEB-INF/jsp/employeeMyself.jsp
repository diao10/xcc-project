<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>
<title>Insert title here</title>
    <script type="text/javascript">
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
			<div class="tCMsg alert alert-success" role="alert">
				<span id="span1"></span>
			</div>
			<!-- 路径导航 -->
			<ol class="breadcrumb">
			  <li id="uuOne">个人资料</li>
			</ol>
			<!-- aaa -->
			<div  >
			
          	<form id="ff"  action="${pageContext.request.contextPath}/Employee/updateEmployeeMySelf.emp" accept-charset="utf-8"  method="post" >
            <div style="width: 400px;margin-left:70px;">
                        <div style="width:100px;height:40px;text-align:center;font-size:25px;margin-left:230px;">姓名:</div>
                               	<input type="hidden" name="id" value="${employeeSession.id}">
                               	<input type="hidden" name="emp_Char" value="${employeeSession.emp_Char}">
                               	<div id="qq" style="margin-left:320px;margin-top:-41px;">
                            		 <input style="width:300px;height:40px;"  class="form-control input-lg js-required" type="text" id="aemp_Name" name="emp_Name" value="${employeeSession.emp_Name}" >
                              		
                                </div>
                                
                                <div style="width:100px;height:40px;margin-top:15px;text-align:center;font-size:25px;margin-left:230px;">密码:</div>
                               	<div style="margin-left:320px;margin-top:-41px;">
                            		<input style="width:300px;height:40px;" class="form-control input-lg js-required" type="text" id="aemp_Password" name="emp_Password" value="${employeeSession.emp_Password}"><br>
                                </div>
                                
                                 <div  style="width:100px;height:40px;text-align:center;font-size:25px;margin-left:230px;">个人码:</div>
                               	<div  style="margin-left:320px;margin-top:-41px;">
                               	<input style="width:300px;height:40px;" readonly="readonly" class="form-control input-lg js-required" type="text" id="aemp_Name" name="emp_Id" value="${employeeSession.emp_Id}" >
                                </div>``
                                
                                <div style="width:100px;height:40px;margin-top:20px;text-align:center;font-size:25px;margin-left:230px;">性别:</div>
                               	<div style="margin-left:320px;margin-top:-41px;">
                            		<select   name="emp_Gender"  id="aemp_Gender" style="width:300px;height:40px;font-size:20px;" >
							    		<option value="男">男</option>
							    		<option value="女">女</option>
							    	</select>
                                </div>
                                
                                <div style="width:100px;height:40px;margin-top:20px;text-align:center;font-size:25px;margin-left:230px;">电话:</div>
                               	<div style="margin-left:320px;margin-top:-41px;">
                            		<input style="width:300px;height:40px;" class="form-control input-lg js-required" type="text" id="aemp_Tel" name="emp_Tel" value="${employeeSession.emp_Tel}"><br>
                                </div>
                                
                                <div style="width:100px;height:40px;text-align:center;font-size:25px;margin-left:230px;">Email:</div>
                               	<div style="margin-left:320px;margin-top:-41px;">
                            		 <input style="width:300px;height:40px;" class="form-control input-lg js-required" type="text" id="aemp_Email" name="emp_Email" value="${employeeSession.emp_Email}"><br>
                                </div>
                                
                                <div style="width:100px;height:40px;text-align:center;font-size:25px;margin-left:230px;">住址:</div>
                               	<div style="margin-left:320px;margin-top:-41px;">
                            		 <input style="width:300px;height:40px;" class="form-control input-lg js-required" type="text" id="aemp_Address" name="emp_Address" value="${employeeSession.emp_Address}"><br>
                                </div>
            </div>
             <div class="modal-footer vertical-center" style=" text-align:center;width: 800px;margin-left:45px;margin-left:130px;">
                    					<button   class="btn btn-primary"  >确认</button>
											<a data-dismiss="modal" class="btn btn-info " href="${pageContext.request.contextPath}/view/empHome.html">取消</a>
										</div>
           </form>
    
	</div>
	
		</div>	
		<!-- 内容区域 end -->
		
	</div>
	<%@include file="footerForEmp.jsp" %>
	
	
		</div>
</body>
</html>
