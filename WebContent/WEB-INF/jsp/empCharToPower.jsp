<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/zTreeStyle/demo.css" type="text/css">
	<%@include file="dist.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/zTreeStyle/zTreeStyle.css" type="text/css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/jquery.ztree.excheck.js"></script>	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
		var id =${id};//角色ID
		var v="";
		function xxNode(id,pId,name){
			this.id =  id;
			this.pId = pId;
			this.name = name;
		}

		window.onload=function(){
			$.ajax({
				url:"../Power/selPowerAll.emp",
				success:function(data){
					//节点数组
					var zNodes = [];
					for(var i=0;i<data.list.length;i++){
						var node = new xxNode(data.list[i].pid, data.list[i].superId, data.list[i].powerName);
						zNodes.push(node);
					}
								
					var setting = {
							check: {
								enable: true
							},
							data: {
								simpleData: {//简单数据模式
									enable: true
								}
							},
							async:{
								enable: true,	//开启异步加载模式
								url: "../Power/selPowerByCharId.emp?id="+id,
								autoParam: ['id'],
								dataFilter: filter
							},  
							callback:{
								onCheck:onCheck
							} 	
					};
						
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
					$.fn.zTree.init($("#treeRight"),setting);
				}
			});
		}
		//获取被选中的节点
		function onCheck(e,treeId,treeNode){
	         var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
	         nodes=treeObj.getCheckedNodes(true);
	        /*  var treeOBj=$.fn.zTree.getZTreeObj("treeRight");
	         nodes=treeObj.getCheckedNodes(true); */
	         //将角色ID设置为第一个数字
	         v=$('#charId').val()+",";	
	         for(var i=0;i<nodes.length;i++){
	         	v+=nodes[i].id + ",";
	         	
	         } 
	     }   
		
	 	 function filter(treeId, parentNode, responseData) {
			 	//权限数组
			 	var arrayP = new Array();
	            if (!responseData) return null;
			 	
			 		for (var i=0;i<responseData.list.length ;i++) {
			            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					 	var node = treeObj.getNodeByParam("id",responseData.list[i].pid,null);
					 	node.checked="true";
					 	treeObj.checkNode(node,true,false);
			 		}
			 	
	            return arrayP;
	        } 
		
		//发送数据
		function send(){
	        //显示获取的节点id
			$.ajax({
		        	data:{v:v},
		         	url:"${pageContext.request.contextPath}/empChar/addPowerToChar.emp", 
		        	success:function(data){
		        		location.href="${pageContext.request.contextPath}/empChar/selEmpCharAll.emp";
		        	} 
			})
		}
		
		
		//为隐藏的charId赋值
		$(function(){
			
			if(id!=null){
				$('#charId').val(id);		
			}else{
				alert('未接收到角色ID');
			}
			
		})
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
			  <li id="uuOne">角色管理</li>
			  <li id="uuTwo" class="active">角色信息</li>
			</ol>
			<!-- 表格 -->
			<h4 style="text-align:center;">角色管理</h4>
			<div style=" width:80px; height:35px;float:right;margin-top:12px; " >
				
			</div>
			<div class="tCtableDiv clear">
			  <input id="charId" style="display: none">
			  <button onclick="send()">提交</button>
			  <div class="zTreeDemoBackground left" style="float:left;">
				<ul id="treeDemo" class="ztree"></ul>
			  </div>
			<!--   此div为接收后台数据匹配前台 -->
			  <div class="zTreeDemoBackground left"  style="display: none;">
				<ul id="treeRight" class="ztree"></ul>
			  </div>
			</div>
		</div>
		<!-- 内容区域End -->
		</div>
		<%@include file="footerForEmp.jsp" %>
		
	</div>	
</body>
</html>
