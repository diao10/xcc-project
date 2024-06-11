<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>天蕴药业</title>
	<script src="${pageContext.request.contextPath }/dist/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/bootstrap.css">
<style type="text/css">
 body{
		 background-color:#404040;
		 width: 100%;
		 height: 100%;
		 margin:0 auto;
 }
 #loginLogo{
    width: 380px;
    margin: 0 auto;
 }
 #loginDiv{
 	width:500px;
 	margin: 0 auto;
 	margin-top:50px;
 	background-color:white;
 }
 #loginForm{
 	width:430px;
 	padding-top:50px;
 	margin:0 auto;
 }
</style>
    <script type="text/javascript">
         var e=new Array();
         for (var i = 0; i <2; i++) {
         	e[i]=false;
         }
         function name1() {
        		var nameV=$("#emp_Admin").val();
        		if(nameV==null||nameV==""){
        			e[0]=false;
        			$("#display_error2" ).removeClass("hidden");
        			$("#errores_div2").html("用户名不能为空！")
        		}else{
        			e[0]=true;
        			$("#display_error2" ).addClass("hidden");
        			$("#errores_div2").html("");
        		}
        	}
         
         function emp_Password1() {
        		var pwd=$("#emp_Password").val();
        		if(pwd==null||pwd==""){
        			e[1]=false;
        			$("#display_error2" ).removeClass("hidden");
        			$("#errores_div2").html("密码不能为空！");
        		}else{
        			e[1]=true;
        			$("#display_error2" ).addClass("hidden");
        			$("#errores_div2").html("");
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
         window.onload=function(){
         if('${msg}'=="no"){
        	 $("#display_error2" ).removeClass("hidden");
 			$("#errores_div2").html("用户名或密码错误！")
         }
         }
        </script>
</head>
<body>
	<div id="loginLogo" > <img src="${pageContext.request.contextPath}/dist/img/logo6.jpg" alt="" /></div>
	<div id="loginDiv">
	<div id="loginForm">
	<form class="form-horizontal" action="${pageContext.request.contextPath}/Login/employeeLogin.emp" method="post" onsubmit="return ft()" >
  <div class="form-group" id="div1" style="margin-top:10px;">
    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="emp_Admin" name="emp_Admin" onblur="name1()" placeholder="请输入用户名">
    </div>
  </div>
  <div class="form-group" id="div2">
    <label for="inputPassword3" class="col-sm-2 control-label">密  码:</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="emp_Password" name="emp_Password" onblur="emp_Password1()"  placeholder="请输入密码">
    </div>
  </div>
  <div class="form-group" id="div3">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"  name="remember" id="remember"> 记住密码
        </label>
      </div>
    </div>
  </div>
  						<div class="alert alert-danger hidden js-alert-error" id="display_error2">
                            <strong>错误!</strong>
                            <br>
                           	<!--  错误信息描述框 -->
                            <div id="errores_div2">
                            </div>
                        </div>
  <div class="form-group" id="div4" style="margin-left:330px;margin-bottom: 20px;" >
    <div class="col-sm-offset-2 col-sm-10" >
      <button type="submit" class="btn btn-info btn-sm">登录</button>
    </div>
  </div>
</form>
	</div>
	</div>	
</body>
</html>