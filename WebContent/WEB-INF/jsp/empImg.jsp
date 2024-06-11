<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>
<title>Insert title here</title>

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
</script>
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
	.gga{
			text-align:center;
			width: 1000px;
			margin-top: 10px
		}
.gga div{
			width: 500px;
			margin:0 auto;
			
		}
.gga div input{
			display: inline;
		}
		
		
	</style>
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
			  <li id="uuOne" class="active">信息管理</li>
			  <li id="uuTwo" >图片管理</li>
			</ol>
			<!-- 查询条 -->
			<div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save.emp" method="post" enctype="multipart/form-data"> 
		                首页大图 ·1(1293*400) <input type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    </div>
                    
                    <div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save1.emp" method="post" enctype="multipart/form-data"> 
		                   首页大图 ·2(1293*400)    <input type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    </div>
                    <div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save2.emp" method="post" enctype="multipart/form-data"> 
		              首页大图 ·3(1293*400)        <input type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    </div>
                    <div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save3.emp" method="post" enctype="multipart/form-data"> 
		              解决方案·4(350*180)         <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    </div>
                    <div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save4.emp" method="post" enctype="multipart/form-data"> 
		               解决方案·5(350*180)         <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    </div>
                    <div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save5.emp" method="post" enctype="multipart/form-data"> 
		             解决方案·6(350*180)         <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    </div>
                    <div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save6.emp" method="post" enctype="multipart/form-data"> 
		              动态资讯·7(560*380)         <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    </div>
                    <div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save7.emp" method="post" enctype="multipart/form-data"> 
		              动态资讯·8(560*380)         <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    </div>
                    <div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save8.emp" method="post" enctype="multipart/form-data"> 
		             动态资讯·9(560*380)        <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    </div>
                    <div class="gga" >
                		<div>
						   <form action="${pageContext.request.contextPath}/img/save9.emp" method="post" enctype="multipart/form-data"> 
		             动态资讯·10(560*380)         <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                    
                   <div class="gga" >
            <%--           <form action="${pageContext.request.contextPath}/img/save9.emp" method="post" enctype="multipart/form-data"> 
		               手机资讯·11(1440*319)         <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                   
                     <div class="gga" >
                     <form action="${pageContext.request.contextPath}/img/save9.emp" method="post" enctype="multipart/form-data"> 
		               手机资讯·12(1440*319)         <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form>
                		</div>
                  
                     <div class="gga" >
                     <form action="${pageContext.request.contextPath}/img/save9.emp" method="post" enctype="multipart/form-data"> 
		               手机资讯·13(1440*319)         <input  type="file" name ="file"/><input type="submit" value="替换图片"/>
		                    </form> --%>
                		</div>
                       
                    
		</div>
	</div>
	</div>
</body>
</html>