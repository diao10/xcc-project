<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="distM.jsp" %>
<style type="text/css">
.rows{
	 margin-top:50px;
	margin-left:0px;
	overflow:hidden;
	width : 100%;
	height: 80px;
}

</style>
<script type="text/javascript">
        	 $(function(){
        		 var msg = '${msg}';
        		 if(msg=="updateOK"){
        			 $("#update_msg").removeClass("hidden");
        		 }
        		 if(msg=="pwdError"){
        			 $("#pwd_msg").removeClass("hidden");
        			 updateMyInfo(2);
        			 $("#pwd_error").html("旧密码不正确");
        		 }
        		 
        		 var picker = new Pikaday(
   				    {
   				        field: document.getElementById('memBirth'),
   				        firstDay: 1,
   				        minDate: new Date('1950-01-01'),
   				        maxDate: new Date('2020-12-31'),
   				        yearRange: [1950,2020]
   				    });
        		});
        	 function sel(id) {
        		 $('#pwdInfo').addClass('hidden');
					$('#myInfo').addClass('hidden');
					$('#div11').addClass('hidden');
					$('#div2').removeClass('hidden');
         	    $.ajax({
         					 data:{id:id},
         					 url:"${pageContext.request.contextPath}/message/selMessageById.do",
         					 success:function(data){
         						 var d = new Date(data.mess.createDate);
         						 var date = d.toLocaleDateString(); 
         						 $('#mess_theme1').html(data.mess.mess_theme);
         						 $('#createDate1').text("发送时间："+date);
         						 $('#messMemName1').text("发信人："+data.mess.messMemName);
         						 $('#theme1').text(data.mess.theme);
         						 
         					 }
         				 });
         	    
       	}
        	 function del(id) {
        	  		var r=confirm("是否确认删除!");
        	  		if (r==true){
        	  			 $.ajax({
        	  					 data:{id:id},
        	  					 url:"${pageContext.request.contextPath}/message/delMsg.do",
        	  					 success:function(data){
        	  						 location.href = '${pageContext.request.contextPath }/message/selMsg.do';
        	  					 }
        	  				 })
        	  		}
        	  		else{
        	  			return;
        	  				}
        	  		
        	  		
        	  	}
         
        	function updateMyInfo(myInfoType) {
				if(myInfoType==1){
					$('#myInfoH').removeClass('active');
					$('#pwdInfoH').addClass('active');
					$('#msgInfoH').removeClass('active');
					$('#pwdInfo').addClass('hidden');
					$('#myInfo').removeClass('hidden');
					$('#div11').addClass('hidden');
					$('#div2').addClass('hidden');
				}else if(myInfoType==2){
					$('#myInfoH').addClass('active');
					$('#pwdInfoH').removeClass('active');
					$('#msgInfoH').removeClass('active');
					$('#pwdInfo').removeClass('hidden');
					$('#myInfo').addClass('hidden');
					$('#div11').addClass('hidden');
					$('#div2').addClass('hidden');
				}else{
					$('#myInfoH').removeClass('active');
					$('#pwdInfoH').removeClass('active');
					$('#msgInfoH').addClass('active');
					$('#pwdInfo').addClass('hidden');
					$('#myInfo').addClass('hidden');
					$('#div11').removeClass('hidden');
					$('#div2').addClass('hidden');
				}
			}
        	 
        	function pwdValidate() {
        		if($('#newPwd1').val()!=$('#newPwd2').val()){
	        		$("#pwd_msg").removeClass("hidden");
	   				$("#pwd_error").html("两次密码不一致");
        			$('#pwdBtn').attr('disabled','disabled');
        		}else{
	   				$('#pwdBtn').removeAttr('disabled');
	   				$("#pwd_msg").addClass("hidden");
        		}
			}
        	
        
        </script>
        </head>
