<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>天蕴药业</title>
<%@include file="distM.jsp" %>
<style type="text/css">
	.tyMainBody .errorBox{
		width: 600px;
		height: 600px;
		margin: 0 auto;
	}
	.tyMainBody .errorBox .title{
		height: 150px;
		width: 100%;
		font-size: 22pt;
		text-align: center;
		line-height: 200px;
	}
	.tyMainBody .errorBox .body{
		height: 150px;
		width: 100%;
		text-align: center;
		font-size: 18pt;
	}
	.tyMainBody .errorBox .body .mail{
		color: #31b0d5;
	}
	.tyMainBody .errorBox .gg{
		display:none;
		width: 100%;
		text-align: center;
		font-size: 18pt;
	}
	.tyMainBody .errorBox .gg .btn{
		margin:0 auto;
		width: 250px;
		text-align: center;
		font-size: 20pt;
	}
	.tyMainBody .errorBox .gg .gh{
		margin-top: 50px;
	}
	.tyMainBody .errorBox .gg .btn button{
		background: #4878ca;
		color: white;
	}
	
</style>
<script type="text/javascript">
	function remailgo() {
		var remail = document.getElementById("remail");
		var uurl = remail.innerText;
        uurl = gotoEmail(uurl);
		if (uurl != "") {
			window.location.href = "http://"+uurl;
        } else {
            alert("抱歉!未找到对应的邮箱登录地址，请自己登录邮箱查看邮件！");
        }
	}
	//功能：根据用户输入的Email跳转到相应的电子邮箱首页
    function gotoEmail($mail) {
        $t = $mail.split('@')[1];
        $t = $t.toLowerCase();
        if ($t == '163.com') {
            return 'mail.163.com';
        } else if ($t == 'vip.163.com') {
            return 'vip.163.com';
        } else if ($t == '126.com') {
            return 'mail.126.com';
        } else if ($t == 'qq.com' || $t == 'vip.qq.com' || $t == 'foxmail.com') {
            return 'mail.qq.com';
        } else if ($t == 'gmail.com') {
            return 'mail.google.com';
        } else if ($t == 'sohu.com') {
            return 'mail.sohu.com';
        } else if ($t == 'tom.com') {
            return 'mail.tom.com';
        } else if ($t == 'vip.sina.com') {
            return 'vip.sina.com';
        } else if ($t == 'sina.com.cn' || $t == 'sina.com') {
            return 'mail.sina.com.cn';
        } else if ($t == 'tom.com') {
            return 'mail.tom.com';
        } else if ($t == 'yahoo.com.cn' || $t == 'yahoo.cn') {
            return 'mail.cn.yahoo.com';
        } else if ($t == 'tom.com') {
            return 'mail.tom.com';
        } else if ($t == 'yeah.net') {
            return 'www.yeah.net';
        } else if ($t == '21cn.com') {
            return 'mail.21cn.com';
        } else if ($t == 'hotmail.com') {
            return 'www.hotmail.com';
        } else if ($t == 'sogou.com') {
            return 'mail.sogou.com';
        } else if ($t == '188.com') {
            return 'www.188.com';
        } else if ($t == '139.com') {
            return 'mail.10086.cn';
        } else if ($t == '189.cn') {
            return 'webmail15.189.cn/webmail';
        } else if ($t == 'wo.com.cn') {
            return 'mail.wo.com.cn/smsmail';
        } else if ($t == '139.com') {
            return 'mail.10086.cn';
        } else {
            return '';
        }
    };
    window.onload=function(){
    	if('${mmOK}'=='y'){
    		var ggmail = document.getElementById("ggmail");
    		ggmail.style.display = "block";
    	}
    }
</script>
<body>
	<div class="tyMain">
		<%@include file="headerForMem.jsp" %>
		<div class="tyMainBody">
			<div class="errorBox">
				<div class="title">${title }</div>
				<div class="body">${msg }</div>
				<div class="gg" id="ggmail">
					<div class="btn">
						<button href="javascript:void(0)" class="btn btn-primar" onclick="remailgo()">立即激活邮箱</button>
					</div>
					<div class="gh">如果账号无法激活，您可以联系客服：tianyun（微信）</div>
				</div>
			</div>
		</div>
		<%@include file="footerForMem.jsp" %>
	</div>
</body>
</html>