<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<%@include file="dist.jsp" %>
	<script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/ueditor/ueditor.all.js"></script>	 
<script type="text/javascript">
$(function() {
	var msgg='${msgs}';
	msg(msgg);
	//展开列表
	currentPage("eM");
	if(msgg!=('')){
		
	//消息提示框
	miss();
	}
});

	



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
	  
</script>
<style type="text/css">

.head1{
   	margin:0 auto;
   	text-align:center;
	

	height:40px;
    border-bottom: 1px solid #eeeeee;
  
}
.mainbody{
     overflow: scroll;
    
	width: 1060px;

	height:390px;
    border-bottom: 1px solid #eeeeee;
    
}
.mainbody .main{
   
	
    margin-left:30px;
	height:150px;
    border-bottom: 1px solid #eeeeee;
  
     
}
.mainbody .main .mainleft{
	
    font-family:黑体;
    font-size:20px;
   	
	width: 300px;
	 display:inline; 
	height:150px;
    border-bottom: 1px solid #eeeeee;
    
}

.mainbody .main .mainright{
 	
	
    font-family:黑体;
    font-size:20px;
   	
	
	height:150px;
    border-bottom: 1px solid #eeeeee;
    display:inline;
}
.mainbody .main .mainright1 a{
 	float:right;
 	margin-right:30px;
    font-family:黑体;
    font-size:20px;
   	float:right;
	width: 80px;
	height:40px;
    border-bottom: 1px solid #eeeeee;
    display:inline;
    color: black;
   
}
.motai{
	height: 390px;
	width: 1060px;
	z-index: 20;
	
	
}
.motai .bt{
	background-color: black;
	width: 30px;
	
	
}

.m1{
	float: right;
	background-color: orange;
	height: 20px;
	width: 40px;
	
}


</style>
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
			<div class="tCMsg alert alert-success" role="alert">
				<span>站内留言信息</span>
			</div>
			<!-- 路径导航 -->
			<ol class="breadcrumb">
			  <li id="uuOne">站内消息管理</li>
			  <li id="uuTwo" class="active">站内留言信息</li>
			</ol>
			<!-- 查询条 -->
			<div class="head1">
				<div ><h3>${title.theme }</h3></div>
			</div>
			<div class="mainbody" id="div1" >
			<c:forEach items="${list }" var="building">
			<div class="main">
			         <div class="mainleft">来自：${building.sender }&nbsp;&nbsp;&nbsp;&nbsp;</div>
			         <div class="mainright">内容：${building.buildingV  }</div>
					 <div class="mainright1" ><a href="${pageContext.request.contextPath}/building/selBuildingById.emp?id=${building.id }">修改楼层</a> </div>
			</div>
				</c:forEach>
			<hr>
	
			</div>
		
		<div class="text-center">
				<nav aria-label="Page navigation">
							   <ul class="pagination">
						<li  <c:if test="${page==1}">disabled</c:if>><a  <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/building/selBuilding.emp?page=${page-1}&id=${themeId }" </c:if>>&laquo; </a></li>
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/building/selBuilding.emp?page=${i}&id=${themeId }" >${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
						   		 <li <c:if test="${page==pages}">disabled</c:if>><a  <c:if test="${page!=pages}"> href="${pageContext.request.contextPath}/building/selBuilding.emp?page=${page+1}&id=${themeId }" </c:if>> &raquo;</a></li>
								
							  </ul>
							</nav>
						</div>
			<!-- 分页页码 -->
			
		</div>	
		<!-- 内容区域 end -->
	</div>
	
	
		<%@include file="footerForEmp.jsp" %>
		
	</div>
</body>
</html>