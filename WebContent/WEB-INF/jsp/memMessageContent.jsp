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
		img{
		max-width:500px
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
	        
	       
	        
	</script> 
</head>
<body>
	<%@include file="headerForMem.jsp" %>
	<script type="text/javascript">
	 $("#indexs").removeClass("active");
     $("#doc").addClass("active");
	</script>
	<div class="tyMain">
		<div class="tyMainBody">
			<section id="" class="messContent">
				<div class="messContent-header">
					<div class="messContent-header-bar">
						<span style="display: block;float: left;margin-left: 30px;">共${count}楼</span>
						<c:if test="${type==1 }">
						<span style="display: block;float: right;margin-right: 30px;"><a href="${pageContext.request.contextPath}/theme/selThemeAll.do">返回</a></span>
						</c:if>
						<c:if test="${type==2 }">
							<span style="display: block;float: right;margin-right: 30px;"><a href="${pageContext.request.contextPath}/theme/doctorSelThemeAll.do">返回</a></span>
						</c:if>
					</div>
					<center>
					<div >
						<div><h2><span >${title.theme}</span></h2></div>
					</div>
					</center>
				</div>
					<div style="height: 50px;width: 100%"></div>
				<c:forEach items="${list }" var="building">
				<div> <!-- 盖楼主体 -->
					<div class="messContent-body">
						<div class="messContent-left">
							<div class="messContent-left-content">
								<div class="messContent-left-content-header">
									<!-- 专家图标 -->
									<c:if test="${building.senderType==1}">
									<div ></div>
									</c:if>
									<ul class="messContent-left-content-body">
										<li class="messContent-left-content-body-img">
											<c:if test="${building.senderType==1}">
											<img style="width: 120px; height: 120px" src="${pageContext.request.contextPath }/${docImg}">
											</c:if>
											<c:if test="${building.senderType!=1}">
											<img src="${pageContext.request.contextPath }/dist/img/head_img.png">
											</c:if>
										</li>
										<li class="messContent-left-content-body-msg">${building.sender }</li>
										<c:if test="${building.senderType==1}">
											<li class="messContent-left-content-body-msg">${docLevel}</li>
										</c:if>
										<c:if test="${building.senderType!=1}">
											<li class="messContent-left-content-body-msg">${level}</li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						<div class="messContent-right">
							<div style="width: 100px; " id="time"><jsp:useBean id="timer" class="java.util.Date"/>

<fmt:formatDate value="${building.createDate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></div>
							<div style="width: 50px;">${building.buildingF }楼</div>
							<!-- 内容回填 -->
							<div style="float: left; width:610px; height:100%;margin: 20px 20px 0px 20px">${building.buildingV }</div>
						</div>
					</div>
					
					
				</div><!-- 盖楼主体 end-->
				</c:forEach>
					<div class="messContent-footer">
						<div class="pageDiv">
							<nav>
							  <ul class="pagination pagination-lg">
							   	 <li  <c:if test="${page==1}">disabled</c:if>><a onclick="down()" <c:if test="${page!=1}"> href="${pageContext.request.contextPath}/building/selBuilding.do?page=${page-1}&sid=${themeId }" </c:if>>&laquo; </a></li>
						   		 		<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
						   		 		<c:forEach var="i" begin="${begin}" end="${end}">
						   					<li <c:if test="${i==page }">class="active"</c:if>><a href="${pageContext.request.contextPath}/building/selBuilding.do?page=${i}&sid=${themeId }" >${i}</a></li>
						   				</c:forEach>
						   				<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
						   		 <li <c:if test="${page==pages}">disabled</c:if>><a onclick="up()" <c:if test="${page!=pages}"> href="${pageContext.request.contextPath}/building/selBuilding.do?page=${page+1}&sid=${themeId }" </c:if>> &raquo;</a></li>
								
							  </ul>
							</nav>
						</div>
						<c:if test="${type==1 }">
						<div style="height: 300px">
							<form action="${pageContext.request.contextPath}/building/addBuilding.do" method="post">
						     	<div style="width: 30px"><button class="btn btn-default" type="submit">发送</button></div>
								<div>
									<!-- 主题id -->
									<input name="themeId" value="${themeId }" type="hidden" style="width:95%">
						     		<textarea id="container" name="buildingV">编辑文本内容</textarea>
								</div>
						 	</form>
						</div>
						</c:if>
						<c:if test="${type==2 }">
						<div style="height: 300px">
							<form action="${pageContext.request.contextPath}/building/doctorAddBuilding.do" method="post">
						     	<input type="submit" value="发表" />
								<div>
									<!-- 主题id -->
									<input name="themeId" value="${themeId }" type="hidden" style="width:95%">
						     		<textarea id="container" name="buildingV">编辑文本内容</textarea>
								</div>
						 	</form>
						</div>
						</c:if>
					</div>
			</section>
		</div>
	</div>
		<%@include file="footerForMem.jsp" %>
</body>
</html>
