<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>
<title>天蕴药业</title>

<script type="text/javascript">
$(function() {
	//消息提示框
	miss();
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
			<div class="tCMsg alert alert-success" role="alert">
				<span>后台消息反馈</span>
			</div>
			<!-- 路径导航 -->
			<ol class="breadcrumb">
			  <li id="uuOne">会员管理</li>
			  <li id="uuTwo" class="active">会员信息</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
				<form class="form-inline">
				  会员姓名：<input> 
				  会员等级：<input>
				  <button type="submit" class="btn btn-default btn-xs">
				  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找
				  </button>
				</form>
				  <button style="float: right;margin-right: 30px" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myEmpModel">
				  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加
				  </button>
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 2000px;">
			  	<col width="250px"/><col width="150px"/><col width="150px"/><col width="150px"/><col width="150px"/>
			    <thead>
					<tr>
						<th>你妹你妹你妹</th><th>你妹你妹你妹</th><th>你妹你妹你妹</th><th>你妹你妹你妹</th><th>你妹你妹你妹</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
					<tr>
						<td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td><td>aaa</td>
					</tr>
				</tbody>
			  </table>
			</div>
			<hr>
			<!-- 分页页码 -->
			<div class="text-center">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="active"><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#">6</a></li>
				    <li><a href="#">7</a></li>
				    <li><a href="#">8</a></li>
				    <li><a href="#">9</a></li>
				    <li><a href="#">10</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
			<!-- 分页页码 end -->
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
		                            <input class="form-control " type="text"  id="nameRoEmail" name="nameRoEmail" value="" placeholder="会员编号/邮箱">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">密码</label>
		                            <input class="form-control  " type="password" id="memPwd" name="memPwd" value="" placeholder="密码">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
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
	</div>
</body>
</html>