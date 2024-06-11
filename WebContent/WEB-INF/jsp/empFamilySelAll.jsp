 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
 <%@ taglib prefix="p" uri="/tyyyTag/powerTag" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>
<title>天蕴药业</title>
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
$(function() {
	//消息提示信息
	var msgg='${msg}';
	msg(msgg);
	//展开列表
	currentPage("eMH");

	//日期选择插件
	 var picker = new Pikaday(
			    {
			        field: document.getElementById('diag_Date'),
			        firstDay: 1,
			        minDate: new Date('1950-01-01'),
			        maxDate: new Date('2020-12-31'),
			        yearRange: [1950,2020]
			    });
});
function edit(id) {
	 $.ajax({
			 data:{id:id},
			 url:"${pageContext.request.contextPath}/MemFamily/selById.emp",
			 success:function(data){
			 $("#mem_Name").val(data.mem.memName);
			 $("#m_id").val(data.mem.memId);
			 $("#m_name").val(data.mem.famName);
			 $("#f_id").val(data.mem.id);
			 }
		 })
} 
	//向下翻页
	function up() {
		var up=$("#up").attr("value");
		$("#fpage").val(up)
		$("#fsubmit").submit();
	}
	//向上翻页
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
	function f() {
		$("#fpage").val(1);
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
			  <li id="uuOne" class="active">健康管理</li>
			  <li id="uuTwo" >家属信息</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
				 <form id="fsubmit" class="form-inline" action="${pageContext.request.contextPath}/MemFamily/selMemFamilyAll.emp" method="post">&nbsp;&nbsp;&nbsp;条件查询:&nbsp;
									<input style="height:35px;" type="text"  onfocus="f()" placeholder="家属姓名" name="famName" value="${famName}"/>
									<input style="height:35px;" type="text"  onfocus="f()" placeholder="会员姓名" name="memName" value="${memName}"/>
									<input style="height: 35px; width:20px;" hidden="hidden" type="text" placeholder="当前页" name="page" id="fpage" value="${page}"/>
				  <button type="submit" class="btn btn-default btn-xs">
				  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找
				  </button>
				</form>
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 1000px;">
			  	<col width="250px"/><col width="250px"/><col width="250px"/><col width="250px"/><col width="250px"/>
			    <thead>
					<tr>
						<th>会员姓名</th><th>家属姓名</th><th>成员性别 </th>
						<th>家属生日</th><th>操作</th>
					</tr>
				</thead>
				<tbody id="tm">
				<c:forEach items="${pb.list}" var="fam" >
					<tr style="height:30px;"  >
					<td>${fam.memName }</td>
					<td>${fam.famName}</td>
					<td>${fam.famGender}</td>
					<td><fmt:formatDate value="${fam.famBirth}" pattern="yyyy-MM-dd"/></td>
					<td class='action-td'>
					<p:power authority="健康：家属信息-添加健康信息">
					 <button onclick="edit(${fam.id})"  class="btn btn-default btn-sm" data-toggle="modal" data-target="#myEmpModel">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 添加健康信息
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
	
		<!-- 模态框 -->
		<div class="modal fade" id="myEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">添加健康信息</h4>
		            </div>
		          	<form id="formNewsletter" action="${pageContext.request.contextPath }/MemHealth/addMemHealth.emp" accept-charset="utf-8"  method="post" enctype="multipart/form-data" >
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group" >
		                            <label class="form-label" for="memPwd">会员姓名</label>
		                             <input class="form-control " type="text"  id="mem_Name" readonly="readonly" placeholder="会员姓名" >
		                        </div>
		                    </div>
		                </div>
		                <div class="row" style="display: none;">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">会员编号</label>
		                            <input class="form-control " type="text"  id="m_id" name="memId" readonly="readonly" placeholder="会员编号">
		                        </div>
		                    </div>
		                </div>
		                 <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">家属姓名</label>
		                            <input class="form-control " type="text"  id="m_name" name="memName" readonly="readonly" placeholder="家属姓名">
		                        </div>
		                    </div>
		                </div>
		                <div class="row" style="display: none;">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">家属id</label>
		                            <input class="form-control " type="text"  id="f_id" name="fam_Id" readonly="readonly" placeholder="家属id">
		                        </div>
		                    </div>
		                </div>
		                <div class="row" style="display: none;">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group" >
		                            <label class="form-label" for="memPwd">会员类型</label>
		                             <input class="form-control " type="text"  id="mem_Type" name="mem_Type" value="家属">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_Date">诊断时间</label>
		                            <input class="form-control" type="text" id="diag_Date" name="diag_Date" placeholder="点击选取时间">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_Ill">诊断疾病</label>
		                            <textarea class="form-control " style="resize: none;width: 370px;height: 100px;"name="diag_Ill"></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_Hos">诊断医院</label>
		                            <textarea class="form-control " name="diag_Hos" style="resize: none;width: 370px;height: 100px;"></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="medication">用药情况</label>
		                            <textarea style="resize: none;width: 370px;height: 100px;" class="form-control " name="medication" ></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_opinion">诊断意见</label>
		                            <textarea class="form-control " name="diag_opinion" style="resize: none;width: 370px;height: 100px;"></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="aegrotat_url">诊断书</label>
		                            <input style="height: 30px;" type="file" autocomplete="off" name="fileList[]" id="file" multiple="true" >
		                        </div>
		                    </div>
		                </div>
		                <div class="row" style="display: none;">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="upload_Date">上传时间</label>
		                            <input class="form-control " type="text"  id="upload_Date" name="upload_Date" placeholder="点击选取时间">
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
		
	</div>
</body>
</html>