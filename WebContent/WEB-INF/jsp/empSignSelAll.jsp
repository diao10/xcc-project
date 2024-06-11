<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" uri="/tyyyTag/powerTag" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>
<title>Insert title here</title>

<script type="text/javascript">
var aa;
$(function() {
	//消息提示信息
	var msgg='${msg}';
	msg(msgg);
	//展开列表
	currentPage("eB");
	//消息提示框
	//日期选择插件
	 var picker = new Pikaday(
			    {
			        field: document.getElementById('sign_time'),
			        firstDay: 1,
			        minDate: new Date('1950-01-01'),
			        maxDate: new Date('2020-12-31'),
			        yearRange: [1950,2020]
			    });
	 var picker = new Pikaday(
			    {
			        field: document.getElementById('signTime'),
			        firstDay: 1,
			        minDate: new Date('1950-01-01'),
			        maxDate: new Date('2020-12-31'),
			        yearRange: [1950,2020]
			    });
});
//值回填
function sel(id) {
	$.ajax({
		data:{id:id},
		url:"${pageContext.request.contextPath}/Sign/selSignById.emp",	
		success:function(data){
			$("#bid").val(data.s.id),
			$("#mName").val(data.s.mem_name),
			$("#mid").val(data.s.memId),
			$("#sid").val(data.s.id),
			$("#sName").val(data.s.mem_name),
			$("#smemId").val(data.s.memId);
		}
	})		
} 
function c(signTime){
	var memId = $("#mid").val();
	var signTime = $("#sign_time").val();
	$.ajax({
		data:{signTime:signTime,memId:memId},
		type:'post',
		url:"${pageContext.request.contextPath}/Sign/selSign.emp",
		success:function(data){
			if(data!=null&&data!=""){
				document.getElementById("span").innerHTML="<font color=red>已签到</font>"
			}else{
				document.getElementById("span").innerHTML="<font color=green>可签到</font>"
			}
		}
	});
	var memid= $("#smemId").val();
	var signtime = $("#signTime").val();
	$.ajax({
		data:{signTime:signtime,memId:memid},
		url:"${pageContext.request.contextPath}/Sign/selSign.emp",
		success:function(data){
			if(data!=null&&data!=""){
				document.getElementById("S").innerHTML="<font color=green>可删除</font>"
			}else{
				document.getElementById("S").innerHTML="<font color=red>未签到,不可删</font>"
			}
		}
	});
}
//向上翻页
function up() {
	var up=$("#up").attr("value");
	$("#fpage").val(up)
	$("#fsubmit").submit();
	
}
//向下翻页
function down() {
	var down=$("#down").attr("value");
	$("#fpage").val(down);
	$("#fsubmit").submit();
}
//当前页
function now(now) {
	$("#fpage").val(now);
	$("#fsubmit").submit();
}
function zs(memId) {
	document.getElementById("xtDate").innerHTML="";
	aa = new xtDate(document.getElementById("xtDate"));
	$.ajax({
		url:'${pageContext.request.contextPath }/Member/getInsertingEmpC.emp',
		data:{memId:memId},
		dataType:'json',
		success:function(data){
			aa.tabJson = data;
			aa.init();
		}
	});
	setTimeout(function(){
	 var div =	document.getElementsByClassName("date_box_header_center")[0];
	 div.click();
	}, 500);
}
</script>
</head>
<body class="empBody">
	<div class="bgcc">
	<%@include file="headerForEmp.jsp" %>
	<div class="tContent">
		<!-- 菜单区域 -->
		<%@include file="cLeftForEmp.jsp" %>
			<!-- 内容区域 -->
		<div class="tCright">
			<!-- 消息反馈 -->
			<div id="alert" class="tCMsg alert alert-success" role="alert">
				<span id="msg"></span>
			</div>
			<!-- 路径导航 -->
			<ol class="breadcrumb">
			  <li id="uuOne" class="active">会员管理</li>
			  <li id="uuTwo" >会员签到</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
				<form class="form-inline"  id="fsubmit" action="${pageContext.request.contextPath}/Sign/selSignAll.emp" method="post" style="display: none;">
					<input style="height: 35px; width:20px;" hidden="hidden" type="text" placeholder="当前页" name="page" id="fpage" value="${page}"/> 
				</form>
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 1000px;">
			  	<col width="300px"/><col width="300px"/><col width="400px"/>
			    <thead>
					<tr>
						<th>会员编号</th><th>会员名称</th><th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pb.list}" var="s" >
											<tr style="height:30px;"  >
											<td >${s.memId}</td>
											<td>${s.mem_name}</td>
											<td class='action-td' >
												<button onclick="zs(${s.memId})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyModal">
							          				<span class="glyphicon glyphicon-eye-open"></span>查询签到情况
							   					</button>
											<p:power authority="会员：签到-删除">
							   					 <button onclick="sel(${s.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#rmyModal">
												          <span class="glyphicon glyphicon-remove"></span>删除某日签到信息
												    </button>
											</p:power>
											<p:power authority="会员：签到-补签">
												  <button onclick="sel(${s.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#upmyModal" >
							          				<span class="glyphicon glyphicon-plus"></span> 补签
												</button>		
											</p:power>
											</td>
											</tr>
									    </c:forEach>
				</tbody>
			  </table>
			</div>
			<hr>
			<!-- 分页页码 -->
			<div class="text-center">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				   <li  <c:if test="${page==1}">disabled</c:if>><a id="down" onclick="down()" <c:if test="${page!=1}"> href="#" value="${page-1}" </c:if>>&laquo; </a></li>
					<c:if test="${begin!=1 }"><li><a>...</a></li></c:if>
					<c:forEach var="i" begin="${begin}" end="${end}">
					<li <c:if test="${i==page }">class="active"</c:if>><a id="now"  onclick="now(${i})" href="#">${i}</a></li>
					</c:forEach>
					<c:if test="${end!=pages }"><li><a>...</a></li></c:if>
					<li <c:if test="${page==pages}">disabled</c:if>><a id="up" onclick="up()" <c:if test="${page!=pages}"> href="#"  value="${page+1}"</c:if>> &raquo;</a></li>
				  </ul>
				</nav>
			</div>
			<!-- 分页页码 end -->
		</div>	
		<!-- 内容区域 end -->
	</div>
	<%@include file="footerForEmp.jsp" %>
	
		<!-- 补签模态框 -->
		<div class="modal fade" id="upmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/Sign/upSign.emp" accept-charset="utf-8"  method="post" >
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group" style="display: none;">
		                            <label class="form-label" for="nameRoEmail">id</label>
		                            <input class="form-control " type="text"  id="bid" name="id" value="" placeholder="id">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">会员名称</label>
		                            <input class="form-control  " type="text" id="mName" name="mem_name" readonly="readonly" value="" placeholder="会员名称">
		                        </div>
		                    </div>
		                </div>
		                <div class="row" style="display: none;">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">会员编号</label>
		                            <input class="form-control" type="text" id="mid" name="memId" value="" placeholder="会员编号">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">补签日期</label>
		                            <input class="form-control" type="text" id="sign_time" 	 name="signTime" value="" placeholder="点击选取日期" onblur="c()">
		                            <span id="span"></span>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <a data-dismiss="modal" class="btn btn-info " href="#">取消</a>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<!-- 删除 -->
		<div class="modal fade" id="rmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/Sign/scSign.emp" accept-charset="utf-8"  method="post" >
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group" style="display: none;">
		                            <label class="form-label" for="nameRoEmail">id</label>
		                            <input class="form-control " type="text"  id="sid" name="id" value="" placeholder="id">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">会员名称</label>
		                            <input class="form-control  " type="text" id="sName" readonly="readonly" name="mem_name" value="" placeholder="会员名称">
		                        </div>
		                    </div>
		                </div>
		                <div class="row" style="display: none;">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">会员编号</label>
		                            <input class="form-control" type="text" id="smemId" name="memId" value="" placeholder="会员编号">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">删除签到日期</label>
		                            <input class="form-control" type="text" id="signTime" name="signTime" value="" placeholder="点击选取日期" onblur="c()">
		                            <span id="S"></span>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <a data-dismiss="modal" class="btn btn-info " href="#">取消</a>
		                </div>
		            </div>
					
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<!-- 查询全部时间 -->
		<div class="modal fade" id="amyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
					<div class="modal-header">
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div><!-- /.modal-content -->
					<div class="modal-body">
						<div id="xtDate" style="width:500px;margin-left:-60px; height: 500px;"></div>
					</div>
				</div>
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>