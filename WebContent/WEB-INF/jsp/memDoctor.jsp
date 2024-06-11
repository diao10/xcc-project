<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="distM.jsp" %>
	<script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
   
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
		.background-doctor-right1{
	margin-top:20px;
	margin:auto;
	background-color: white;
	height:50px;
	margin-right: 20px;
}
.background-doctor-right1 button{
	margin-top:20px;
	

	
	margin-right: 40px;
    
}
.background-doctor-right2{
	margin:auto;
	background-color: white;
	height:141px
}
.messContent-right2{
	float:left;
	padding-left:20px;
	width: 800px;
	background-color: white;
}
.messContent-right1{
	float:right;
	width: 100px;
	background-color: white;
}



	</style>
	<script type="text/javascript">
	function checkAdd(){
		if($("#exampleInputEmail1").val().trim() == ""){
			alert("主题不能为空");
			return false;
		}
		return true;
	}
	function f1(id,name){
	
		$("#rid007").val(id);
		$("#rname007").val(name);
		$("#div1").css("display","none");
		$("#div2").css("display","block")
		
	}
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
	<script type="text/javascript">
		$(function(){
			var message = ${param.message};
			if (message == false) {
				alert("点数不足");
			}
		});
	</script>
</head>
<body>
		<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody" id="div1">
			<section id="" class="messContent">
			<c:forEach items="${list }" var="building">
				<div> <!-- 盖楼主体 -->
					<div class="messContent-body">
						<div class="messContent-left">
							<div class="messContent-left-content">
								<div class="messContent-left-content-header">
									
									<ul class="messContent-left-content-body">
										<li class="messContent-left-content-body-img">
										<img style="width: 116px;height: 120px;" src="../${building.imgid}">
										</li>
										<li class="messContent-left-content-body-msg" >${building.doctorName }</li>
									
									</ul>
								</div>
							</div>
						</div>
						<div class="messContent-right1">
							<div class="background-doctor-right1"><button class="btn btn-success" onclick="f1(${building.empid},'${building.doctorName }')" >咨询专家</button></div>
						
						</div>
						<div class="messContent-right2">
							<div class="background-doctor-right1">职位：${building.job }</div>
							<div class="background-doctor-right1">科室：${building.jobs }</div>
							<div class="background-doctor-right2">简介：${building.description }</div>
						</div>
					</div>
					
					
				</div><!-- 盖楼主体 end-->
				</c:forEach>
					<div class="messContent-footersss">
						<div class="pageDiv">
							<nav>
							  <ul class="pagination pagination-lg">
							   	<li  <c:if test="${page==1}">disabled</c:if>><a onclick="down()" <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/doctor/selDoctor.do?page=${page-1}" </c:if>>&laquo; </a></li>
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/doctor/selDoctor.do?page=${i}" >${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
						   			 <li <c:if test="${page==pages}">disabled</c:if>><a onclick="up()" <c:if test="${page!=pages}"> href="${pageContext.request.contextPath}/doctor/selDoctor.do?page=${page+1}" </c:if>> &raquo;</a></li>
								
							  </ul>
							</nav>
						</div>
					</div>
			</section>
		</div>
	</div>
	<div class="tyMainBody" id="div2" style="display: none;">
		<section id="" class="messContent">
				<div> <!-- 盖楼主体 -->
					<div class="messContent-body">
						<form onsubmit="return checkAdd();" action="${pageContext.request.contextPath}/theme/addTheme.do" method="post">
						     	<div class="bt"><button class="btn btn-default" type="submit">提交</button></div>
								<div>
									<!-- 主题id -->
									<div class="form-group">
    									<label for="exampleInputEmail1">主题 </label>
    									<input type="text" class="form-control" id="exampleInputEmail1" name="theme" placeholder="主题内容">
  								    </div>
					
									<input id ="rid007" name="rid" value="" type="hidden" style="width:95%">
									<input id ="rname007" name="rname" value="" type="hidden" style="width:95%">
						     		<textarea id="container" name="buildingV">编辑文本内容</textarea>
								</div>
						 	</form>
					
				</div><!-- 盖楼主体 end-->
					</div>
			</section>
		</div>
		<%@include file="footerForMem.jsp" %>
</body>
</html>