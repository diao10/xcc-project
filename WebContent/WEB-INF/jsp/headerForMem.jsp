<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>天蕴药业</title>
<script type="text/javascript">
	function ooo(){
		
		var liName = '${htmlName}';
		if(liName!=null&&liName!=""){
		$('#li').find('li').each(function(){
			if(liName==$(this).attr("id")){
				$("#indexs").removeClass("active");
				$(this).addClass("active");
			}
		});
		}
	};
	$(function(){
		ooo();
		error = $('#display_error');
		msg = $('#errores_div');
		if('${msg}'=="LoginFailedForPwd"){
			$('#display_error2').removeClass("hidden");
			$('#errores_div2').html("用户名或密码错误");
			$("#login").modal();
		}
		if('${msg}'=="LoginFailedForJH"){
			$('#display_error2').removeClass("hidden");
			$('#errores_div2').html("账号未激活，请到邮箱中激活");
			$("#login").modal();
		}
		if('${msg}'=="lz"){
			/* $('#display_error2').removeClass("hidden");
			$('#errores_div2').html("请登录"); */
			$("#login").modal();
		}
		if('${msg}'=="LoginFailedForEmail"){
			$('#display_error').removeClass("hidden");
			$('#errores_div').html("邮箱已注册");
			$('#register').modal();
		}
		if('${msg}'=="LoginFailedForReferrerId"){
			$('#display_error').removeClass("hidden");
			$('#errores_div').html("推荐码错误");
			$('#register').modal();
		}
		if('${msg}'=="pwdOK"){
			$('#display_error2').removeClass("hidden");
			$('#errores_div2').html("密码修改成功，请重新登录！");
			$("#login").modal();
		}
	});
	
	function mh(memClass,href){
		//${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do
		var basepath = ${pageContext.request.contextPath}/
		if (memClass <= 1) {
			alert("您的积分不够,请努力哦!");
		}else{
			location.href = basepath + href;
		}
	}
	
</script>
<style type="text/css">
	.vertical-center{
	  width: auto;
	  display: table;
	  margin-left: auto;
	  margin-right: auto;
	}
	header .box .logo .zz{
		margin-right:25px;
		float:right;
		font-size:15px;
		font-family:"黑体 ";
	}
	header .box .logo img{
		float:left;
		width:300px;
		display: block;
	}
