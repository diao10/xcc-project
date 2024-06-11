<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="distM.jsp" %>
	<script src="${pageContext.request.contextPath }/dist/js/qieqie.js"></script>
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
	<div class="tyMain">
		<%@include file="headerForMem.jsp" %>
		<div class="tyMainBody">
			<section id="" class="messContent">
				<div class="messContent-header">
					<div class="messContent-header-bar">
						<span style="display: block;float: left;margin-left: 30px;">共xx楼</span>
						<span style="display: block;float: right;margin-right: 30px;"><a>返回</a></span>
					</div>
					<div class="messContent-header-title">
						<div><h1><span>title</span></h1></div>
					</div>
				</div>
				<div> <!-- 盖楼主体 -->
					<div class="messContent-body">
						<div class="messContent-left">
							<div class="messContent-left-content">
								<div class="messContent-left-content-header">
									<!-- 专家图标 -->
									<div></div>
									<ul class="messContent-left-content-body">
										<li class="messContent-left-content-body-img">
											<img src="../dist/img/head_img.png">
										</li>
										<li class="messContent-left-content-body-msg">名字</li>
										<li class="messContent-left-content-body-msg">备用</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="messContent-right">
							<div style="width: 100px;">xxxx-xx-xx xx:xx:xx</div>
							<div style="width: 50px;">xx楼</div>
							<!-- 内容回填 -->
						</div>
					</div>
					
					<div class="messContent-body">
						<div class="messContent-left">
							<div class="messContent-left-content">
								<div class="messContent-left-content-header">
									<div></div>
									<ul class="messContent-left-content-body">
										<li class="messContent-left-content-body-img">
											<img src="../dist/img/head_img.png">
										</li>
										<li class="messContent-left-content-body-msg">名字</li>
										<li class="messContent-left-content-body-msg">备用</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="messContent-right">
							<p><img style="width: 300px;height: 300px;" src="../dist/img/hj4.jpg"></p>
							<span>121212</span>
						</div>
					</div>
					
					<div class="messContent-body">
						<div class="messContent-left">
							<div class="messContent-left-content">
								<div class="messContent-left-content-header">
									<div></div>
									<ul class="messContent-left-content-body">
										<li class="messContent-left-content-body-img">
											<img src="../dist/img/head_img.png">
										</li>
										<li class="messContent-left-content-body-msg">名字</li>
										<li class="messContent-left-content-body-msg">备用</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="messContent-right">
							<div style="width: 100px;">xxxx-xx-xx xx:xx:xx</div>
							<div style="width: 50px;">xx楼</div>
							<p><img style="width: 300px;height: 300px;" src="../dist/img/hj4.jpg"></p>
							<span>121212</span>
						</div>
					</div>
				</div><!-- 盖楼主体 end-->
					<div class="messContent-footer">
						<div class="pageDiv">
							<nav>
							  <ul class="pagination pagination-lg">
							    <li><a href="#">&laquo;</a></li>
							    <li><a href="#">1</a></li>
							    <li><a href="#">2</a></li>
							    <li class="active"><a href="#">3</a></li>
							    <li><a href="#">4</a></li>
							    <li><a href="#">5</a></li>
							    <li><a href="#">6</a></li>
							    <li><a href="#">7</a></li>
							    <li><a href="#">8</a></li>
							    <li><a href="#">9</a></li>
							    <li><a href="#">10</a></li>
							    <li><a href="#">&raquo;</a></li>
							  </ul>
							</nav>
						</div>
						<div>
							<form action="../Tis/addTis.emp" method="post">
								<div>
									<!-- 主题id -->
									<input id="theme" type="hidden" style="width:95%">
						     		<textarea id="container" name="tisContent">编辑文本内容</textarea>
								</div>
						     	<input type="submit" value="发表" />
						 	</form>
						</div>
					</div>
			</section>
		</div>
		<%@include file="footerForMem.jsp" %>
	</div>
</body>
</html>