<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="distM.jsp" %>
<style type="text/css">
		.tyMainBody .boxg1{
			height: 500px;
		}
	
	</style>
	<script type="text/javascript">
	//日期选择插件
	 $(function() {
	//日期选择插件
	 var picker = new Pikaday(
			    {
			        field: document.getElementById('famBirth'),
			        firstDay: 1,
			        minDate: new Date('1920-01-01'),
			        maxDate: new Date('2030-12-31'),
			        yearRange: [1920,2030]
			    });
});
	
	 var e=new Array();
	 for (var i = 0; i <2; i++) {
	 	e[i]=false;
	 }
	 //判断姓名是否为空
	 function name1() {
	 	var nameV=$("#famName").val();
	 	if(nameV==null||nameV==""){
	 		e[0]=false;
	 		if($("#nameE" ).css("display")=="none"){
	             $("#nameE" ).css("display", "block");
	             $("#nameE" ).css("color", "red");
	             }
	 	}else{
	 		e[0]=true;
	 		 $("#nameE" ).css("display", "none");
	 	}
	 }
	 
	 //判断出生日期
	 function birth() {
	 	var birth=$("#famBirth").val();
	 	if(birth==null||birth==""){
	 		e[1]=false;
	 		if($("#birth").css("display")=="none"){
	 			$("#birth").css("display","block");
	 			   $("#birth" ).css("color", "red");
	 		}
	 	}else{
	 		e[1]=true;
	 		 $("#birth").css("display", "none");
	 	}
	 }
	 function ft() {
	 	for (var i = 0; i < e.length; i++) {
	 		if(!e[i]){
	 			return false;
	 		}				
	 	}
	 	return true;
	 }	
	 
	</script>
</head>
<body>
	<%@include file="headerForMem.jsp" %>
	<div class="tyMain">
		<div class="tyMainBody">
			<div class="boxg1">
				<div class="left">
					<ul >
						<li  id="li1" >
							<a href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do" >个人健康信息</a>
						</li>
						<li id="li2" >
							 <a href="${pageContext.request.contextPath}/MemHealth/selFamHealth.do">家属健康信息</a> 
						</li>
						<li id="li4" class="active">
							 <a href="${pageContext.request.contextPath}/view/memSelFamily.html">家属基本信息</a> 
						</li>
						<li id="li3" >
							<a href="${pageContext.request.contextPath}/view/memAddHealth.html" >添加健康信息</a>
						</li>
					</ul>
				</div>
				<div class="right" >
						<div class="body " id="div5" >
						<section class="contact-form" id="contacto">

    <div class="container-fluid container--1000" style="margin-left: 50px">
         <form id="fff"  action="${pageContext.request.contextPath}/MemFamily/addMemFamily.do" method="post" onsubmit="return ft()">
            <div class="row1" style="margin-top: 10px">
                <div  >
                    <div class="form-group">
                         <label class="form-label" for="famName">* 家属姓名</label> 
                        <input class="form-control input-lg js-required" type="text" autocorrect="off" autocomplete="off" id="memId" name="memId" value="${memLogin.id }" style="width:300px;display: none" >
                        <input class="form-control input-lg js-required" type="text" autocorrect="off" autocomplete="off" id="famName" name="famName" value="" style="width:300px;" onblur="name1()">
                    </div>
                    <p id="nameE" style="display:none;" >姓名不能为空！</p>
                </div>
            </div>
            <div class="row1">
                <div id="familyName"  >
                    <div class="form-group">
                    <label class="form-label" for="famGender">* 家属性别</label>
                        <select class="products-filters__order form-control input-lg js-dropdown-custom" id="famGender" name="famGender"  data-placeholder="请选择" style="width:300px;">
                                                                <option id="op1" value="男"  selected="selected">男</option>
                                                                <option id="op2" value="女"  >女</option>
                            </select>
                    </div>
                </div>
               </div>
			 <div class="row1">
		                    <div >
		                    	<!-- has-error报错样式 -->
		                        <div class="form-group" >
		                            <label class="form-label" for="famBirth">* 出生日期</label>
		                            <input class="form-control input-lg" type="text" id="famBirth" name="famBirth" placeholder="点击选取时间" style="width:300px" onblur="birth()">
		                        </div>
		                        <p id="birth" style="display:none;" >出生日期不能为空！</p>
		                    </div>
		                </div>
	   <div  style="width: 400px;float: right" >
            	<div class="row1" style="margin-top: 50px">
                    <div class="col-md-6 form-col form-col--first">
                    	<button id="submit" class="btn btn-info btn-marron btn-lg " type="submit" >提交</button>
                        <button id="" class="btn btn-info btn-marron btn-lg" type="reset" >取消</button>
                    </div>
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