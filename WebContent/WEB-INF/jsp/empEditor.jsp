<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html >
<html>
<head>
	<title>天蕴药业</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>
	<script type="text/javascript" src="${pageContext.request.contextPath }/dist/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.all.js"></script>	
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
	
	var item = {  
            toolbars: [  
                          ['fullscreen', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat                     ', 'simpleupload', 'insertvideo', 'lineheight','inserttable','|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify'],  
                          ['formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist',                       'selectall', 'cleardoc', 'fontfamily','fontsize']  
                      ],  
              initialFrameHeight:350,
              autoHeightEnabled: false, //是否自动长高，默认true  
              autoFloatEnabled: false, //是否保持toolbar的位置不动，默认true  
              wordCount: true, //是否开启字数统计 默认true  
              maximumWords: 100000, //允许的最大字符数 默认值：10000  
              wordOverFlowMsg: "<span style='color:red'>超出范围了！！！！！！！！</span>", //超出字数限制提示  
              elementPathEnabled: false, //是否启用元素路径  
              padding: 0,  
              saveInterval: 5000000, // 将其设置大点，模拟去掉自动保存功能  
              allowDivTransToP: false  
          	};  
         	//传参生成实例  
	        var ue = UE.getEditor('container',item);
	        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
	        UE.Editor.prototype.getActionUrl = function(action) {  
	            if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo') {  
	            	//return this._bkGetActionUrl.call(this, action);  
	            	return '${ctx}/tyyyTest/ued/uploadimage';  
	            } else {  
	                return this._bkGetActionUrl.call(this, action);  
	            }  
	        }  
	
	//消息提示框
	$(function() {
		//消息提示信息
		var msgg='${msg}';
		msg(msgg);
	});
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
				<span>后台消息反馈</span>
			</div>
			<!-- 路径导航 -->
			<ol class="breadcrumb">
			  <li id="uuOne">贴士管理</li>
			  <li id="uuTwo" class="active">贴士编辑</li>
			</ol>
			<!-- 表格 -->
			<h4 style="text-align:center;">贴士编辑</h4>
			
			<div style="margin-left: 30px;">
				<form action="../Tis/addTis.emp" method="post">
					<div>
						主题：<input id="title" type="text" style="width:95%">
			     		<textarea id="container" name="tisContent">编辑文本内容</textarea>
					</div>
			     	<input type="submit" value="发表" />
			 	</form>
			</div>
		</div>
		<!-- 内容区域End -->
		</div>
		<%@include file="footerForEmp.jsp" %>
		
		
	</div>
</body>
</html>
