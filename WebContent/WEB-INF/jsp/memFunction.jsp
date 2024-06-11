<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="distM.jsp" %>
<script src="${pageContext.request.contextPath }/dist/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/dist/js/bootstrap.min.js"></script>
	<link rel='stylesheet'  href="${pageContext.request.contextPath }/dist/css/csshake.min.css">
	<link rel='stylesheet'  href="${pageContext.request.contextPath }/dist/css/xtDate.css">
<script src="${pageContext.request.contextPath }/dist/js/xtDate.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/dist/js/clock.js" type="text/javascript"></script>
<script type="text/javascript">
var mm;
	function a1() {
		$("#classMem").css("display","block");
		$("#levelMem").css("display","none");
		$("#a5").css("display","block");
		$("#a6").css("display","none");
		$("#ssd").css("display","block");
		$("#a2").removeClass("active");
		$("#a1").addClass("active");
		$("#a7").removeClass("active");
		$(".ccca").css("display","none");
		$(".cb").css("display","block");
		$("#aw").css("display","none");
		$("#aw1").removeClass("active");
		$("#signs").css("display","none");
	}
	function a2() {
		$("#classMem").css("display","none");
		$("#levelMem").css("display","block");
		$("#a6").css("display","block");
		$("#ssd").css("display","block");
		$("#a5").css("display","none");
		$("#a1").removeClass("active");
		$("#a2").addClass("active");
		$("#a7").removeClass("active");
		$(".ccca").css("display","none");
		$(".cb").css("display","block");
		$("#aw").css("display","none");
		$("#aw1").removeClass("active");
		$("#signs").css("display","none");
	}
	function a7() {
		$("#a7").addClass("active");
		$("#ssd").css("display","none");
		$(".ccca").css("display","block");
		$(".cb").css("display","none");
		$("#a1").removeClass("active");
		$("#a2").removeClass("active");
		$("#aw").css("display","none");
		$("#aw1").removeClass("active");
		$("#signs").css("display","block");
	}
	function aw(){
		$("#ssd").css("display","none");
		$(".ccca").css("display","none");
		$(".cb").css("display","none");
		$("#a1").removeClass("active");
		$("#a2").removeClass("active");
		$("#a7").removeClass("active");
		$("#aw1").addClass("active");
		$("#aw").css("display","block");
		$("#selO").css("display","none");
		$("#sel").css("display","block");
		$("#signs").css("display","none");
	}
	function sel(id){
		 $("#selO").html("");
		$("#sel").css("display","none");
		$.ajax({
			data:{id:id},
			type:'post'	,
			dataType:'json',
			url:'${pageContext.request.contextPath }/Member/selMemberById.do',
			success:function(data){
				$("#selO").css("display","block");
				$("#sel").css("display","none");
				 $("#selO").append("<li>姓名："+data.mems.memName+"</li><li>个人码："+data.mems.memId+"</li><li>性别："+data.mems.memGender+"</li><li>邮箱："+data.mems.memEmail+"</li><li>电话："+data.mems.memTel+"</li><li>积分："+data.mems.memIntegral+"</li><li>职阶："+data.mems.memClassName+"</li>"
							+"<li>点数："+data.mems.memPoint+"</li><li>等级："+data.mems.memLevelName+"</li>");
				
			}
		})
		
	}
 	window.onload=function(){	
	  var aa = new xtDate(document.getElementById("xtDate")); 
		 $.ajax({
			url:'${pageContext.request.contextPath }/Member/getInsertingMem.do',
			data:{referrerId:'${memLogin.memId}',id:'${memLogin.id}'},
			dataType:'json',
			success:function(data){
				aa.tabJson = data;
				aa.init();
				if('${a}'==2){
					a2();
				}else if('${a}'==0){
					a7();
				}else if('${a}'==1){
					a1();
				} 
			}
		}); 
		 
	 mm='${memLogin.memClassName}'
	 mn='${memLogin.memLevelName}'
	 $("#a4").find("tr").each(function () {
			if($(this).children('td:eq(2)').text()==mn){
				$(this).css("font-weight", "bold")
			}
			});
	 $("#a3").find("tr").each(function () {
			if($(this).children('td:eq(2)').text()==mm){
				$(this).css("font-weight", "bold")
			}
			});
	 if('${signs}'==2){
		 $("#signs").append("<img alt='' src='${pageContext.request.contextPath}/dist/img/signs.png'>");
	 }else{
		 $("#signs").html("");
	 }
	
	}
 	
	function getId(id){
		$("#send").modal();
		$("#sId").val(id);
	}
	function signs(memClass,href){
		//${pageContext.request.contextPath}/MemClass/addSign1.do?id=${memLogin.id}
		var basepath = ${pageContext.request.contextPath}/
		if (memClass <= 1) {
			alert("您的积分不够,请努力哦!");
		}else{
			location.href = basepath + href;
		}
	}
