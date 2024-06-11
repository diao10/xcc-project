<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
<%@include file="distM.jsp" %>
<style type="text/css">
	/*忘记密码  必要样式*/
.clears{ clear:both; color: red}
.for-liucheng{width:640px;margin:30px auto; height:50px;padding:20px 0 0 0; position:relative;}
.liulist{float:left;width:25%; height:7px; background:#ccc;}
.liutextbox{ position:absolute;width:100%;left:0;top:10px;}
.liutextbox .liutext{float:left;width:25%; text-align:center;}
.liutextbox .liutext em{ display:inline-block;width:24px; height:24px;-moz-border-radius: 24px; -webkit-border-radius: 24px;border-radius:24px; background:#ccc; text-align:center; font-size:14px; line-height:24px; font-style:normal; font-weight:bold;color:#fff;}
.liutextbox .liutext strong{ display:inline-block;height:26px; line-height:26px; font-weight:400;}
.liulist.for-cur{ background:#77b852;}
.liutextbox .for-cur em{ background:#77b852;}
.liutextbox .for-cur strong{color:#77b852;}

.forget-pwd{width:500px;margin:20px auto;min-height:400px;}
.forget-pwd input,.forget-pwd select,.forget-pwd button{border:0;margin:0;padding:0; background:none;}
.forget-pwd dl{margin-bottom:20px;}
.forget-pwd dt{float:left;padding-right:10px;width:100px; height:30px; line-height:30px; text-align:right; font-size:14px;}
.forget-pwd dd{float:left;width:380px; height:30px; position:relative;}
.forget-pwd dd input{width:190px; height:28px;border:#ccc 1px solid;}
.forget-pwd dd select{width:190px; height:30px;border:#ccc 1px solid;}
.forget-pwd dd button{width:120px; height:30px; line-height:30px;border:#ddd 1px solid; background:#f1f1f1; text-align:center; cursor:pointer; font-size:14px;color:#666;}
.forget-pwd .yanzma{ position:absolute;left:200px;top:2px; height:30px; line-height:30px;width:180px;}
.subtijiao{padding:0 0 0 110px;}
.subtijiao input{width:85px; height:32px; background:#f60;color:#fff; font-size:14px; cursor:pointer;}
.successs,.mms .error{ text-align:center;padding: 20px 0 60px 0;}
.successs h3{padding:20px; font-size:25px;color:#A0CD4E;}
.mms h3{padding:20px; font-size:25px;color:black;}
.error h3{padding:20px; font-size:15px;color:red;}
</style>

<script type="text/javascript">
	$(function(){
		var forgetTid = '${forgetTid}';
		for (var i = 0; i < forgetTid; i++) {
			$('#forgettT'+(i+1)).addClass('for-cur');
			$('#forgetlT'+(i+1)).addClass('for-cur');
		}
		$('#forg'+forgetTid).removeClass("hidden");
	})
	
	function forgetPwdValidate() {
		if($('#fmemPwd').val().length<6){
			$('#pwdMsg1').html("密码长度不能小于6位");
			return false;
		}else{
			$('#pwdMsg1').html("");
			if($('#fmemPwd').val()!=$('#fmemPwd2').val()){
				$('#pwdMsg2').html("两次密码不一致");
				return false;
			}else{
				$('#pwdMsg2').html("");
				return true;
			}
		}
	}
</script>

<body>
	<div class="tyMain">
		<%@include file="headerForMem.jsp" %>
		<div class="tyMainBody">
		  <div class="content">
		   <div class="web-width">
		     <div class="for-liucheng">
		      <div id="forgetlT1" class="liulist"></div>
		      <div id="forgetlT2" class="liulist"></div>
		      <div id="forgetlT3" class="liulist"></div>
		      <div id="forgetlT4" class="liulist"></div>
		      <div class="liutextbox">
		       <div id="forgettT1" class="liutext"><em>1</em><br /><strong>填写账户名</strong></div>
		       <div id="forgettT2" class="liutext"><em>2</em><br /><strong>验证身份</strong></div>
		       <div id="forgettT3" class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
		       <div id="forgettT4" class="liutext"><em>4</em><br /><strong>完成</strong></div>
		      </div>
		     </div><!--for-liucheng/-->
		   <!--  步骤一：填写账号 -->
		     <form id="forg1" action="${pageContext.request.contextPath }/Member/forgetMail.do" method="get" class="forget-pwd hidden">
		       <dl>
		        <dt>邮箱：</dt>
		        <dd><input type="text" name="mail" /></dd>
		        <div class="clears">${errorMsg}</div>
		       </dl> 
		       <div class="subtijiao"><input type="submit" value="提交" /></div> 
		     </form><!--forget-pwd/-->
		    <!--  步骤二：提示到邮箱 -->
		    	<div id="forg2" class="mms hidden">
			       <h3>${msg}</h3>
			   </div>
			 <!--  步骤三：提示到邮箱 -->
		     <form id="forg3" action="${pageContext.request.contextPath }/Member/updatePwdByForget.do" method="get" class="forget-pwd hidden" onsubmit="return forgetPwdValidate()">
		       <input type="hidden" name="id" value="${id}">
		       <dl>
		        <dt>新密码：</dt>
		        <dd><input id="fmemPwd" type="password" name="memPwd" /></dd>
		        <div class="clears" id="pwdMsg1"></div>
		       </dl> 
		       <dl>
		        <dt>确认密码：</dt>
		        <dd><input id="fmemPwd2" type="password" /></dd>
		        <div class="clears" id="pwdMsg2">${errorMsg}</div>
		       </dl> 
		       <div class="subtijiao"><input type="submit" value="提交" /></div> 
		      </form><!--forget-pwd/-->
		       <!--  步骤四：成功提示-->
		       <div id="forg4" class="successs hidden">
			       <h3>${msg}</h3>
			   </div>
		   </div><!--web-width/-->
		  </div><!--content/-->
		</div>
		<%@include file="footerForMem.jsp" %>
	</div>
</body>
</html>