<body>
		<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody">
			<div class="boxg1">
				<div class="left">
					<ul>
						<li class="active" id="msgInfoH">
							<a href="${pageContext.request.contextPath}/message/selMsg.do" onclick="updateMyInfo(3)" >站内信</a>
						</li>
						<li class="" id="pwdInfoH">
							<a href="javascript:void(0)" onclick="updateMyInfo(1)">基本信息</a>
						</li>
						<li class="" id="myInfoH">
							<a href="javascript:void(0)" onclick="updateMyInfo(2)" >密码安全</a>
						</li>
						
					</ul>
				</div>
				<div class="right">
					<div class="body" >
					<div style="width:100%;height:80px;">
					
					
		<div class="message-body-body info" style="margin-left: 50px">			
			<form id="pwdInfo" class="js-form-contact hidden"  action="${pageContext.request.contextPath }/Member/updatePwdBySelf.do" method="post">
						
						<div class="alert alert-danger hidden" id="pwd_msg">
                            <strong>错误!</strong><span id="pwd_error"></span>
                        </div>
                        <input type="hidden" name="id" value="${memLogin.id }">
						<div class="row1" style="margin-top: 30px">
							<div >
								<div class="info form-group" style="width:300px;">
									<label class="form-label" for="oldPwd">* 旧密码</label> 
									<input type="password" class="form-control" name="oldPwd">
								</div>
							</div>
						</div>
						<div class="row1">
							<div >
								<div class="info form-group" style="width:300px;">
									<label class="form-label" for="newPwd1">* 新密码</label> 
									<input type="password" class="form-control" id="newPwd1" name="newPwd1">
								</div>
							</div>
						</div>
						<div class="row1">
							<div>
								<div class="info form-group" style="width:300px;">
									<label class="form-label" for="newPwd2">* 确认密码</label> 
									<input type="password" class="form-control" id="newPwd2" name="newPwd2" onblur="pwdValidate()">
								</div>
							</div>
						</div>
						<div class="rows">
		                    <div >
		                    	<button id="pwdBtn" class="btn btn-info btn-lg" type="submit" style="width:300px">修改个人密码</button>
		                    </div>
		                </div> 
					</form>		
		<form id="myInfo" class="js-form-contact hidden"  action="${pageContext.request.contextPath }/Member/updateMemberBySelf.do" method="post" >
		<input type="hidden" name="id" value="${memLogin.id }">
						<div class="alert alert-success hidden" id="update_msg">
                            <strong>Well done!</strong> 个人信息修改成功
                        </div>
            <div class="row1" style="margin-top: 30px">
                <div >
                    <div class="form-group" >
                        <label class="form-label" for="new_pwd">* 真实姓名</label>
                        <input class="form-control input-lg" id="memName" name="memName" value="${memLogin.memName }" style="width:300px">
                    </div>
                </div>
            </div>
             <div class="row1" >
             <div >
                    <div class="form-group">
                         <label class="form-label" for="mem_Name">* 性别</label> 
                        <select class="products-filters__order form-control input-lg js-dropdown-custom" for="new_pwd" name="memGender" style="width:300px">
	                         <option value="男"<c:if test="${memLogin.memGender=='男' }">selected="selected"</c:if>>男</option>
	                         <option value="女"<c:if test="${memLogin.memGender=='女' }">selected="selected"</c:if>>女</option>
                       	</select>
                    </div>
                </div>
</div>

				<div class="row1">
                <div >
                    <div class="form-group">
                        <label class="form-label" for="old_pwd">* 个人电话</label>
                        <input class="form-control input-lg"  id="memTel" name="memTel" value="${memLogin.memTel }" style="width:300px">
                    </div>
                </div>
               </div>
               
               <div class="row1">
                 <div>
                    <div class="form-group">
                        <label class="form-label" for="new_pwd">* 通信地址</label>
                        <input class="form-control input-lg" id="memAddress" name="memAddress" value="${memLogin.memAddress }" style="width:300px">
                    </div>
                </div>
               </div>
               
             <div class="row1">
		                    <div >
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group">
		                            <label class="form-label" for="old_pwd">* 生日</label>
		                            <input class="form-control input-lg"  id="memBirth" name="memBirth" value="<fmt:formatDate value="${memLogin.memBirth }" pattern="yyyy-MM-dd"/>" style="width:300px">
		                        </div>
		                    </div>
		                </div>
		        
		          <div class="row1">
                 <div>
                    <div class="form-group">
                        <label class="form-label" for="filed1">* 微信</label>
                        <input class="form-control input-lg" id="filed1" name="filed1" value="${memLogin.filed1 }" style="width:300px">
                    </div>
                </div>
               </div>
               
                 <div class="row1">
                 <div>
                    <div class="form-group">
                        <label class="form-label" for="filed2">* QQ</label>
                        <input class="form-control input-lg" id="filed2" name="filed2" value="${memLogin.filed2 }" style="width:300px">
                    </div>
                </div>
               </div>
	  
            	<div class="row1" style="margin-top: 40px;">
                    <div >
                    	<button id="submitMyInfo" class="btn btn-info btn-lg" type="submit" style="width:300px">修改个人信息</button>
                    </div>
            		</div>
                
        </form> 
        <div class="" id="div11" >
						<ul id="aaa1" >
						 <c:forEach items="${list}" var="pbList2">
						 
							<li id="msgli" style="width:580px;">
							
								<span><a onclick="del(${pbList2.id })" href="javascript:void(0)" type="button" class="btn  " ><span class="glyphicon glyphicon-trash"></span></a></span>
								<span style="float: right;"><fmt:formatDate value="${pbList2.createDate}" pattern="yyyy-MM-dd"/> </span>
								<a href="#" onclick="sel(${pbList2.id })">${pbList2.mess_theme }</a> 
							</li>
							</c:forEach>
						</ul>
						<div class="page text-center" style="margin-top: 100px; ">
							<ul id="list2"   >
									 <li  <c:if test="${page==1}">disabled</c:if>><a onclick="down()" <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/message/selMsg.do?page=${page-1}" </c:if>>&lt;&lt; </a></li>
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/message/selMsg.do?page=${i}" >${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages}"><li><a>...</a></li></c:if>
						   			 <li <c:if test="${page==pages}">disabled</c:if>><a onclick="up()" <c:if test="${page!=pages}"> href="${pageContext.request.contextPath}/message/selMsg.do?page=${page+1}" </c:if>> &gt;&gt;</a></li> 
							</ul>
						</div> 
						</div>
						
						<div class="hidden" id="div2" style="overflow: auto">
							<div ><h3 id="mess_theme1" style="text-align: center;margin-right: 50px"></h3>
							</div>
							<div><span id="createDate1" style=" margin-right: 200px"></span></div>
							<div><span id="messMemName1" style=" margin-right: 100px"></span></div>
							<br/>
							<div id="theme1"  style="word-wrap: break-word;margin-top: 30px 0px 0px 0px;font-size: 20px;width:620px;text-indent:2em;">
							
							</div>
						
						</div>
						
        </div>
        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@include file="footerForMem.jsp" %>
</body>
</html>