</style>
</head>
<body>
	<header>
		<div class="box">
			<div class="logo">
				<img src="${pageContext.request.contextPath }/dist/img/tyyyLogo.jpg">
				<img style="float:right;" src="${pageContext.request.contextPath }/dist/img/tyyyLogo2.png">
				<div id="fz" class="zz clear">会员人数：${fz[0].cd }</div>
			</div>
			<div class="login clear">
				<ul>
					<c:if test="${fn:trim(memLogin)==''}">
						<li><a href="javascript:void(0)" data-toggle="modal" data-target="#login">登陆</a></li>
						<li>&nbsp;/&nbsp;</li>
						<li><a href="javascript:void(0)" data-toggle="modal" data-target="#register" style="margin-right:25px;">注册</a></li>
					</c:if>
					<c:if test="${fn:trim(memLogin)!=''}">
						<li style="margin-left: 20px">欢迎</li>
						<li>&nbsp;</li>
						<li>${memLogin.memName}</li>
						<li>，会员编号：</li>
						<li>${memLogin.memId}</li>
						<li style="margin-left:20px; font-size: 10pt ;" ><a  onclick="esc()" href="${pageContext.request.contextPath}/Login/memEsc.do"  ><span class="glyphicon glyphicon-off" aria-hidden="true"></span><span style="top:1px;position: relative;display: inline-block;">退出</span></a></li>
					</c:if>
				</ul>
			</div>
			<div class="menu">
				<ul id="li">
					<li id="indexs" class="active"><a href="${pageContext.request.contextPath}/view/memIndex.html">首页</a></li>
					<li id="tis"><a href="${pageContext.request.contextPath}/Tis/selTis.do">养生知识</a></li>
					<li id="mh"><a href="javascript:;" onclick="mh(${memLogin.memClass},'MemHealth/selMemHealthAll.do')">健康档案</a></li>
					<li id="doc"><a href="javascript:;" onclick="mh(${memLogin.memClass},'theme/selThemeAll.do')">专家咨询</a></li>
					<li id=""><a href="${pageContext.request.contextPath}/mobile/analysis/analysis.html">体质分析</a></li>
					<li id="memInfo"><a href="${pageContext.request.contextPath}/message/selMsg.do">个人信息</a></li>
					<li id="mc"><a href="${pageContext.request.contextPath}/MemClass/selMemClassAll.do">会员功能</a></li>
				</ul>
			</div>
		</div>	
	</header>
	    <!-- 模态框（Modal） -->
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content" >
                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			
          	<form onsubmit="return submitValidate()" id="formNewsletter" action="${pageContext.request.contextPath }/Member/saveTemp.do" accept-charset="utf-8"  method="post" >
			<div class="modal-header vertical-center" style="width: 400px;">
                <h3 class="modal-title text-center" id="myModalLabel">新用户注册</h3>
            </div>
            <div class="modal-body vertical-center" style="width: 400px;">
                        <div class="row">
                            <div class="col-sm-12 form-col form-col--first form-col--last">
                                <div class="form-group">
                                    <label class="form-label" for="memName">* 姓名</label>
                                    <input class="form-control " type="text" autocorrect="off" autocomplete="off" id="memName" name="memName" placeholder="您的名字" value="" onblur="nameValidate()">
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
                                    <input class="form-control " type="text" autocorrect="off" autocomplete="off" autocapitalize="off" id="memTel" name="memTel" placeholder="电话" value="" >
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
                                    <label class="form-label" for="memPwd2">* 确认密码</label>
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
                    <div class="" style="float: left;">
                    <input style="margin-top:0;width: 20px" id="accept" type="checkbox" name="accept" onclick="acceptValidate()"> 
                                       		 我已阅读并且同意  
                                       		 <a href='${pageContext.request.contextPath }/view/yhtl.html' style="color: #428bca;" target='_blank'>用户条款</a>
                       &nbsp;&nbsp;&nbsp;&nbsp;<button id="btnRegister" class="btn btn-info" type="submit" disabled="disabled" style="width: 120px;">注册</button>
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
			
          	<form onsubmit="return loginValidate()" id="formNewsletter" action="${pageContext.request.contextPath }/Login/memLogin.do" accept-charset="utf-8"  method="post" >
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
                                    <input class="form-control  " type="password" autocorrect="off" autocomplete="off" autocapitalize="off" id="loginMemPwd" name="memPwd" value="" placeholder="密码">
                                </div>
                            </div>
                        </div>
						<input name="remember" type="checkbox"> 记住密码
						<!-- hidden 属性负责隐藏 -->
                        <div class="alert alert-danger hidden js-alert-error" id="display_error2">
                            <strong>错误!</strong>
                            <br>
                           	<!--  错误信息描述框 -->
                            <div id="errores_div2">
                            	
                            </div>
                        </div>
            
            
            </div>
            <div class="modal-footer vertical-center" style="width: 400px;">
            	<div class="row">
                    	<button id="" class="btn btn-info" type="submit">登陆</button>
                        <a id="" class="btn btn-info"  href="${pageContext.request.contextPath }/view/forgetPwd.html?forgetTid=1">忘记密码</a>
                </div>
            </div>
			
           </form>
    
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
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
	var patrn= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.)+([a-zA-Z0-9_-])+/; 
	if(!patrn.test(memEmail.val())){
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
		if(memPwd.val().length<6){
			f[3] = "- 密码不能小于6位</br>"
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
	emailValidate();
	referrerValidate();
	
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
function loginValidate(){
	if($('#loginMemPwd').val()==""||$('#nameRoEmail').val()==""){
		$('#display_error2').removeClass("hidden");
		$('#errores_div2').html("用户名和密码不能为空");
		$("#login").modal();
		return false;
	}else{
		return true;
	}
}
</script>
</body>
</html>