</script>
<style type="text/css">
.ccca{
	width: 505px;
	height: 100%;
	margin-top: 50px;
	margin-left: 100px;
}
.cb{
	width: 505px;
	height: 100%;
	margin-top: 50px;
	margin-left: 100px;
}
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
<body>
		<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody">
			<div class="boxg1">
				<div class="left">
					<ul>
						<li id="a7" class="active">
							<a href="#" onclick="a7()">会员签到详情</a>
						</li>
						<li id="a1" class="">
							<a href="#" onclick="a1()">会员职阶详情</a>
						</li>
						<li id="a2" class="" >
							<a href="#" onclick="a2()">会员等级详情</a>
						</li>
						<li id="aw1" class="" >
							<a href="${pageContext.request.contextPath}/MemClass/selMyMem.do" onclick="aw()">我的会员</a>
						</li>
					</ul>
				</div>
				<div class="right">
					<div class="body" >
					<a id="signs" href="javascript:;" onclick="signs(${memLogin.memClass},'MemClass/addSign1.do?id=${memLogin.id}')"></a>
						<div class="ccca"> 
							<div id="xtDate" style="width: 500px;margin: 0 auto;"></div>
						</div>
						<div class="cb">
							
					<div id="a5" style="margin-left:2%; font-size:20px;margin-top:15px;width:690px;height:40px;display:none;">
					姓名：${memLogin.memName} &nbsp; &nbsp;当前积分：${memLogin.memIntegral} &nbsp; &nbsp; 当前职阶：${memLogin.memClassName}
					</div>
					<div id="a6" style="margin-left:2%; font-size:20px;margin-top:15px;width:690px;height:40px;display:none;">
					姓名：${memLogin.memName} &nbsp; &nbsp;当前点数：${memLogin.memPoint} &nbsp; &nbsp;当前等级 ：${memLogin.memLevelName}
					</div>
						<div id="ssd" style="margin-left:2%;border:1px solid black;margin-top:5px;width:505px;height:1px;display:none;"></div>
						<!-- 表格a1 -->
						<div id="classMem" style="margin-left:2%; margin-top:2px;width:505px;height:450px;display:none;">
			  <table id="a3" class=" table-hover tCtable" style="width:505px;">
			  	<col width="160px"/><col width="160px"/><col width="185px"/>
			    <thead>
					<tr>
					 	<th style="text-align:center;height:50px">最小分</th>
						<th style="text-align:center;height:50px">最大分 </th>
						<th style="text-align:center;height:50px">职阶名称  </th>
					</tr>
				</thead>
				<tbody id="tbody">
				<c:forEach items="${pb.list}" var="memClass" >
											<tr style="text-align:center;height:40px" >
												<td >${memClass.classMin}</td>
											 	<td >${memClass.classMax}</td>
											 	<td >${memClass.className}</td>
											</tr>
					</c:forEach>
				</tbody>
			  </table>
						
						</div>
						
						<!-- 表格a2 -->
						<div id="levelMem" style="margin-left:2%; margin-top:2px;width:505px;height:450px;display:none;">
			  <table id="a4" class=" table-hover tCtable" style="width:505px;">
			  	<col width="160px"/><col width="160px"/><col width="185px"/>
			    <thead>
					<tr  >
								 	<th style="text-align:center;height:50px">最小点数</th>
									<th style="text-align:center;height:50px">最大点数 </th>
									<th style="text-align:center;height:50px">等级名称  </th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${pb2.list}" var="memLevel" >
				
											<tr  style="text-align:center;height:40px" >
											<td >${memLevel.levelMin}</td>
											 <td >${memLevel.levelMax}</td>
											  <td >${memLevel.levelName}</td>
											</tr>
					</c:forEach>
				</tbody>
			  </table>
						
						</div>
						</div>
					</div>
				
			</div>
			<!-- 发送 -->
		</div>
		<div class="modal fade" id="send" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="ffs"  action="${pageContext.request.contextPath}/message/add.do" accept-charset="utf-8"  method="post" >
				<div style="width:500px;height:250px;margin:0 auto;float-left:30px;" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">发送信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                      		  <input style="display:none;" class="form-control  " type="text"  name ="sid"  id="sId">
		                      		  <input name="mess_theme" value="${memLogin.memName}祝你生日快乐" hidden="hidden">
		                <div class="row" style="width:500px;height:50px;">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">消息</label>
		                            <textarea class="form-control "  id="mess_theme" name="theme"  placeholder="消息"></textarea>
		                        </div>
		                    </div>
		                </div>
		                </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <button id="" class="btn btn-danger"  data-dismiss="modal" aria-hidden="true" >取消</button>
		                </div>
		            </div>
					</div>
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
		<%@include file="footerForMem.jsp" %>
</body>
</html>