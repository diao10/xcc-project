<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="distM.jsp" %>
	<script type="text/javascript">
	//日期选择插件
	 $(function() {
	//日期选择插件
	if('${htmlName}'=="memAddHealth"){
		$("#mh").addClass("active");
		$("#indexs").removeClass("active");
	}
	 var picker = new Pikaday(
			    {
			        field: document.getElementById('diag_Date'),
			        firstDay: 1,
			        minDate: new Date('1950-01-01'),
			        maxDate: new Date('2020-12-31'),
			        yearRange: [1950,2020]
			    });
});
	 function check(){
		 var result;
		 var select = $('#mem_Type').val();
		 var diag_Date = $("#diag_Date").val();
		 var diag_Ill = $("#diag_Ill").val();
		 var diag_Hos = $("#diag_Hos").val();
		 var medication = $("#medication").val();
		 var diag_opinion = $("#diag_opinion").val();
		 var files = $("#files").val();
		 var option = $('#op2').val();
		 if(diag_Date == ""){
			 alert("请选取诊断时间");
			 return false;
		 }
		 if(diag_Ill.trim() == ""){
			 alert("请填写诊断疾病");
			 return false;
		 }
		 if(diag_Hos.trim() == ""){
			 alert("请填写诊断医院");
			 return false;
		 }
		 if(medication.trim() == ""){
			 alert("请填写用药情况");
			 return false;
		 }
		 if(diag_opinion.trim() == ""){
			 alert("请填写诊断意见");
			 return false;
		 }
		 if(files.length == 0){
			 alert("请上传诊断书");
			 return false;
		 }
		 if(select==option){
			 if($('#fam_Id').val()==null){
				alert("暂无家属");
				result=false;
			 }else{
				result=true;
			 }
		 }else{
			 result=true;
		 }
		 return result;
	}
	/* 下拉框循环赋值 */
	function ss() {
		var select = $('#mem_Type').val();
		var option = $('#op2').val();
		if(select==option){
			$('#familyName').attr('style','display:block');
			$('#memName').val("");
			var id = ${memLogin.id };
			 $.ajax({
				    data:{id:id},
	   			 	url:"${pageContext.request.contextPath }/MemFamily/selMemFamilyAll.do", 
	   				success:function(data){
	   				 for (var i = 0; i <data.memFamily.length ; i++) {
	   						$('#fam_Id').append("<option value='"+data.memFamily[i].id+"'>"+data.memFamily[i].famName+"</option>")
	   				 }
	   				}
	   				});
		}else{
			  $('#fam_Id').html(""); 
			 $('#familyName').attr('style','display:none'); 
		}
	} 
	</script>
	<style type="text/css">
	.tyMainBody .boxg1{
			height: 1000px;
		}
		/* 页码标签颜色 */
		#list2 > .active > a
		 {
		  z-index: 2;
		  color: #2a6496;
		  cursor: default;
		  background-color: #eeeeee;
		  border-color: #eeeeee; 
		}
	</style>
