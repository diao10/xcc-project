<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>辽宁天蕴药业</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="tool/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="tool/jquery-1.7.2.min.js"></script>
<script src="tool/common.js"
	type="text/javascript"></script>

</head>
<body class="body_index">
	<!--Logo 开始-->
	<div id="logo">
		<div class="WebLogo">
			<a href="${pageContext.request.contextPath }/mobile/index.jsp"><img src="${pageContext.request.contextPath }/mobile/image/logo.jpg" /></a>
		</div>
	</div>
	<!--Logo 结束-->
	<!--导航条 开始-->
	<div id="navigation">
		<table cellspacing="1" cellpadding="0" align="center">
			<tr>
				<td><a href="${pageContext.request.contextPath }/mobile/index.jsp" class="current">网站首页</a></td>
				<td><a href="${pageContext.request.contextPath }/mobile/jkzjList.jsp">专家团队</a></td>
				<td><a href="${pageContext.request.contextPath }/mobile/newList.jsp">新闻资讯</a></td>
				<td><a href="${pageContext.request.contextPath }/mobile/analysis/analysis.html">体制分析</a></td>
			</tr>
		</table>
	</div>
	<!--导航条 结束-->
	<!--幻灯片 开始-->
	<div id="banner">
		<script type="text/javascript"
			src="tool/jquery.flexslider-min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('.flexslider').flexslider({
					controlNav : true,
					directionNav : false,
					animation : "slide",
				});
				$.ajax({
					url:'${pageContext.request.contextPath }/Tis/selTisAll.do',
					type:'post',
					data:{page:1,rows:7},
					dataType:'json',
					success:function(data){
						var htmlVal = "";
						$('#newsH').html("");
						for (var i = 0; i < data.news.length; i++) {
							var theNew = data.news[i];
							htmlVal += "<li><a href='${pageContext.request.contextPath }/Tis/selTisById.do?id="+theNew.id+"'><b>"+theNew.tisName+"</b></a></li>"
						}
						$('#newsH').html(htmlVal);
					}
				});
				$.ajax({
					url:'${pageContext.request.contextPath }/doctor/selDoctorForIndex.do',
					type:'post',
					data:{page:1,rows:20},
					dataType:'json',
					success:function(data){
						var htmlVal = "<ul>";
						$('#jkzj').html("");
						var count = data.list.length<6? data.list.length:6;
						for (var i = 0; i < count; i++) {
							var docc = data.list[i];
							htmlVal += "<li><a href='#'><div class='InfoPicture'>"+
								"<img src='${pageContext.request.contextPath }/"+docc.imgid+"' /></div>"+
							"<div class='InfoTitle'>"+docc.doctorName+"</div></a></li>";
						}
						$('#jkzj').html(htmlVal+"</ul>");
					}
				});
			});
		</script>
		<div class="flexslider">
			<ul class="slides">
				<li><img src="${pageContext.request.contextPath }/mobile/image/1.jpg" /></li>
				<li><img src="${pageContext.request.contextPath }/mobile/image/2.jpg" /></li>
				<li><img src="${pageContext.request.contextPath }/mobile/image/3.jpg" /></li>
			</ul>
		</div>
	</div>
	<!--幻灯片 结束-->
	<!--当前位置开始-->
	<!--当前位置结束-->
	
	<div class="index">
		<!--板块1 开始-->
		<div class="left_title">
			<h2>
			    <!--臭傻子跳转到列表页-->
				<a href="/">新闻资讯</a>
			</h2>			
			<span class="more"><a href=""><img src="image/more.gif"></a></span>
		</div>
		<div class="left_body">
			<ul class="textlist" id="newsH">
				<!--循环开始-->
				<!-- <li><a href="/" ><b>xxxxxxxxxxxxxxxxxxx</b></a></li>
				<li><a href="/" ><b>xxxxxxxxxxxxxxxxxxx</b></a></li>	 -->			
				<!--循环结束-->
			</ul>
		</div>
		<div class="left_bottom"></div>
		<!--板块1 结束-->
		<!--板块2 开始-->
		<div class="left_title">
		 <!--臭傻子跳转到列表页-->
			<h2>
				<a href="#">解决方案</a>
			</h2>
			<span class="more"><a href="#"><img
					src="image/more.gif"></a></span>
		</div>
		<div class="left_body">
			<ul class="gridlist">
				<!--循环开始-->
				<li><a href="#"><div class="InfoPicture">
							<img src="${pageContext.request.contextPath }/dist/img/jjfa1.jpg" />
						</div>
						<div class="InfoTitle">中医调理</div></a></li>
			   <li><a href="#"><div class="InfoPicture">
							<img src="${pageContext.request.contextPath }/dist/img/jjfa2.jpg" />
						</div>
						<div class="InfoTitle">国外诊断</div></a></li>
				<li><a href="#"><div class="InfoPicture">
							<img src="${pageContext.request.contextPath }/dist/img/jjfa3.jpg" />
						</div>
						<div class="InfoTitle">体质养颜</div></a></li>		
				<!--循环结束-->
			</ul>
		</div>
		<div class="left_bottom"></div>
		<!--板块2  结束-->
		<!--板块3 开始-->
		<!-- <div class="left_title">
			<h2>
				<a href="/wap/case.html">服务项目</a>
			</h2>
			<span class="more"><a href="/wap/case.html"><img
					src="image/more.gif"></a></span>
		</div>
		<div class="left_body">
			<ul class="textlist">
				循环开始
				<li><a href="/" title="你听过安利吗,听过保险致富密码?">你听过安利吗,听过保险致富密码?</a></li>
				<li><a href="/" title="你听过安利吗,听过保险致富密码?">你听过安利吗,听过保险致富密码?</a></li>
				<li><a href="/" title="你听过安利吗,听过保险致富密码?">你听过安利吗,听过保险致富密码?</a></li>
				循环结束
			</ul>
		</div>
		<div class="left_bottom"></div> -->
		<!--板块3 结束-->
		<!--板块4 开始-->
		<div class="left_title">
		 <!--臭傻子跳转到列表页-->
			<h2>
				<a href="/wap/product.html">健康专家</a>
			</h2>
			<span class="more"><a href="/"><img
					src="image/more.gif"></a></span>
		</div>
		<div class="left_body">
			<ul class="gridlist" id="jkzj">
				<!--循环开始-->
				<!-- <li><a href="/"><div class="InfoPicture">
							<img src="image/f.jpg" />
						</div>
						<div class="InfoTitle">xxxxxxxx</div></a></li>
				<li><a href="/"><div class="InfoPicture">
							<img src="image/f.jpg" />
						</div>
						<div class="InfoTitle">xxxxxxxx</div></a></li>
				<li><a href="/"><div class="InfoPicture">
							<img src="image/f.jpg" />
						</div>
						<div class="InfoTitle">xxxxxxxx</div></a></li> -->
				
				<!--循环结束-->
			</ul>
		</div>
		<div class="left_bottom"></div>
		<!--板块4  结束-->
		<div class="clear"></div>
	</div>
	<!--版权 开始-->
	<div id="copyright">
		<div class="bottom_navigation"></div>
		<div class="Mobile">
			<a href="tel:XXXXXXXXXXX">点击免费电话咨询:XXXXXXXXXXX</a>
		</div>
		
		<div class="bottom_copyright">
			辽宁天蕴药业有限公司&nbsp;&nbsp;ICP备XXXXXXXXXC号<br />电话:024-XXXXXXXX&nbsp;&nbsp;手机:XXXXXXXXXXX<br />地址:XXXXXXXXXXXXXXX<br />
		</div>
	</div>
	<!--版权 结束-->
	<div id="tool">
		<ul class="toollist toollist_blue">
			<li><a href="http://tysrysgj.com/"><img src="analysis/home.png">
					<p>网站首页</p></a></li>
			<li><a href="tel:13514285716"><img src="analysis/tel.png">
					<p>一键拨号</p></a></li>
			<li><a href="tel:13514285716"><img src="analysis/map.png">
					<p>联系我们</p></a></li>
			<li><a href="analysis/analysis.html"><img src="analysis/guestbook.png">
					<p>体制分析</p></a></li>
		</ul>
	</div>
</body>
</html>