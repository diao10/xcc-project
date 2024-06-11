<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="p" uri="/tyyyTag/powerTag" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
 <script src="${pageContext.request.contextPath }/dist/js/doctor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="dist.jsp" %>
<title>Insert title here</title>

<script type="text/javascript">
$(function() {
	//消息提示信息
	var msgg='${msg}';
	msg(msgg);
	//展开列表
	currentPage("eMH");
	//消息提示框
	//日期选择插件
	 var picker1 = new Pikaday(
			    {
			        field: document.getElementById('diag_D'),
			        firstDay: 1,
			        minDate: new Date('1950-01-01'),
			        maxDate: new Date('2020-12-31'),
			        yearRange: [1950,2020]
			    });
	 var picker2 = new Pikaday(
			    {
			        field: document.getElementById('diagDate'),
			        firstDay: 1,
			        minDate: new Date('1950-01-01'),
			        maxDate: new Date('2020-12-31'),
			        yearRange: [1950,2020]
			    });
	 
});
//删除方法
function del(id) {

	var x;
	var r=confirm("是否确认删除!");
	if (r==true){
					 location.href = "${pageContext.request.contextPath}/MemHealth/delMemHealth.emp?id="+id;
	}
	else{
		return;
			}
	
	
}
//修改方法
function edit(id) {
		 $.ajax({
				 data:{id:id},
				 url:"${pageContext.request.contextPath}/MemHealth/selMemHealthById.emp",
				 success:function(data){
				 if(data.hea.aegrotat_url==null||data.hea.aegrotat_url==""){
					 alert("无诊断书");
					 window.location.reload();
				 }else{
					 $('#div11').css("display","block");
					 var imgUrl = data.hea.aegrotat_url.split(";"); 
					 $p = $('#p1').empty();
					 for(var i = 0; i < imgUrl.length; i++){
						 if(imgUrl[i].length > 0){
							 var $img = $("<img style='width: 350px;margin-top:10px;'>")
							 $img.attr("src","${pageContext.request.contextPath}"+imgUrl[i]);
							 $p.append($img);
						 }
					 }
				 }  
				 }
			 })
} 
//详情
function ed(id) {
	$.ajax({
		data:{id:id},
		url:"${pageContext.request.contextPath}/MemHealth/selMemHealthById.emp",
		 success:function(data){
			 var d = new Date(data.hea.diag_Date);
			 var da = d.getFullYear()+"-"+("0"+(d.getMonth()+1)).slice(-2)+"-"+("0"+d.getDate()).slice(-2);
			 var t = new Date(data.hea.upload_Date);
			 var ta =  t.getFullYear()+"-"+("0"+(t.getMonth()+1)).slice(-2)+"-"+("0"+t.getDate()).slice(-2);
			 $("#m_n").val(data.hea.memName);
			 $("#m_t").val(data.hea.mem_Type);
			 $("#diag_D").val(da);
			 $("#diag_I").val(data.hea.diag_Ill);
			 $("#diag_H").val(data.hea.diag_Hos);
			 $("#M").val(data.hea.medication);
			 $("#diag_O").val(data.hea.diag_opinion);
			 $("#upload_D").val(ta);
		 }
	});
}
//修改
function edi(id) {
	$.ajax({
		 data:{id:id},
		 url:"${pageContext.request.contextPath}/MemHealth/selMemHealthById.emp",
		 success:function(data){
			 var d = new Date(data.hea.diag_Date);
			 var da = d.getFullYear()+"-"+("0"+(d.getMonth()+1)).slice(-2)+"-"+("0"+d.getDate()).slice(-2);
			 var t = new Date(data.hea.upload_Date);
			 var ta =  t.getFullYear()+"-"+("0"+(t.getMonth()+1)).slice(-2)+"-"+("0"+t.getDate()).slice(-2);
			 $("#aid").val(data.hea.id), 
			 $("#memId").val(data.hea.memId),
			 $("#memName").val(data.hea.memName),
			 $("#memType").val(data.hea.mem_Type),
			 $("#diagDate").val(da),
			 $("#diagIll").val(data.hea.diag_Ill),
			 $("#diagHos").val(data.hea.diag_Hos),
			 $("#med").val(data.hea.medication),
			 $("#diagOpinion").val(data.hea.diag_opinion);
		 }
	});
}
var e= false;
function name1() {
	var nameV=$("#m_name").val();
	if(nameV==null||nameV==""){
		e=false;
		if($("#nameE" ).css("display")=="none"){
            $("#nameE" ).css("display", "block");
            $("#nameE" ).css("color", "red");
            }
	}else{
		e=true;
		 $("#nameE" ).css("display", "none");
	}
}
function name2() {
	var type=$("#m_type").val();
	if(type==null||type==""){
		e=false;
		if($("#type" ).css("display")=="none"){
            $("#type" ).css("display", "block");
            $("#type" ).css("color", "red");
            }
	}else{
		e=true;
		 $("#type" ).css("display", "none");
	}
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
function f() {
		$("#fpage").val(1);
}
function save(id) {
	$("#id008").val(id);
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
			  <li id="uuTwo" >健康信息</li>
			</ol>
			<!-- 查询条 -->
			<div style="margin-left: 30px;">
				<form id="fsubmit" class="form-inline" action="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.emp" method="post" >
				  	<input style="height:35px;" type="text" placeholder="会员姓名" name="memName" onfocus="f()" value="${memName}"/>
				  	<input style="height: 35px;" type="text" placeholder="家属姓名" name="fam_Name" onfocus="f()" value="${fam_name }">
					<input style="height:35px;" type="text" placeholder="诊断医院" name="diag_Hos" onfocus="f()" value="${diag_hos}"/>
					<input style="height:35px;" type="text" placeholder="诊断疾病" name="diag_Ill" onfocus="f()" value="${diag_ill}"/>
					<input style="height: 35px; width:20px;" hidden="hidden" type="text" placeholder="当前页" name="page" id="fpage" value="${page}"/> 
				  <button type="submit" class="btn btn-default btn-xs">
				  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找
				  </button>
				</form>
				  
			</div>
			<hr>
			<div class="tCtableDiv clear">
			  <table class="table-bordered table-hover tCtable" style="width: 2035px;table-layout:fixed">
			  	<col width="165px"/><col width="165px"/><col width="165px"/><col width="165px"/>
			  	<col width="165px"/><col width="165px"/><col width="165px"/><col width="165px"/>
			  	<col width="165px"/><col width="380px"/>
			    <thead>
					<tr>
						<th>编号</th><th>姓名</th><th>类型</th><th>诊断时间</th>
						<th>诊断疾病</th><th>诊断医院</th><th>用药情况</th><th>诊断意见</th>
						<th>上传时间</th><th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pb.list}" var="hea" >
						<tr style="height:30px;"  >
						<td >${hea.memId}</td>
						<td>${hea.memName}</td>
						<td>${hea.mem_Type}</td>
						<td><fmt:formatDate value="${hea.diag_Date}" pattern="yyyy-MM-dd"/></td>
						<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${hea.diag_Ill}</td>
						<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${hea.diag_Hos}</td>
						<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${hea.medication}</td>
						<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${hea.diag_opinion}</td>
						<td ><fmt:formatDate value="${hea.upload_Date}" pattern="yyyy-MM-dd"/></td>
						<td class='action-td' >
						<p:power authority="健康：健康信息-查看">
						<button onclick="ed(${hea.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#bmyModal">
		          				<span class="glyphicon glyphicon-eye-open"></span>详情
		   				</button>
						</p:power>
						<p:power authority="健康：健康信息-修改">
						<button onclick="edi(${hea.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#amyModal">
		          				<span class="glyphicon glyphicon-edit"></span>修改
		   				</button>
						</p:power>
						<p:power authority="健康：健康信息-删除">
							<a onclick="del(${hea.id})" href="javascript:void(0)" class="btn btn-info btn-sm" ><span class="glyphicon glyphicon-remove"></span>删除</a>
						</p:power>
						<!-- 
						<p:power authority="健康：健康信息-修改诊断书">
						<button onclick="save(${hea.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#cmyModal">
	          				<span class="glyphicon glyphicon-edit"></span>修改诊断书
		   				</button>
		   				 -->
						</p:power>
						<p:power authority="健康：健康信息-查看诊断书">
						<button onclick="edit(${hea.id})" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#dmyModal">
		          				<span class="glyphicon glyphicon-eye-open"></span>查看诊断书
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
	
		<!-- 修改模态框 -->
		<div class="modal fade" id="amyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					
		          	<form id="formNewsletters" action="${pageContext.request.contextPath }/MemHealth/updateMemHealth.emp" accept-charset="utf-8"  method="post" enctype="multipart/form-data">
					<div class="modal-header vertical-center">
		                <h4 class="modal-title text-center" id="myModalLabel">修改会员信息</h4>
		            </div>
		            <div class="modal-body vertical-center">
		             <div class="row" style="display: none;">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="id">id</label>
		                            <input class="form-control " type="text"  id="aid" name="id" placeholder="id">
		                        </div>
		                    </div>
		                </div>
		                 <div class="row" style="display: none;">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="mem_Id">会员编号</label>
		                            <input class="form-control " type="text"  id="memId" name="memId" placeholder="会员编号">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="mem_Name">会员姓名</label>
		                            <input class="form-control " type="text"  id="memName" name="memName" placeholder="会员姓名">
		                        </div>
		                    </div>
		                </div>
		                <div class="row" style="display: none;">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="mem_Type">会员类型</label>
		                            <input class="form-control  " type="text" id="memType" name="mem_Type" placeholder="会员类型">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group">
		                            <label class="form-label" for="diag_Date">诊断时间</label>
		                            <input class="form-control" type="text" id="diagDate" name="diag_Date" placeholder="点击选取时间">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_Ill">诊断疾病</label>
		                            <textarea class="form-control "  id="diagIll" name="diag_Ill" style="resize: none;width: 370px;height: 100px;"></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_Hos">诊断医院</label>
		                            <textarea class="form-control " id="diagHos" name="diag_Hos" style="resize: none;width: 370px;height: 100px;"></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="medication">用药情况</label>
		                            <textarea class="form-control " id="med" name="medication" style="resize: none;width: 370px;height: 100px;"></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_opinion">诊断意见</label>
		                            <textarea class="form-control " id="diagOpinion" name="diag_opinion" style="resize: none;width: 370px;height: 100px;"></textarea>
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
		<!-- 详情 -->
		<div class="modal fade" id="bmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content" >
		                <button type="button" style="margin-top: 10px;margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		            <div class="modal-body vertical-center">
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="nameRoEmail">会员姓名</label>
		                            <input class="form-control " type="text"  id="m_n" name="mem_Name" readonly="readonly">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="memPwd">会员类型</label>
		                            <input class="form-control " type="text"  id="m_t" name="mem_Type" readonly="readonly">
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-xs-12 form-col form-col--first form-col--last">
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group">
		                            <label class="form-label" for="diag_Date">诊断时间</label>
		                            <input class="form-control" type="text" id="diag_D" name="diag_Date" readonly="readonly">
		                        </div>
		                    </div>
		                </div>
		               <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_Ill">诊断疾病</label>
		                            <textarea class="form-control "  style="overflow-x:hidden;resize:none;width:370px;height:100px;" name="diag_Ill" id="diag_I" readonly="readonly" ></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_Hos">诊断医院</label>
		                            <textarea class="form-control " name="diag_Hos" id="diag_H" readonly="readonly" style="resize: none;width: 370px;height: 100px;"></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="medication">用药情况</label>
		                            <textarea class="form-control "  style="overflow-x:hidden;resize:none;width:370px;height:100px;" name="medication" id="M" readonly="readonly" ></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="diag_opinion">诊断意见</label>
		                            <textarea class="form-control " readonly="readonly" id="diag_O" name="diag_opinion" style="resize: none;width: 370px;height: 100px;"></textarea>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="upload_Date">上传时间</label>
		                            <input class="form-control " readonly="readonly" type="text"  id="upload_D" name="upload_Date" >
		                        </div>
		                    </div>
		                </div>
		            </div>
		    
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<div class="modal fade" id="cmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" >
		<div class="modal-content" >
			<button type="button" style="margin-top: 10px; margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			
          	<form id="fd" enctype="multipart/form-data" action="${pageContext.request.contextPath}/MemHealth/save.emp" accept-charset="utf-8"  method="post" enctype="multipart/form-data">
				<div class="modal-header vertical-center">
	                <h1 class="modal-title text-center" id="myModalLabel">修改诊断书</h1>
	            </div>
          	<input hidden="hidden" id = "id008" name ="id">
		                <div class="modal-body vertical-center">
		               <div class="row" style="margin-top: 30px">
		                    <div class="col-sm-12 form-col form-col--first form-col--last">
		                        <div class="form-group">
		                            <label class="form-label" for="aegrotat_url">诊断书</label>
		                            <div style="margin-left:100px;margin-top:-41px;">
	                        		  <input type="file" name ="file"  onchange="previewImage1(this,'preview1','imghead1')">
	                        			<div id="preview1" >
	                    				<img id="imghead1" style="width: 200px;height:200px;" src="${pageContext.request.contextPath }/dist/img/messImg.jpg">
                        			</div>
		                        </div>
		                    </div>
		                </div>
		             </div>
		             </div>
		             
            
           						 <div class="modal-footer vertical-center" style="width: 500px;margin-left:45px;">
            	
                    				<div >
                    				<button  id="" class="btn btn-primary" type="submit" >确认</button>
											<a data-dismiss="modal" class="btn btn-info " href="#">Cancel</a>
                    				</div>
                    				</div>
           
           </form>
            				</div>
    </div>
			
    </div>
    <div class="modal fade" id="dmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" >
		<div class="modal-content" >
			<button type="button" style="margin-top: 10px; margin-right: 10px" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<div id="div11" style="display: none"><p style="margin-left: 180px;" id="p1"><img style="width: 350px;height: 400px;" id="img"></p>
        </div>
    </div>
    </div>
		</div>
		</div>
</body>
</html>