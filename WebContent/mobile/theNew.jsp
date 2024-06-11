<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>臭傻子这里写标题</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="keywords" content="臭傻子这里写关键字,3-4个" />
<meta name="description" content="臭傻子这里写描述" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="tool/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="tool/jquery-1.7.2.min.js"></script>
<script src="tool/common.js" type="text/javascript"></script>

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
				<td><a href="${pageContext.request.contextPath }/mobile/index.jsp">网站首页</a></td>
				<td><a href="${pageContext.request.contextPath }/mobile/jkzjList.jsp">专家团队</a></td>
				<td><a href="${pageContext.request.contextPath }/mobile/newList.jsp" class="current">新闻资讯</a></td>
				<td><a href="${pageContext.request.contextPath }/mobile/analysis/analysis.html">体制分析</a></td>
			</tr>
		</table>
	</div>
	<!--导航条 结束-->
	<!--幻灯片 开始-->
	<div id="banner">
		<script type="text/javascript" src="tool/jquery.flexslider-min.js"></script>
		<script type="text/javascript">
			//日期格式
			Date.prototype.Format = function (fmt) { //author: meizz 
			    var o = {
			        "M+": this.getMonth() + 1, //月份 
			        "d+": this.getDate(), //日 
			        "h+": this.getHours(), //小时 
			        "m+": this.getMinutes(), //分 
			        "s+": this.getSeconds(), //秒 
			        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
			        "S": this.getMilliseconds() //毫秒 
			    };
			    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			    for (var k in o)
			    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			    return fmt;
			}
			$(document).ready(function() {
				$('.flexslider').flexslider({
					controlNav : true,
					directionNav : false,
					animation : "slide",
				});
				$.ajax({
					url:"${pageContext.request.contextPath }/Tis/selTisByIdMoblie",
					data:{id:<%=request.getParameter("id")%>},
					type:"post",
					success:function(data){
						var time = "";
						if(data.tis.tisName!=null){
							time = new Date(data.tis.createTime).Format("yyyy-MM-dd");
						}
						$('#theNew').html("<li><h1>"+data.tis.tisName+"</h1>"+
							"<div class='InfoTime'>"+time+"</div>"+
								"<div class='InfoContent'>"+data.tis.tisContent+"</div></li>");
					}
				});	
			});
		</script>
		<div class="flexslider">
			<ul class="slides">
				<li><img src="image/1.jpg" /></li>
				<li><img src="image/2.jpg" /></li>
				<li><img src="image/3.jpg" /></li>
			</ul>
		</div>
	</div>
	<!--幻灯片 结束-->

	<!--当前位置开始-->
	<div id="location">
		<a href="${pageContext.request.contextPath }/mobile/index.jsp">网站首页</a>><a class="current_channel" href="#">新闻详情</a>
	</div>
	<!--当前位置结束-->
	<div class="article">
		<div class="left_title">
			<span class="more"><a href="#"><img src="image/more.gif"></a></span>
			<h2>
				<a href="#">新闻详情</a>
			</h2>
		</div>
		<div class="download">
			<ul class="wxlist" id="theNew">
				<li><h1>详情标题XXXXXXXX</h1>
					<div class="InfoTime">2017-2-18 HH:MM:SS</div>
					<div class="InfoContent">xxxxxx</div></li>
			</ul>
		</div>
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