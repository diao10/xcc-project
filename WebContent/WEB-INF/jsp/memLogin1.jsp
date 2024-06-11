<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>天蕴药业</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/bootstrap.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/my.css"> 
        <script src="${pageContext.request.contextPath }/dist/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath }/dist/js/bootstrap.min.js"></script> 
<style type="text/css">
	body {
	margin: auto;
	padding: auto;
	}
	.myContainer {
	    width: 1440px;
	    height: 768px;
	    margin: 0 auto;
	    background-image: url("${pageContext.request.contextPath }/dist/img/tyyy-bg.png");
	    box-sizing:border-box;
	}
	.mylogin{
		width: 200px;
		height: 50px;
		float:right;
		margin-right:80px;
		margin-top: 70px;
		box-sizing:border-box;
		color: white;
	}
	.mylogin li{
	 float: left;
	 list-style-type:none;
	 margin-left: 10px;
	 margin-right: 10px;
	}
	.mylogin a{
	text-decoration:none;
	color:#fff;
	}
	.vertical-center{
	  width: auto;
	  display: table;
	  margin-left: auto;
	  margin-right: auto;
	}
</style>
<script type="text/javascript">
	var f = new Array(" "," "," "," "," ");
	var memName;
	var memEmail;
	var memTel;
	var memPwd;
	var memPwd2;
	var referrerId;
	//错误提示框
	var error;
	//提示框内容
	var msg;
	
	$(document).ready(function(){
		error = $('#display_error');
		msg = $('#errores_div');
		if('${msg}'=="LoginFailed"){
			$('#display_error2').removeClass("hidden");
			$('#ggLogin').click();
		}
		if('${msg}'=="pwdOK"){
			alert("密码修改成功，请重新登录！");
		}
	});
	//姓名验证	    
	function nameValidate(){
		memName = $('#memName');
		var parent = memName.parents('.form-group');
		if(memName.val() == ""){
			f[0] = "- 用户名不能为空</br>";
			parent.addClass("has-error");
		}else{
			f[0] = "";
			parent.removeClass("has-error");
		}
	}
	//邮箱验证
	function emailValidate(){
		memEmail = $('#memEmail');
		var parent = memEmail.parents('.form-group');
		var patrn= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
		if(!patrn.exec(memEmail.val())){
			f[1] = "- 邮箱格式不正确</br>";
			parent.addClass("has-error");
		}else{
			$.ajax({
				url:'${pageContext.request.contextPath }/Member/emailValidate.do',
				data:{email:memEmail.val()},
				type:'post',
				dataType:'text',
				success:function(data){
					if(data == "ok"){
						f[1] = "";
						parent.removeClass("has-error");
					}else{
						f[1] = "- 邮箱重复</br>";
						parent.addClass("has-error");
					}
				}
			})
		}
	}
	//电话验证
	function telValidate(){
		memTel = $('#memTel');
		var parent = memTel.parents('.form-group');
		var patrn= /^[0-9]{11}$/; 
		if(!patrn.exec(memTel.val())){
			f[2] = "- 电话格式不正确</br>";
			parent.addClass("has-error");
		}else{
			f[2] = "";
			parent.removeClass("has-error");
		}
	}
	//密码验证
	function pwdValidate(){
		memPwd = $('#memPwd');
		memPwd2 = $('#memPwd2');
		var parent1 = memPwd.parents('.form-group');
		var parent2 = memPwd2.parents('.form-group');
		if(memPwd.val() == ""){
			f[3] = "- 密码不能为空</br>";
			parent1.addClass("has-error");
			parent2.addClass("has-error");
		}else{
			if(memPwd.val() != memPwd2.val()){
				f[3] = "- 密码不一致</br>"
				parent1.addClass("has-error");
				parent2.addClass("has-error");
			}else{
				f[3] = "";
				parent1.removeClass("has-error");
				parent2.removeClass("has-error");
			}
		}
	}
	//推荐码验证
	function referrerValidate(){
		referrerId = $('#referrerId');
		var parent = referrerId.parents('.form-group');
		$.ajax({
			url:'${pageContext.request.contextPath }/Member/referrerValidate.do',
			data:{referrer:referrerId.val()},
			type:'post',
			dataType:'text',
			success:function(data){
				if(data == "ok"){
					f[4] = "";
					parent.removeClass("has-error");
				}else{
					f[4] = "- 推荐码不存在</br>";
					parent.addClass("has-error");
				}
			}
		})
	}
	
	//提交验证
	function submitValidate() {
		nameValidate();
		telValidate();
		pwdValidate();
		memEmail = $('#memEmail');
		var parent = memEmail.parents('.form-group');
		if(memEmail.val() == ""){
			f[1] = "- 邮箱不能为空</br>";
			parent.addClass("has-error");
		}else{
			f[1] = "";
		}
		referrerId = $('#referrerId');
		var parent2 = referrerId.parents('.form-group');
		if(referrerId.val() == ""){
			f[4] = "- 推荐码不能为空</br>";
			parent2.addClass("has-error");
		}else{
			f[4] = "";
		}
		
		var str = "";
		for(var j = 0; j < f.length; j++){
			str += f[j];
		}				
		if(str!=""){					
			msg.html(str);
			error.removeClass('hidden');
			return false;				
		}
		return true;
	}
	function acceptValidate() {
		if($('#accept').is(':checked')){
			$('#btnRegister').removeAttr('disabled');
		}else{
			$('#btnRegister').attr('disabled','disabled');
		}
	}
	
	
	