</head>
<body>
		<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody">
			<div class="boxg1">
				<div class="left">
					<ul >
						<li id="li1" >
							<a href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do" >个人健康信息</a>
						</li>
						<li id="li2" >
							 <a href="${pageContext.request.contextPath}/MemHealth/selFamHealth.do">家属健康信息</a> 
						</li>
						<li id="li4" >
							 <a href="${pageContext.request.contextPath}/view/memSelFamily.html" >家属基本信息</a> 
						</li>
						<li id="li3" class="active" >
							<a href="#" >添加健康信息</a>
						</li>
						
					</ul>
				</div>
				<div class="right" >
						<div class="body " id="div3">
						<section class="contact-form" id="contacto">
    <div class="container-fluid container--1000" style="margin-left: 50px">
         <form id="ff"  action="${pageContext.request.contextPath}/MemHealth/addMemHealth.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
            <div class="row1" style="margin-top: 10px">
                <div  style="display: none">
                    <div class="form-group">
                         <label class="form-label" for="mem_Name">* 会员名</label> 
                        <input class="form-control input-lg js-required" type="text" autocorrect="off" autocomplete="off" id="memId" name="memId" value="${memLogin.id }"readonly="readonly" >
                        <input class="form-control input-lg js-required" type="text" autocorrect="off" autocomplete="off" id="memName" name="memName" value="${memLogin.memName }"readonly="readonly">
                    </div>
                </div>
                <div >
                    <div class="form-group">
                        <label class="form-label" for="mem_Type">* 会员类型</label>
                            <select class="products-filters__order form-control input-lg js-dropdown-custom" id="mem_Type" name="mem_Type" onchange="ss();" data-placeholder="请选择类型" style="width:300px">
                                                                <option id="op1" value="会员"  selected="selected">会员</option>
                                                                <option id="op2" value="家属"  >会员家属</option>
                            </select>
                    </div>
                </div>
            </div>
            <div class="row1">

                <div id="familyName" style="display: none">
                    <div class="form-group">
                        <label class="form-label" for="fam_Id">* 会员家属姓名</label>
                       <!--  <div class="select2-wrap select2-wrap--fullwidth select2-wrap--lg"> -->
                            <select class="products-filters__order form-control input-lg js-dropdown-custom" id="fam_Id" name="fam_Id"  data-placeholder="请选择" style="width:300px">
                            </select>
                       <!--  </div> -->
                    </div>
                </div>
               </div>
             <div class="row1">
		                    <div >
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group" >
		                            <label class="form-label" for="diag_Date">* 诊断时间</label>
		                            <input class="form-control input-lg" type="text" id="diag_Date" name="diag_Date" placeholder="点击选取时间" style="width:300px">
		                        </div>
		                    </div>
		                </div>
               <div class="row1">
                <div  >
                    <div class="form-group">
                        <label class="form-label" for="diag_Ill">* 诊断疾病</label>
                        <input class="form-control input-lg" type="text" autocorrect="off" autocomplete="off" autocapitalize="off" id="diag_Ill" name="diag_Ill" value="" style="width:300px">
                    </div>
                </div>
               </div>
               <div class="row1">
                 <div >
                    <div class="form-group">
                        <label class="form-label" for="diag_Hos">* 诊断医院</label>
                        <input class="form-control input-lg" type="text" autocorrect="off" autocomplete="off" autocapitalize="off" id="diag_Hos" name="diag_Hos" value="" style="width:300px">
                    </div>
                </div>
               </div>
            <div class="row1">
                <div >
                    <div class="form-group">
                        <label class="form-label" for="medication">* 用药情况</label>
                        <textarea class="form-control input-lg js-required" rows="4" id="medication" name="medication" style="width:300px;height:80px"></textarea>
                    </div>
                </div>
            </div>
            <div class="row1">
                <div >
                    <div class="form-group">
                        <label class="form-label" for="diag_opinion">* 诊断意见</label>
                        <textarea class="form-control input-lg js-required" rows="4" id="diag_opinion" name="diag_opinion" style="width:300px;height:80px"></textarea>
                    </div>
                </div>
            </div>
         <div class="row1"style="margin-top: -5px">
                <div  >
                        <label class="form-label" for="aegrotat_url">* 诊断书</label>
                        <input  type="file" autocorrect="off" autocomplete="off" id="files" name="fileList[]" multiple="true" >
                    </div>
                </div> 
            	<div class="row1"style="width: 400px;float:right;margin-top: 50px;">
                    <div class="col-md-6 form-col form-col--first">
                    	<button id="submit" class="btn btn-info btn-lg" type="submit" >提交</button>
                        <button id="" class="btn btn-info  btn-lg" type="reset">取消</button>
                    </div>
            		</div>
        </form> 
            </div>
            </section>
						</div>
					</div>
			</div>
		</div>
	</div>
		<%@include file="footerForMem.jsp" %>
</body>
</html>