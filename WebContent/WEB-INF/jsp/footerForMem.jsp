<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.fff{
		z-index:9999;
		position:fixed;
		right: 0px;
		bottom:0px;
		width: 200px;
		height: 200px;
		}
	.fff .fHeader{
		background-color: white;
		filter:alpha(Opacity=80);-moz-opacity:0.5;opacity: 0.5;
		width: 20px;
		height: 20px;
		float: right;
		text-align: center;
		line-height: 20px;
		cursor:pointer;
	}
	.fff .fBody{
		overflow:auto;
		background:white;
		border:1px solid gray;
		width: 200px;
		height: 180px;
	}
	.fff .fBody div{ 
		font-size: 10pt;
	}
	.fff .fBody .hh{ 
		height: 30px;
		font-size: 12pt;
		text-align: center;
		line-height: 30px;
		color: blue;
	}
	.fff .fBody #fffText{ 
		margin-left:10px;
		text-align:justify;
		width: 180px;
		color:blue;
	}
	#fffbbOX{
		color:red;
	}
</style>
<script type="text/javascript">
	function fff(header) {
		var box = header.parentNode;
		box.style.display = "none";
		$.ajax({
			url:'${pageContext.request.contextPath }/Fz/FzMiss',
			dataType:'json',
			success:function(data){
				
			}
		})
	}
	$(function (){
		if('${fzMM}'=="t"){
			document.getElementById("fffbbOX").style.display = "none";
		}else{
			var fffText = document.getElementById("fffText");
			var fffHead = document.getElementById("fffHead");
			var str = "";
			str += "　　";
			str += "${fz[1].cd}"; 
			fffText.innerHTML = str;
			fffHead.innerHTML = ">>${fz[2].cd}<<";
		}
	});

</script>
</head>
<body>
	<div class="fff" id="fffbbOX">
		<div class="fHeader" onclick="fff(this)">
			X
		</div>
		<div class="fBody clear">
			<div class="hh" id="fffHead">
			 
			</div>
			<div>
				<div id="fffText">
					 
				</div>
			</div>
		</div>
	</div>
	<footer>
			<div class="msg">
				<div class="box">
					<div class="logo">
					</div>
					<div class="border">
					</div>
					<div class="center">
						<ul class="mu1">
							<li>
								<span class="zxmr">体质养颜</span>
								<ul class="mu2">
									<li><a href="http://www.euhealthy.com/yanbu/" target="_blank">阳虚质</a></li>
									<li><a href="http://www.euhealthy.com/bibu/" target="_blank">阴虚质</a></li>
									<li><a href="http://www.euhealthy.com/mianbu/" target="_blank">气虚质</a></li>
									<li><a href="http://www.euhealthy.com/xiongbu/" target="_blank">痰湿质</a></li>
									<li><a href="http://www.euhealthy.com/xizhi/" target="_blank">湿热质</a></li>
									<li><a href="http://www.euhealthy.com/zfyz/" target="_blank">血瘀质</a></li>
									<li><a href="http://www.euhealthy.com/erbu/" target="_blank">气郁质</a></li>
									<li><a href="http://www.euhealthy.com/smzx/" target="_blank">特禀质</a></li>
									<li><a href="http://www.euhealthy.com/chunbu/" target="_blank">平和质</a></li>
								</ul>
							</li>
							<li>
								<span class="etjk">儿童健康</span>
								<ul class="mu2">
									<li><a href="http://www.euhealthy.com/zsqz/" target="_blank">脾胃调理</a></li>
									<li><a href="http://www.euhealthy.com/tianchong/" target="_blank">免疫力提升</a></li>
									<li><a href="http://www.euhealthy.com/shoulian/" target="_blank">骨骼生长</a></li>
									<li><a href="http://www.euhealthy.com/shoutui/" target="_blank">智力成长</a></li>
								</ul>
							</li>
							<li>
								<span class="lnys">老年养生</span>
								<ul class="mu2">
									<li><a href="http://www.euhealthy.com/quban/" target="_blank">脾胃调理</a></li>
									<li><a href="http://www.euhealthy.com/qudong/" target="_blank">免疫力提升</a></li>
									<li><a href="http://www.euhealthy.com/meibai/" target="_blank">壮骨补钙</a></li>
									<li><a href="http://www.euhealthy.com/chuzhou/" target="_blank">补肾</a></li>
									<li><a href="http://www.euhealthy.com/jinfu/" target="_blank">补气</a></li>
									<li><a href="http://www.euhealthy.com/tuomao/" target="_blank">补血</a></li>
									<li><a href="http://www.euhealthy.com/yexiu/" target="_blank">防三高</a></li>
								</ul>
							</li>
							<li>
								<span class="nxyj">男性养精</span>
								<ul class="mu2">
									<li><a href="http://www.euhealthy.com/zhongzhiya/" target="_blank">酒后养肝</a></li>
									<li><a href="http://www.euhealthy.com/kaociya/" target="_blank">补肾壮阳</a></li>
									<li><a href="http://www.euhealthy.com/yachimeibai/" target="_blank">缓解疲劳</a></li>
									<li><a href="http://www.euhealthy.com/buya/" target="_blank">生发</a></li>
									<li><a href="http://www.euhealthy.com/yachixiufu/" target="_blank">抗压减压</a></li>
									<li><a href="http://www.euhealthy.com/laonianchike/" target="_blank">减小肚腩</a></li>
								</ul>
							</li>
							<li>
								<span class="jkxw">健康新闻</span>
								<ul class="mu2">
									<li><a href="http://www.euhealthy.com/zhifa/" target="_blank">春季养生</a></li>
									<li><a href="http://www.euhealthy.com/zhimeimao/" target="_blank">夏季养生</a></li>
									<li><a href="http://www.euhealthy.com/zhijiemao/" target="_blank">秋季养生</a></li>
									<li><a href="http://www.euhealthy.com/zhibinjiao/" target="_blank">冬季养生</a></li>
									<li><a href="http://www.euhealthy.com/zhihuxu/" target="_blank">节气体质</a></li>
									<li><a href="http://www.euhealthy.com/fajixian/" target="_blank">《千金方》</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="border">
					</div>
					<div class="right">
						<div class="wxxc">
							<dl>
								<dd></dd>
								<dt style="font-size:15px;">&nbsp;&nbsp;轻妍官方微信</dt>
								<dt>&nbsp;&nbsp;轻妍焕美</dt>
								<dt>&nbsp;&nbsp;qingyantizhi</dt>
							</dl>
							<p>公司地址：辽宁省本溪市</p>
							<p>健康热线：400 766 1686</p>
							<p>专享私人定制</p>
						</div>
					</div>
					<div class="clear bottom">
						<ul>
							<li><i class="footer_secicon1"></i><span>顾客体验</span></li>
							<li><i class="footer_secicon2"></i><span>体质严检</span></li>
							<li><i class="footer_secicon3"></i><span>专家资质</span></li>
							<li><i class="footer_secicon4"></i><span>原料安全</span></li>
							<li><i class="footer_secicon5"></i><span>生产安全</span></li>
							<li><i class="footer_secicon6"></i><span>质量严控</span></li>
							<li><i class="footer_secicon7"></i><span>客户管理</span></li>
							<li><i class="footer_secicon8"></i><span>承诺保障</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="msg2">
				<span>关于我们 |免责声明 |广告合作 |联系方式 |友情链接 |客服中心</span><br>
				<span>Copyright 2016 www.tyyy.com 版权所有   皖ICP备15018543号</span><br>
				<span>技术支持：沈阳依森信息科技</span>
			</div>
		</footer>
</body>
</html>