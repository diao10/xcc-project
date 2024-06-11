<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" uri="/tyyyTag/powerTag" %>
<!DOCTYPE html>
<html>
<head>
<!--  <script src="http://siteapp.baidu.com/static/webappservice/uaredirect.js" type="text/javascript"></script>
 <script type="text/javascript">uaredirect("http://tysrysgj.com/mobile/index.jsp");</script> -->
 <script type="text/javascript" src="${pageContext.request.contextPath }/dist/js/xtRoll.js" ></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/xtRoll.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="distM.jsp" %>

<style type="text/css">
#jkzj *{ margin:0; padding:0; list-style:none;}    
#jkzj  { top:-10px;left:20px;width:950px;height:265px; margin:30px auto; position:relative; overflow:hidden;}    
#jkzj ul{ position:absolute; left:0; top:0;}    
#jkzj ul li{ width:200px; height:220px; float:left;margin-top: 30px;}
#jkzj ul li .jkzjH{margin-left: 20px;margin-top: -20px;}      
#jkzj ul li .jkzjB{margin-top: 20px;}       
#jkzj ul li .jkzjBB{margin-left: 30px;width:130px;display: block;} 
	@media only screen and (max-width: 1200px) {
		#cgMain{
			width: 1200px;
		}
	}
</style>
</head>
<body> 
		<%@include file="headerForMem.jsp" %>
		<div class="tycg" id="tycg">
			<div class="cgMain" id="cgMain">
				<div class="cg"><img src="${pageContext.request.contextPath }/dist/img/gun1.jpg" alt="宣传图1"></div>
				<div class="cg"><img src="${pageContext.request.contextPath }/dist/img/gun2.jpg" alt="宣传图1"></div>
				<div class="cg"><img src="${pageContext.request.contextPath }/dist/img/gun3.jpg" alt="宣传图1"></div>
				<ul>
					<li data-id="1"></li>
					<li data-id="2"></li>
					<li data-id="3"></li>
				</ul>
			</div>
		</div>
 	<div class="tyMain">
		<div class="tyMainBody">
			<div class="row gray" style="height: 350px;">
				<div class="box" style="padding-top: 15px;">
					<h3 class="text-center">● 服务项目 ●</h3>
					<div class="fwxm">
						<ul>
							<li>
								<a class="bg" href="#">
									<i class="yy item1"></i>
									<span class="title">会员中心</span>
									<span class="body">全方位会员专享服务</span>
								</a>
							</li>
							<li>
								<a class="bg" href="#">
									<i class="yy item2"></i>
									<span class="title">健康档案</span>
									<span class="body">最权威的医疗大数据全程跟踪</span>
								</a>
							</li>
							<li>
								<a class="bg" href="#">
									<i class="yy item3"></i>
									<span class="title">家庭医生</span>
									<span class="body">500+资深全科医生</span>
								</a>
							</li>
							<li>
								<a class="bg" href="#">
									<i class="yy item4"></i>
									<span class="title">体质调理</span>
									<span class="body">最系统的体质养颜养生方案</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="box" style="padding-top: 15px;">
					<h3 class="text-center" >● 解决方案 ●</h3>
					<div class="jjfa">
						<ul>
							<li class="jj1">
								<a href="#">
										<span class="box">
											<span class="header">
												中医调理
											</span>
											<span class="body">
												
												亚健康的您还为无法解释的健康问题发愁吗？我们为您私人定制了中医体质调理解决方案，为您的健康保驾护航。
											</span>
										</span>
								</a>
							</li>
							<li class="jj2">
								<a href="#">
										<span class="box">
											<span class="header">
												国外诊断
											</span>
											<span class="body">
												
												国内误诊误治的死亡率高达23%，我们应用国外精确的血液检查指标进行判断，可避免晚期疾病和错误治疗的发生。
											</span>
										</span>
								</a>
							</li>
							<li class="jj3">
								<a href="#">
										<span class="box">
											<span class="header">
												体质养颜
											</span>
											<span class="body">
												
												爱美的您还在用化妆品粉饰自己的容颜吗？我们为您私人订制体质养颜方案，让您美丽又健康。
											</span>
										</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row gray">
				<div class="box" style="padding-top: 15px;">
					<h3 class="text-center">● 健康专家 ●</h3>
					<div class="jkzj">
						<div id="jkzj">
						<%-- <ul>
							<li>
								<div class="jkzjH">
									<img alt="" src="${pageContext.request.contextPath }/dist/img/touxiangTest.png">
								</div>
								<div class="jkzjB">
									<span class="jkzjBH">
										某某某
									</span>
									<span class="jkzjBB">
										啊实打实大所多啊实打实大所多阿达四大阿达大声道阿达四大大声道阿萨德
									</span>
								</div>
							</li>
						</ul> --%>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="box">
					<h3 class="text-center">● 动态资讯 ●</h3>
					<div class="dtzx">
							<div class="dtzxB">
								<div class="containerQ" id="idTransformView">
								  <ul class="slider" id="idSlider">
								    <li><a href="#"><img src="${pageContext.request.contextPath }/dist/img/qie1.jpg"/></a></li>
								    <li><img src="${pageContext.request.contextPath }/dist/img/qie2.jpg"/></li>
								    <li><img src="${pageContext.request.contextPath }/dist/img/qie3.jpg"/></li>
								    <li><img src="${pageContext.request.contextPath }/dist/img/qie2.jpg"/></li>
								  </ul>
								  <ul class="num" id="idNum">
								    <li>1</li>
								    <li>2</li>
								    <li>3</li>
								    <li>4</li>
								  </ul>
								</div>
							</div>
							<div class="dtzxB" style="margin-left: 60px">
								<ul class="news" id="newsH">
									<li>
										<span>2017-09-11</span>
										<a href="#">玩命加载中...</a>
									</li>
									
								</ul>
							</div>
							<div class="dtzxF clear">
								<div style="float: right;margin-right: 30px;">
									<a href="${pageContext.request.contextPath }/Tis/selTis.do?htmlName=tis" >更多&gt;&gt;</a>
								</div>
							</div>
					</div>
				</div>
			</div>
			<div class="row gray" style="height: 350px;">
				<div class="box" style="padding-top: 15px;">
					<h3 class="text-center">● 合作伙伴 ●</h3>
					<div class="hzhb">
						<ul>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz2.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz3.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz4.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz5.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz6.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz7.jpg"></li>
						</ul>
						<ul>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz8.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz9.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz10.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz11.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz12.jpg"></li>
							<li><img src="${pageContext.request.contextPath }/dist/img/hz13.jpg"></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row" style="height: 400px;">
				<div class="box">
					<div class="jrwm">
						<div class="jr">
							<span>您想要成为健康的使者，给家人和身边的朋友带来健康吗？</span><br>
							<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#register">立即注册登录</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
		<%@include file="footerForMem.jsp" %>
	<script type="text/javascript">
		xtR = new xtRoll(document.getElementById("cgMain"));
		xtR.direction = "left";
		xtR.init();
		//alert(xtR.childLi[0].getElementsByTagName("img")[0].offsetHeight-1);
		xtR.out.style.height = "390px";
		window.onresize = function(){
			xtR.out.style.height = xtR.childLi[0].getElementsByTagName("img")[0].offsetHeight + "px";
			xtR.btnUl.style.left = xtR.out.offsetWidth/2 - 40 + "px";
		}
		
		//动态资讯
		function Each(list, fun){
			for (var i = 0, len = list.length; i < len; i++) { fun(list[i], i); }
		};
		var idNum = document.getElementById("idNum");
		var objs = idNum.getElementsByTagName("li");
		
		                                              //滚动对象           高度        个数
		var tv = new TransformView("idTransformView", "idSlider", 280, 4, {
			onStart : function(){ Each(objs, function(o, i){ o.className = tv.Index == i ? "on" : ""; }) }//按钮样式
		});
		
		tv.Start();
		
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
					var time = "";
					if(theNew.createTime!=null){
						time = new Date(theNew.createTime).Format("yyyy-MM-dd");
					}
					var gggName = theNew.tisName;
					if(gggName.length>20){
						gggName = gggName.substring(0,20); 
						gggName += "..";
					}
					htmlVal += "<li><span>"+time+"</span><a href='${pageContext.request.contextPath }/Tis/selTisById.do?id="+theNew.id+"'>"+gggName+"</a></li>"
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
				for (var i = 0; i < data.list.length; i++) {
					var docc = data.list[i];
					htmlVal += "<li><div class='jkzjH'>"+
					"<img src='${pageContext.request.contextPath }/"+docc.imgid+"'>"+
					"</div><div class='jkzjB'><span class='jkzjBH'>"+docc.doctorName+"</span>"+
					"<span class='jkzjBB'>"+docc.shortd+"</span></div></li>"
				}
				$('#jkzj').html(htmlVal+"</ul>");
				
				var oBox=document.getElementById('jkzj');    
				var oUl=oBox.children[0];    
				var aLi=oUl.children;    
				
				//复制一份内容 ，制作出无缝的效果   
				oUl.innerHTML+=oUl.innerHTML;    
				oUl.style.width=aLi.length*aLi[0].offsetWidth+'px';    
				     
				var stopKG = setInterval(go,50);
				function go(){
					var l=oUl.offsetLeft-1;  //图片切换，就是移动距离
				    if(l<=-oUl.offsetWidth/2){    
				        l=0;    
				    }    
				    oUl.style.left=l+'px';   
				}
				//ul添加鼠标移动事件
				oUl.onmouseover = function(){
					clearInterval(stopKG);
				};
				//鼠标离开
				oUl.onmouseout  = function(){
					stopKG = setInterval(go,100);
				};
			}
		});
	</script>
</body>
</html>