</script>
</head>
<body>
	<div id="body" class="myContainer">
		<div class="mylogin">
			<ul>
				<li><a id="ggLogin" href="javascript:void(0)" data-toggle="modal" data-target="#login">登陆</a></li>
				<li>/</li>
				<li><a href="javascript:void(0)" data-toggle="modal" data-target="#register">注册</a></li>
			</ul>
		</div>
    </div>
    
    
    <!-- 模态框（Modal） -->
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content" >
                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			
          	<form onsubmit="return submitValidate()" id="formNewsletter" action="${pageContext.request.contextPath }/Member/saveTemp.do" accept-charset="utf-8"  method="post" >
			<div class="modal-header vertical-center" style="width: 400px;">
                <h1 class="modal-title text-center" id="myModalLabel">新用户注册</h1>
            </div>
            <div class="modal-body vertical-center" style="width: 400px;">
                        <div class="row">
                            <div class="col-sm-12 form-col form-col--first form-col--last">
                                <div class="form-group">
                                    <label class="form-label" for="memName">* 姓名</label>
                                    <input class="form-control " type="text" autocorrect="off" autocomplete="off" id="memName" name="memName" placeholder="您的名字" value="">
                                </div>
                            </div>
                        </div>
						<div class="row">
                            <div class="col-xs-12 form-col form-col--first form-col--last">
                                <div class="form-group">
                                    <label class="form-label" for="memEmail">* 邮箱</label>
                                    <input class="form-control  " type="text" autocorrect="off" autocomplete="off" autocapitalize="off" id="memEmail" name="memEmail" value="" placeholder="电子邮箱" onblur="emailValidate()">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 form-col form-col--first form-col--last">
                                <div class="form-group">
                                    <label class="form-label" for="memTel">* 手机号</label>
                                    <input class="form-control " type="text" autocorrect="off" autocomplete="off" autocapitalize="off" id="memTel" name="memTel" placeholder="电话" value="">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 form-col form-col--first form-col--last">
                                <div class="form-group">
                                    <label class="form-label" for="referrerId">* 推荐码</label>
                                    <input class="form-control " type="text" autocorrect="off" autocomplete="off" autocapitalize="off" id="referrerId" name="referrerId" value="" placeholder="推荐码" onblur="referrerValidate()">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 form-col form-col--first form-col--last">
                            	<!-- has-error报错样式 -->
                                <div class="form-group">
                                    <label class="form-label" for="memPwd">* 密码</label>
                                    <input class="form-control  " type="password" autocorrect="off" autocomplete="off" autocapitalize="off" id="memPwd" name="memPwd" placeholder="密码" value="">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 form-col form-col--first form-col--last">
                            	<!-- has-error报错样式 -->
                                <div class="form-group">
                                    <label class="form-label" for="memPwd2">* 重复</label>
                                    <input class="form-control " type="password" autocorrect="off" autocomplete="off" autocapitalize="off" id="memPwd2" name="memPwd2" placeholder="重复密码" value="">
                                </div>
                            </div>
                        </div>
                               

						<!-- hidden 属性负责隐藏 -->
                        <div class="alert alert-danger hidden js-alert-error" id="display_error">
                            <strong>资料出错!</strong>
                            <br>
                           	 请仔细核对信息	
                           	<!--  错误信息描述框 -->
                            <div id="errores_div">
                            
                            </div>
                        </div>
            
            
            </div>
            <div class="modal-footer vertical-center" style="width: 400px;">
            	<div class="row">
                    <div class="col-md-6 form-col form-col--first">
                    			<div class="form-group clearfix newsletter__legal">
                                    <div class="checkbox checkbox--custom">
                                        <label class="form-label" for="condiciones">
                                       		<input id="accept" type="checkbox" name="accept" onclick="acceptValidate()"> 
                                       		 我已阅读并且同意  <br>
                                       		 <a href='https://www.actiu.com/en/about-us/general-conditions-privacy-policy' class='blue' target='_blank'>用户条款</a>                                        </label>

                                    </div>
                                </div>
                    </div>
                    <div class="col-md-6 form-col form-col--last">
                        <button id="btnRegister" class="btn btn-maroon btn-block btn-lg btn-lg-50 btn-important" type="submit" disabled="disabled">注册</button>
                    </div>
                </div>
            </div>
			
           </form>

    
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

    <!-- 模态框（Modal） -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content" >
                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			
          	<form id="formNewsletter" action="${pageContext.request.contextPath }/Login/memLogin.do" accept-charset="utf-8"  method="post" >
			<div class="modal-header vertical-center" style="width: 400px;">
                <h1 class="modal-title text-center" id="myModalLabel">登陆</h1>
            </div>
            <div class="modal-body vertical-center" style="width: 400px;">
                        <div class="row">
                            <div class="col-sm-12 form-col form-col--first form-col--last">
                                <div class="form-group">
                                    <label class="form-label" for="nameRoEmail">会员编号或邮箱</label>
                                    <input class="form-control " type="text" autocorrect="off" autocomplete="off" id="nameRoEmail" name="nameRoEmail" value="" placeholder="会员编号/邮箱">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 form-col form-col--first form-col--last">
                            	<!-- has-error报错样式 -->
                                <div class="form-group">
                                    <label class="form-label" for="memPwd">密码</label>
                                    <input class="form-control  " type="password" autocorrect="off" autocomplete="off" autocapitalize="off" id="memPwd" name="memPwd" value="" placeholder="密码">
                                </div>
                            </div>
                        </div>
						<input name="remember" type="checkbox"> 记住密码
						<!-- hidden 属性负责隐藏 -->
                        <div class="alert alert-danger hidden js-alert-error" id="display_error2">
                            <strong>错误!</strong>
                            <br>
                           	 用户名或密码错误
                           	<!--  错误信息描述框 -->
                            <div id="errores_div2">
                            
                            </div>
                        </div>
            
            
            </div>
            <div class="modal-footer vertical-center" style="width: 400px;">
            	<div class="row">
                    <div class="col-md-6 form-col form-col--first">
                    	<button id="" class="btn btn-maroon btn-block btn-lg btn-lg-50 btn-important" type="submit">登陆</button>
                    </div>
                    <div class="col-md-6 form-col form-col--last">
                        <button id="" class="btn btn-maroon btn-block btn-lg btn-lg-50 btn-important" type="submit">忘记密码</button>
                    </div>
                </div>
            </div>
			
           </form>
    
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
    
    
</body>
</html>