<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>
<title>Insert title here</title>
    <script type="text/javascript">
	$(function() {
		//消息提示信息
		var msgg='${msg}';
		msg(msgg);
		//展开列表
		var html = '${htmlName}';
		currentPage(html);
		//消息提示框
		//日期选择插件
		  var picker = new Pikaday(
		    {
		        field: document.getElementById('memBirth'),
		        firstDay: 1,
		        minDate: new Date('1950-01-01'),
		        maxDate: new Date('2020-12-31'),
		        yearRange: [1950,2020]
		    });
		
	});
	window.onload = function () {
		var aa = new xtDate(document.getElementById("xtDate"));
		
		$.ajax({
			url:'${pageContext.request.contextPath }/Member/getInsertingEmpN.emp',
			data:{referrerId:'${employeeSession.emp_Id}'},
			dataType:'json',
			success:function(data){
				//var cc = {"type":2,"title":["xx1","xx2","xx3"],"times":["2017-2-13","2017-2-4","2017-2-22"]};
				aa.tabJson = data;
				aa.init();
			}
		});
    }
	function getId(id){
	
		$("#id007").val(id);
		$('#myModal1').modal('show');
		var b = $("#mess_theme");
	    var c = $("#theme");
	}
	function f1(){
		var a = $("#id007").val();
	    var b = $("#mess_theme").val();
	    var c = $("#theme").val();
			$.ajax({
			data:{sid:a,mess_theme:b,theme:c},
			 url:"${pageContext.request.contextPath }/message/add1.emp",
			 success:function(){
				 $('#myModal1').modal('hide');
			 }
			 
			})
		
	}
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
				<span id="span1"></span>
			</div>
			<!-- 路径导航 -->
			<ol class="breadcrumb">
			  <li id="uuOne">会员管理</li>
			  <li id="uuTwo" class="active">会员信息</li>
			</ol>
			<!-- aaa -->
			<div id="xtDate" style="width: 500px;margin: 0 auto;"></div>
		</div>	
		<!-- 内容区域 end -->
	</div>
	<%@include file="footerForEmp.jsp" %>
	
		<!-- 模态框 -->
		<div class="modal fade" id="myEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		            <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/Login/memLogin.do" accept-charset="utf-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">添加用户信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">会员编号或邮箱</label>
		                            <input class="form-control " type="text" autocorrect="off" autocomplete="off" id="nameRoEmail" name="nameRoEmail" value="" placeholder="会员编号/邮箱">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	has-error报错样式
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">密码</label>
		                            <input class="form-control  " type="password" autocorrect="off" autocomplete="off" autocapitalize="off" id="memPwd" name="memPwd" value="" placeholder="密码">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	has-error报错样式
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">日期</label>
		                            <input class="form-control" type="text" id="memBirth" name="memBirth" value="" placeholder="日期">
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" type="submit">确定</button>
		                    <button id="" class="btn btn-danger" type="submit">取消</button>
		                </div>
		            </div>
		           </form>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		            <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletter"  accept-charset="utf-8"  method="post" >
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">发送信息</h4>
		            </div>
		            <input id="id007" name ="sid" hidden="hidden">
		            <div class="modal-body vertical-center">
		                <input id="mess_theme" name ="mess_theme" hidden="hidden" value="${employeeSession.emp_Name }祝你生日快乐" >
		             </div>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">信息内容 </label>
		                            <textarea  class="form-control" id="theme" name="theme" value="" placeholder="内容"></textarea>
		                        </div>
		                    </div>
		                </div>
		               </div>
		           </form>
		            <div class="modal-footer vertical-center" >
		            	<div class="row" style="margin-right: 30px;">
		                   	<button id="" class="btn btn-success" onclick="f1()">确定</button>
		                    <button id="" class="btn btn-danger" type="">取消</button>
		                </div>
		            </div>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</div>
</body>
</html>