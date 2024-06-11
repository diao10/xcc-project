//生成一个随机数组
//var arr_analysis=new Array();
var question =new Array();
var questionUnsort =new Array();
var page=0;
var answer=new Array();
var sc;
var  bodyA="兼夹";
var  bodyA2="倾向";
var  bodyA3="兼有";

//(function sort(){
//	var arr=new Array();
//	for(var i=0;i<60;i++){
//		arr.push((i+1));
//	}
//	arr_analysis=arr.sort(function(){return Math.random()>0.5?-1:1;}); 
//	
//})();


//问题数组 id name  content  score(5个分值)
(function content(){
	var arr1={tagID:"analysis11",tag:" 您精力充沛吗?",score:[1,2,3,4,5]};
	var arr2={tagID:"analysis12",tag:" 您容易疲乏吗?",score:[5,4,3,2,1]};
	var arr3={tagID:"analysis13",tag:" 您说话声音低弱无力吗?",score:[5,4,3,2,1]};
	var arr4={tagID:"analysis14",tag:" 您感到闷闷不乐、情绪低沉吗？",score:[5,4,3,2,1]};
	var arr5={tagID:"analysis15",tag:" 您比一般人耐受不了寒冷吗？",score:[5,4,3,2,1]};
	var arr6={tagID:"analysis16",tag:" 您能适应外界自然和社会环境的变化吗?",score:[1,2,3,4,5]};
	var arr7={tagID:"analysis17",tag:" 您容易失眠吗？",score:[5,4,3,2,1]};
	var arr8={tagID:"analysis18",tag:" 您容易忘事(健忘)吗？",score:[5,4,3,2,1]};
	var arr9={tagID:"analysis21",tag:" 您容易气短（呼吸短促，接不上气）吗?",score:[1,2,3,4,5]};
	var arr10={tagID:"analysis22",tag:" 您容易心慌吗?",score:[1,2,3,4,5]};

	var arr11={tagID:"analysis23",tag:"您容易头晕或站起时晕眩吗?",score:[1,2,3,4,5]};
	var arr12={tagID:"analysis24",tag:"您比别人容易患感冒吗?",score:[1,2,3,4,5]};
	var arr13={tagID:"analysis25",tag:"您喜欢安静、懒得说话吗?",score:[1,2,3,4,5]};
	var arr14={tagID:"analysis26",tag:"您活动量稍大就容易出虚汗吗？",score:[1,2,3,4,5]};
	var arr15={tagID:"analysis31",tag:"您手脚发凉吗?",score:[1,2,3,4,5]};
	var arr16={tagID:"analysis32",tag:"您胃脘部、背部或腰膝部怕冷吗?",score:[1,2,3,4,5]};
	var arr17={tagID:"analysis33",tag:"您感到怕冷、衣服比别人穿得多吗?",score:[1,2,3,4,5]};
	var arr18={tagID:"analysis34",tag:"您吃(喝)凉的东西会感到不舒服或者怕吃(喝)凉东西吗?",score:[1,2,3,4,5]};
	var arr19={tagID:"analysis35",tag:"您受凉或吃(喝)凉的东西后，容易腹泻(拉肚子)吗?",score:[1,2,3,4,5]};
	var arr20={tagID:"analysis41",tag:"您感到手脚心发热吗?",score:[1,2,3,4,5]};

	var arr21={ tagID:"analysis42",tag:"您感觉身体、脸上发热吗?",score:[1,2,3,4,5]};
	var arr22={ tagID:"analysis43",tag:"您皮肤或口唇干吗?",score:[1,2,3,4,5]};
	var arr23={ tagID:"analysis44",tag:"您口唇的颜色比一般人红吗?",score:[1,2,3,4,5]};
	var arr24={ tagID:"analysis45",tag:"您容易便秘或大便干燥吗？",score:[1,2,3,4,5]};
	var arr25={ tagID:"analysis46",tag:"您面部两颧潮红或偏红吗?",score:[1,2,3,4,5]};
	var arr26={ tagID:"analysis47",tag:"您感到眼睛干涩吗?",score:[1,2,3,4,5]};
	var arr27={ tagID:"analysis48",tag:"您感到口干咽燥、总想喝水吗?",score:[1,2,3,4,5]};
	var arr28={ tagID:"analysis51",tag:"您感到胸闷或腹部胀满吗?",score:[1,2,3,4,5]};
	var arr29={ tagID:"analysis52",tag:"您感到身体沉重不轻松或不爽快吗?",score:[1,2,3,4,5]};
	var arr30={ tagID:"analysis53",tag:"您腹部肥满松软吗?",score:[1,2,3,4,5]};

	var arr31={ tagID:"analysis54",tag:"您有额部油脂分泌多的现象吗?",score:[1,2,3,4,5]};
	var arr32={ tagID:"analysis55",tag:"您上眼睑比别人肿(上眼睑有轻微隆起现象)吗?",score:[1,2,3,4,5]};
	var arr33={ tagID:"analysis56",tag:"您嘴里有黏黏的感觉吗?",score:[1,2,3,4,5]};
	var arr34={ tagID:"analysis57",tag:"您平时痰多，特别咽喉部总感到有痰堵着吗？",score:[1,2,3,4,5]};
	var arr35={ tagID:"analysis58",tag:"您舌苔厚腻或有舌苔厚厚的感觉吗?",score:[1,2,3,4,5]};
	var arr36={ tagID:"analysis61",tag:"您面部或鼻部有油腻感或者油亮发光吗?",score:[1,2,3,4,5]};
	var arr37={ tagID:"analysis62",tag:"您容易生痤疮或疮疖吗?",score:[1,2,3,4,5]};
	var arr38={ tagID:"analysis63",tag:"您感到口苦或嘴里有异味吗?",score:[1,2,3,4,5]};
	var arr39={ tagID:"analysis64",tag:"您大便黏滞不爽、有解不尽的感觉吗?",score:[1,2,3,4,5]};
	var arr40={ tagID:"analysis65",tag:"您小便明尿道有发热感、尿色浓(深)吗?",score:[1,2,3,4,5]};

	var arr41={ tagID:"analysis66",tag:"",score:[1,2,3,4,5]};
	var arr43={ tagID:"analysis71",tag:"您的皮肤在不知不觉中会出现青紫瘀斑(皮下出血)吗?",score:[1,2,3,4,5]};
	var arr44={ tagID:"analysis72",tag:"您两颧部有细微红丝吗？",score:[1,2,3,4,5]};
	var arr45={ tagID:"analysis73",tag:"您身体上哪里疼痛吗?",score:[1,2,3,4,5]};
	var arr46={ tagID:"analysis74",tag:"您面色晦黯或容易出现褐斑吗?",score:[1,2,3,4,5]};
	var arr47={ tagID:"analysis75",tag:"您容易有黑眼圈吗?",score:[1,2,3,4,5]};
	var arr48={ tagID:"analysis76",tag:"您口唇颜色偏黯吗?",score:[1,2,3,4,5]};
	var arr49={ tagID:"analysis81",tag:"您容易精神紧张、焦虑不安吗?",score:[1,2,3,4,5]};
	var arr50={ tagID:"analysis82",tag:"您多愁善感、感情脆弱吗?",score:[1,2,3,4,5]};

	var arr51={ tagID:"analysis83",tag:"您容易感到害怕或受到惊吓吗?",score:[1,2,3,4,5]};
	var arr52={ tagID:"analysis84",tag:"您胁肋部或胸部(乳房)胀痛吗?",score:[1,2,3,4,5]};
	var arr53={ tagID:"analysis85",tag:"您无缘无故叹气吗?",score:[1,2,3,4,5]};
	var arr54={ tagID:"analysis86",tag:"您咽喉部有异物感，且吐之不出、咽之不下吗？",score:[1,2,3,4,5]};
	var arr55={ tagID:"analysis91",tag:"您没有感冒时也会打喷嚏吗?",score:[1,2,3,4,5]};
	var arr56={ tagID:"analysis92",tag:"您没有感冒时也会鼻塞、流鼻涕吗?",score:[1,2,3,4,5]};
	var arr57={ tagID:"analysis93",tag:"您有因季节变化、温度变化或异味等原因而咳喘的现象吗?",score:[1,2,3,4,5]};
	var arr58={ tagID:"analysis94",tag:"您容易过敏吗?",score:[1,2,3,4,5]};
	var arr59={ tagID:"analysis95",tag:"您的皮肤容易起荨麻疹吗?",score:[1,2,3,4,5]};
	var arr60={ tagID:"analysis96",tag:"您的皮肤因过敏出现过紫癜吗?",score:[1,2,3,4,5]};
	var arr61={ tagID:"analysis97",tag:"您的皮肤一抓就红，并出现抓痕吗?",score:[1,2,3,4,5]};
    //添加到答题数组
	question.push(arr1);
	question.push(arr2);
	question.push(arr3);
	question.push(arr4);
	question.push(arr5);
	question.push(arr6);
	question.push(arr7);
	question.push(arr8);
	question.push(arr9);
	question.push(arr10);
	question.push(arr11);
	question.push(arr12);
	question.push(arr13);
	question.push(arr14);
	question.push(arr15);
	question.push(arr16);
	question.push(arr17);
	question.push(arr18);
	question.push(arr19);
	question.push(arr20);
	question.push(arr21);
	question.push(arr22);
	question.push(arr23);
	question.push(arr24);
	question.push(arr25);
	question.push(arr26);
	question.push(arr27);
	question.push(arr28);
	question.push(arr29);
	question.push(arr30);
	question.push(arr31);
	question.push(arr32);
	question.push(arr33);
	question.push(arr34);
	question.push(arr35);
	question.push(arr36);
	question.push(arr37);
	question.push(arr38);
	question.push(arr39);
	question.push(arr40);
	question.push(arr41);

	question.push(arr43);
	question.push(arr44);
	question.push(arr45);
	question.push(arr46);
	question.push(arr47);
	question.push(arr48);
	question.push(arr49);
	question.push(arr50);
	question.push(arr51);
	question.push(arr52);
	question.push(arr53);
	question.push(arr54);
	question.push(arr55);
	question.push(arr56);
	question.push(arr57);
	question.push(arr58);
	question.push(arr59);
	question.push(arr60);
	question.push(arr61);	
	var questionNew=question.sort(function(){return Math.random()>0.5?-1:1;}); 
	var arr62={ tagID:"analysis100",tag:"请选择您的性别?",score:[1,2,3,4,5]};
	questionUnsort.push(arr62);
	for(var i=0;i<questionNew.length;i++){
		questionUnsort.push(questionNew[i]);
	}

	
	
	
})();
//显示区分男女后的页面内容;后续改进
//function cont(){	    	 
//	 for(var i=0;i<10;i++){
//		    document.getElementById((i+1)+"").innerHTML=question[arr_analysis[i]-1].tag;
//			for(var j=1;j<=5;j++){
//				document.getElementById((i+1)+""+j).name=question[arr_analysis[i]-1].tagID;
//				document.getElementById((i+1)+""+j).value=question[arr_analysis[i]-1].score[j-1];
//			}
//	  }
// }
// //不能为空
// function reset(){
//	  var sex=document.getElementsByName("sex");			  
//	   if(sex[0].checked){	
//		   
//		   if(question.length==61){
//			   question.splice(40,1);
//			  
//			   cont();
//			   document.getElementById("s").style.display="none";
//		   }
//		   
//	   }
//	   if(sex[1].checked){
//		   if(question.length==61){
//			   question.splice(41,1);
//			   cont();
//			   document.getElementById("s").style.display="none";
//		   }
//	   }
// }
// function check(){
//	 if(page<=5){
//	   var sex=document.getElementsByName("sex");
//	   if(!(sex[0].checked||sex[1].checked)){
//		   document.getElementById("up").style.display="inline";
//		   return;
//	   }
//	   if(sex[0].checked){	
//		   
//		   if(question.length==61){
//			   question.splice(40,1);
//			  
//			   cont();
//			   document.getElementById("s").style.display="none";
//		   }
//		   
//	   }
//	   if(sex[1].checked){
//		   if(question.length==61){
//			   question.splice(41,1);
//			   cont();
//			   document.getElementById("s").style.display="none";
//		   }
//	   }
//	   
//	   
//	   var check=0;			  
//	   for(var i=0;i<10;i++){	
//		 for(var k=0;k<5;k++){
//			var j= document.getElementById((i+1)+""+(k+1));	
//			if(j.checked){
//				check++;	
//			}
//		 }
//	   }
//	 
//		 if(check<10){
//			 document.getElementById("up").style.display="inline"; 
//		 }
//		 else{
//			 var nameT;
//			 var va;
//			 
//			 for(var i=0;i<10;i++){
//				 for(var k=0;k<5;k++){
//					 var j= document.getElementById((i+1)+""+(k+1));
//					 nameT=document.getElementById((i+1)+""+(k+1)).name;
//					 
//					 if(j.checked){
//                       va =parseInt(j.value,10);		                        
//                    }
//				 }
//				 
//			     var setV={"name":nameT,"val":va} ;
//			     answer.push(setV);	
//			     
//			 }			 
//			 page++;
//			 if(page<=5){
//				 for(var i=0;i<10;i++){
//					    document.getElementById((i+1)+"").innerHTML=question[arr_analysis[i+page*10]-1].tag;
//						for(var j=1;j<=5;j++){
//							document.getElementById((i+1)+""+j).name=question[arr_analysis[i+page*10]-1].tagID;
//							document.getElementById((i+1)+""+j).value=question[arr_analysis[i+page*10]-1].score[j-1];
//							document.getElementById((i+1)+""+j).checked=null;
//						}
//				 }
//				 
//				   document.getElementById("up").style.display="none";
//				 }
//		     }
//			 if(page==5){
//				 document.getElementById("ff").value="双击提交";				 
//			 }
//		   
//	   }else{
//		   var count1=0,count2=0,count3=0,count4=0,count5=0,count6=0,count7=0,count8=0,count9=0;
//		   for(var i=0;i<60;i++){
//			   if(answer[i].name=="analysis11"
//				   ||answer[i].name=="analysis12"
//					   ||answer[i].name=="analysis13"
//						   ||answer[i].name=="analysis14"
//							   ||answer[i].name=="analysis15"
//								   ||answer[i].name=="analysis16"
//									   ||answer[i].name=="analysis17"
//										   ||answer[i].name=="analysis18"){
//				   count1+=parseInt(answer[i].val, 10);
//			   }
//			   if(answer[i].name=="analysis21"
//				   ||answer[i].name=="analysis22"
//					   ||answer[i].name=="analysis23"
//						   ||answer[i].name=="analysis24"
//							   ||answer[i].name=="analysis25"
//								   ||answer[i].name=="analysis26"||answer[i].name=="analysis12"||answer[i].name=="analysis13"){
//				   if(answer[i].name=="analysis12"||answer[i].name=="analysis13"){
//					   count2+=parseInt(6-answer[i].val, 10);
//				   }else{				   
//				     count2+=parseInt(answer[i].val, 10);
//				   }
//			   }
//			   if(answer[i].name=="analysis31"
//				   ||answer[i].name=="analysis32"
//					   ||answer[i].name=="analysis33"
//						   ||answer[i].name=="analysis34"
//							   ||answer[i].name=="analysis35"
//								   ||answer[i].name=="analysis24"
//									   ||answer[i].name=="analysis15"){
//				   if(answer[i].name=="analysis15"){
//					   count3+=parseInt(6-answer[i].val, 10);
//				   }else{
//				       count3+=parseInt(answer[i].val, 10);
//				   }
//			   }
//			   if(answer[i].name=="analysis41"
//				   ||answer[i].name=="analysis42"
//					   ||answer[i].name=="analysis43"
//						   ||answer[i].name=="analysis44"
//							   ||answer[i].name=="analysis45"
//								   ||answer[i].name=="analysis46"
//									   ||answer[i].name=="analysis47"
//										   ||answer[i].name=="analysis48"){
//				   count4+=parseInt(answer[i].val, 10);
//			   }
//			   if(answer[i].name=="analysis51"
//				   ||answer[i].name=="analysis52"
//					   ||answer[i].name=="analysis53"
//						   ||answer[i].name=="analysis54"
//							   ||answer[i].name=="analysis55"
//								   ||answer[i].name=="analysis56"
//									   ||answer[i].name=="analysis57"
//										   ||answer[i].name=="analysis58"){
//				   count5+=parseInt(answer[i].val, 10);
//			   }
//			   if(answer[i].name=="analysis61"
//				   ||answer[i].name=="analysis62"
//					   ||answer[i].name=="analysis63"
//						   ||answer[i].name=="analysis64"
//							   ||answer[i].name=="analysis65"
//								   ||answer[i].name=="analysis66"){
//				   count6+=parseInt(answer[i].val, 10);
//			   }
//			   if(answer[i].name=="analysis71"
//				   ||answer[i].name=="analysis72"
//					   ||answer[i].name=="analysis73"
//						   ||answer[i].name=="analysis74"
//							   ||answer[i].name=="analysis75"
//								   ||answer[i].name=="analysis76"
//									   ||answer[i].name=="analysis18"){
//				   if(answer[i].name=="analysis18"){
//					   count7+=parseInt(6-answer[i].val, 10);
//				   }else{
//				        count7+=parseInt(answer[i].val, 10);
//				   }
//			   }
//			   if(answer[i].name=="analysis81"
//				   ||answer[i].name=="analysis82"
//					   ||answer[i].name=="analysis83"
//						   ||answer[i].name=="analysis84"
//							   ||answer[i].name=="analysis85"
//								   ||answer[i].name=="analysis86"
//									   ||answer[i].name=="analysis14"){
//				   if(answer[i].name=="analysis14"){
//					   count8+=parseInt(6-answer[i].val, 10);
//				   }else{
//				       count8+=parseInt(answer[i].val, 10);
//				   }
//			   }
//			   if(answer[i].name=="analysis91"
//				   ||answer[i].name=="analysis92"
//					   ||answer[i].name=="analysis93"
//						   ||answer[i].name=="analysis94"
//							   ||answer[i].name=="analysis95"
//								   ||answer[i].name=="analysis96"
//									   ||answer[i].name=="analysis97"){
//				   count9+=parseInt(answer[i].val, 10);
//			   }
//			   
//		   }
//		  
//		   document.cookie="count1="+count1;
//		   document.cookie="count2="+count2;
//		   document.cookie="count3="+count3;
//		   document.cookie="count4="+count4;
//		   document.cookie="count5="+count5;
//		   document.cookie="count6="+count6;
//		   document.cookie="count7="+count7;
//		   document.cookie="count8="+count8;
//		   document.cookie="count9="+count9;
//		   document.getElementById("main").style.display="none";
//		   document.getElementById("main2").style.display="block";
//		   result1();
//		   result2();
//		   
//	   }
//		 
// }
// function setImagePreview() {  
//	    var docObj=document.getElementById("doc");  
//	    var imgObjPreview=document.getElementById("preview");  
//	    if(docObj.files && docObj.files[0]){  
//	        //火狐下，直接设img属性  
//	    	document.getElementById("preview").style.display = 'block'
//	    	document.getElementById("st2").style.display = 'block'; 
//	    	 imgObjPreview.style.height = '50%'; 
//	        imgObjPreview.style.height = '200px';                      
//	        //imgObjPreview.src = docObj.files[0].getAsDataURL();  
//	          
//	        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式    
//	        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);  
//	    }else{  
//	        //IE下，使用滤镜  
//	        docObj.select();  
//	        var imgSrc = document.selection.createRange().text;  
//	        var localImagId = document.getElementById("localImag");  
//	        //必须设置初始大小  
//	        localImagId.style.width = '50%';  
//	        localImagId.style.height = "200px";  
//	        //图片异常的捕捉，防止用户修改后缀来伪造图片  
//	        try{  
//	            localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";  
//	            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;  
//	        }catch(e){  
//	            alert("您上传的图片格式不正确，请重新选择!");  
//	            return false;  
//	        }  
//	        imgObjPreview.style.display = 'none';  
//	        document.selection.empty();  
//	    }  
//	    return true;  
//	}  
 
 function countScore(){	
	
	 answer.push({"name":"analysis11","val":document.getElementsByName("question[analysis11]")[0].value});
	 answer.push({"name":"analysis12","val":document.getElementsByName("question[analysis12]")[0].value});
	 answer.push({"name":"analysis13","val":document.getElementsByName("question[analysis13]")[0].value});
	 answer.push({"name":"analysis14","val":document.getElementsByName("question[analysis14]")[0].value});
	 answer.push({"name":"analysis15","val":document.getElementsByName("question[analysis15]")[0].value});
	 answer.push({"name":"analysis16","val":document.getElementsByName("question[analysis16]")[0].value});
	 answer.push({"name":"analysis17","val":document.getElementsByName("question[analysis17]")[0].value});
	 answer.push({"name":"analysis18","val":document.getElementsByName("question[analysis18]")[0].value});
	 
	 answer.push({"name":"analysis21","val":document.getElementsByName("question[analysis21]")[0].value});
	 answer.push({"name":"analysis22","val":document.getElementsByName("question[analysis22]")[0].value});
	 answer.push({"name":"analysis23","val":document.getElementsByName("question[analysis23]")[0].value});
	 answer.push({"name":"analysis24","val":document.getElementsByName("question[analysis24]")[0].value});
	 answer.push({"name":"analysis25","val":document.getElementsByName("question[analysis25]")[0].value});
	 answer.push({"name":"analysis26","val":document.getElementsByName("question[analysis26]")[0].value});
	 
	 answer.push({"name":"analysis31","val":document.getElementsByName("question[analysis31]")[0].value});
	 answer.push({"name":"analysis32","val":document.getElementsByName("question[analysis32]")[0].value});
	 answer.push({"name":"analysis33","val":document.getElementsByName("question[analysis33]")[0].value});
	 answer.push({"name":"analysis34","val":document.getElementsByName("question[analysis34]")[0].value});
	 answer.push({"name":"analysis35","val":document.getElementsByName("question[analysis35]")[0].value});
	 
	 answer.push({"name":"analysis41","val":document.getElementsByName("question[analysis41]")[0].value});
	 answer.push({"name":"analysis42","val":document.getElementsByName("question[analysis42]")[0].value});
	 answer.push({"name":"analysis43","val":document.getElementsByName("question[analysis43]")[0].value});
	 answer.push({"name":"analysis44","val":document.getElementsByName("question[analysis44]")[0].value});
	 answer.push({"name":"analysis45","val":document.getElementsByName("question[analysis45]")[0].value});
	 answer.push({"name":"analysis46","val":document.getElementsByName("question[analysis46]")[0].value});
	 answer.push({"name":"analysis47","val":document.getElementsByName("question[analysis47]")[0].value});
	 answer.push({"name":"analysis48","val":document.getElementsByName("question[analysis48]")[0].value});
	 
	 answer.push({"name":"analysis51","val":document.getElementsByName("question[analysis51]")[0].value});
	 answer.push({"name":"analysis52","val":document.getElementsByName("question[analysis52]")[0].value});
	 answer.push({"name":"analysis53","val":document.getElementsByName("question[analysis53]")[0].value});
	 answer.push({"name":"analysis54","val":document.getElementsByName("question[analysis54]")[0].value});
	 answer.push({"name":"analysis55","val":document.getElementsByName("question[analysis55]")[0].value});
	 answer.push({"name":"analysis56","val":document.getElementsByName("question[analysis56]")[0].value});
	 answer.push({"name":"analysis57","val":document.getElementsByName("question[analysis57]")[0].value});
	 answer.push({"name":"analysis58","val":document.getElementsByName("question[analysis58]")[0].value});
	 
	 answer.push({"name":"analysis61","val":document.getElementsByName("question[analysis61]")[0].value});
	 answer.push({"name":"analysis62","val":document.getElementsByName("question[analysis62]")[0].value});
	 answer.push({"name":"analysis63","val":document.getElementsByName("question[analysis63]")[0].value});
	 answer.push({"name":"analysis64","val":document.getElementsByName("question[analysis64]")[0].value});
	 answer.push({"name":"analysis65","val":document.getElementsByName("question[analysis65]")[0].value});
	 answer.push({"name":"analysis66","val":document.getElementsByName("question[analysis66]")[0].value});
	 
	 answer.push({"name":"analysis81","val":document.getElementsByName("question[analysis81]")[0].value});
	 answer.push({"name":"analysis82","val":document.getElementsByName("question[analysis82]")[0].value});
	 answer.push({"name":"analysis83","val":document.getElementsByName("question[analysis83]")[0].value});
	 answer.push({"name":"analysis84","val":document.getElementsByName("question[analysis84]")[0].value});
	 answer.push({"name":"analysis85","val":document.getElementsByName("question[analysis85]")[0].value});
	 answer.push({"name":"analysis86","val":document.getElementsByName("question[analysis86]")[0].value});
	 
	 answer.push({"name":"analysis71","val":document.getElementsByName("question[analysis71]")[0].value});
	 answer.push({"name":"analysis72","val":document.getElementsByName("question[analysis72]")[0].value});
	 answer.push({"name":"analysis73","val":document.getElementsByName("question[analysis73]")[0].value});
	 answer.push({"name":"analysis74","val":document.getElementsByName("question[analysis74]")[0].value});
	 answer.push({"name":"analysis75","val":document.getElementsByName("question[analysis75]")[0].value});
	 answer.push({"name":"analysis76","val":document.getElementsByName("question[analysis76]")[0].value});
	 
	 answer.push({"name":"analysis91","val":document.getElementsByName("question[analysis91]")[0].value});
	 answer.push({"name":"analysis92","val":document.getElementsByName("question[analysis92]")[0].value});
	 answer.push({"name":"analysis93","val":document.getElementsByName("question[analysis93]")[0].value});
	 answer.push({"name":"analysis94","val":document.getElementsByName("question[analysis94]")[0].value});
	 answer.push({"name":"analysis95","val":document.getElementsByName("question[analysis95]")[0].value});
	 answer.push({"name":"analysis96","val":document.getElementsByName("question[analysis96]")[0].value});	 
	 answer.push({"name":"analysis97","val":document.getElementsByName("question[analysis97]")[0].value});
	 
	 var count1=0,count2=0,count3=0,count4=0,count5=0,count6=0,count7=0,count8=0,count9=0;
	   for(var i=0;i<60;i++){
		   if(answer[i].name=="analysis11"
			   ||answer[i].name=="analysis12"
				   ||answer[i].name=="analysis13"
					   ||answer[i].name=="analysis14"
						   ||answer[i].name=="analysis15"
							   ||answer[i].name=="analysis16"
								   ||answer[i].name=="analysis17"
									   ||answer[i].name=="analysis18"){
			   if(answer[i].name=="analysis12"||answer[i].name=="analysis13"||answer[i].name=="analysis14"
				   ||answer[i].name=="analysis15"||answer[i].name=="analysis18"){
				   count1+=(6-parseInt(answer[i].val, 10));
			   }else{				   
				   count1+=parseInt(answer[i].val, 10);
			   }			  
		   }
		   if(answer[i].name=="analysis21"
			   ||answer[i].name=="analysis22"
				   ||answer[i].name=="analysis23"
					   ||answer[i].name=="analysis24"
						   ||answer[i].name=="analysis25"
							   ||answer[i].name=="analysis26"||answer[i].name=="analysis12"||answer[i].name=="analysis13"){
			   if(answer[i].name=="analysis12"||answer[i].name=="analysis13"){
				   count2+=parseInt(answer[i].val, 10);
			   }else{				   
			     count2+=parseInt(answer[i].val, 10);
			   }
		   }
		   if(answer[i].name=="analysis31"
			   ||answer[i].name=="analysis32"
				   ||answer[i].name=="analysis33"
					   ||answer[i].name=="analysis34"
						   ||answer[i].name=="analysis35"
							   ||answer[i].name=="analysis24"
								   ||answer[i].name=="analysis15"){
			   if(answer[i].name=="analysis15"){
				   count3+=parseInt(answer[i].val, 10);
			   }else{
			       count3+=parseInt(answer[i].val, 10);
			   }
		   }
		   if(answer[i].name=="analysis41"
			   ||answer[i].name=="analysis42"
				   ||answer[i].name=="analysis43"
					   ||answer[i].name=="analysis44"
						   ||answer[i].name=="analysis45"
							   ||answer[i].name=="analysis46"
								   ||answer[i].name=="analysis47"
									   ||answer[i].name=="analysis48"){
			   count4+=parseInt(answer[i].val, 10);
		   }
		   if(answer[i].name=="analysis51"
			   ||answer[i].name=="analysis52"
				   ||answer[i].name=="analysis53"
					   ||answer[i].name=="analysis54"
						   ||answer[i].name=="analysis55"
							   ||answer[i].name=="analysis56"
								   ||answer[i].name=="analysis57"
									   ||answer[i].name=="analysis58"){
			   count5+=parseInt(answer[i].val, 10);
		   }
		   if(answer[i].name=="analysis61"
			   ||answer[i].name=="analysis62"
				   ||answer[i].name=="analysis63"
					   ||answer[i].name=="analysis64"
						   ||answer[i].name=="analysis65"
							   ||answer[i].name=="analysis66"){
			   count6+=parseInt(answer[i].val, 10);
		   }
		   if(answer[i].name=="analysis71"
			   ||answer[i].name=="analysis72"
				   ||answer[i].name=="analysis73"
					   ||answer[i].name=="analysis74"
						   ||answer[i].name=="analysis75"
							   ||answer[i].name=="analysis76"
								   ||answer[i].name=="analysis18"){
			   if(answer[i].name=="analysis18"){
				   count7+=parseInt(answer[i].val, 10);
			   }else{
			        count7+=parseInt(answer[i].val, 10);
			   }
		   }
		   if(answer[i].name=="analysis81"
			   ||answer[i].name=="analysis82"
				   ||answer[i].name=="analysis83"
					   ||answer[i].name=="analysis84"
						   ||answer[i].name=="analysis85"
							   ||answer[i].name=="analysis86"
								   ||answer[i].name=="analysis14"){
			   if(answer[i].name=="analysis14"){
				   count8+=parseInt(answer[i].val, 10);
			   }else{
			       count8+=parseInt(answer[i].val, 10);
			   }
		   }
		   if(answer[i].name=="analysis91"
			   ||answer[i].name=="analysis92"
				   ||answer[i].name=="analysis93"
					   ||answer[i].name=="analysis94"
						   ||answer[i].name=="analysis95"
							   ||answer[i].name=="analysis96"
								   ||answer[i].name=="analysis97"){
			   count9+=parseInt(answer[i].val, 10);
		   }
	   }
	   sc=new Array( count1, count2, count3, count4, count5, count6, count7, count8, count9);
	  
	  result1();
	  result2();
 }
 
 var array=new Array();
 function result1()
 {
	  for(var i=0;i<9;i++)
	  {   
		  var q=0;
		  if(i==0||i==1||i==3||i==4){
			  q=8;
		  }else if (i==5){
			  q=6;
		  }else{
			  q=7;
		  }
		  var h=sc[i];
		  score=(h-q)/(q*4)*100;
		  array[i]=score;
		  
	  }
	  
 };
 function result2(){
	 
	  //var body=new Array("和平质","气虚质","阳虚质","阴虚质","痰湿质","湿热质","血瘀质","气郁质","特禀质");
	  if(array[0]>=60&&array[1]<30&&array[2]<30
			  &&array[3]<30&&array[4]<30
			  &&array[5]<30&&array[6]<30
			  &&array[7]<30&&array[8]<30){
		 window.location='result/result1.html';		 
	  }else if(array[0]>=60&&array[1]<40&&array[2]<40
			  &&array[3]<40&&array[4]<40
			  &&array[5]<40&&array[6]<40
			  &&array[7]<40&&array[8]<40){
		  if(array[1]>30&&array[1]<40){
	    	   bodyA+="气虚质、";
	      }
	      if(array[2]>30&&array[2]<40){
	    	   bodyA+="阳虚质、";
	      }
	      if(array[3]>30&&array[3]<40){
	    	   bodyA+="阴虚质、";
	      }
	      if(array[4]>30&&array[4]<40){
	    	   bodyA+="痰湿质、";
	      }
	      if(array[5]>30&&array[5]<40){
	    	   bodyA+="湿热质、";
	      }
	      if(array[6]>30&&array[6]<40){
	    	   bodyA+="血瘀质、";
	      }
	      if(array[7]>30&&array[7]<40){
	    	   bodyA+="气郁质、";
	      }
	      if(array[8]>30&&array[8]<40){
	    	   bodyA+="特禀质、";
	      }	      
//		      var max = array[1];
//		      var index=1;
//		      for(var i=2;i<9;i++){ 
//			      if(max<array[i]){
//			    	  max=array[i];
//			    	  index=i;
//			      }
//		      }	
	          if(bodyA!="兼夹"){
	             bodyA=bodyA.substring(0,bodyA.length-1)+"。";
	          }else{
	        	 bodyA=""
	          }
	          bodyA=  encodeURI(bodyA);	          
		      var loc='result/result1.html?bodyA='+ bodyA;
		      window.location=loc;
		      
		    //和平质及其他跳转
	  }else if(array[1]>=40||array[2]>=40||array[3]>=40
			  ||array[4]>=40||array[5]>=40||array[6]>=40
			  ||array[7]>=40||array[8]>=40){
		  var max = array[1];
	      var index=1;
	      for(var i=2;i<9;i++){ 
		      if(max<array[i]){
		    	  max=array[i];
		    	  index=i;
		      }
	      }
	      if(array[1]>30&&array[1]<40){
	    	   bodyA2+="气虚质、";
	      }
	      if(array[2]>30&&array[2]<40){
	    	   bodyA2+="阳虚质、";
	      }
	      if(array[3]>30&&array[3]<40){
	    	   bodyA2+="阴虚质、";
	      }
	      if(array[4]>30&&array[4]<40){
	    	   bodyA2+="痰湿质、";
	      }
	      if(array[5]>30&&array[5]<40){
	    	   bodyA2+="湿热质、";
	      }
	      if(array[6]>30&&array[6]<40){
	    	   bodyA2+="血瘀质、";
	      }
	      if(array[7]>30&&array[7]<40){
	    	   bodyA2+="气郁质、";
	      }
	      if(array[8]>30&&array[8]<40){
	    	   bodyA2+="特禀质、";
	      }	
	      if(array[1]>40&&index!=1){
	    	   bodyA3+="气虚质、";
	      }
	      if(array[2]>40&&index!=2){
	    	   bodyA3+="阳虚质、";
	      }
	      if(array[3]>40&&index!=3){
	    	   bodyA3+="阴虚质、";
	      }
	      if(array[4]>40&&index!=4){
	    	   bodyA3+="痰湿质、";
	      }
	      if(array[5]>40&&index!=5){
	    	   bodyA3+="湿热质、";
	      }
	      if(array[6]>40&&index!=6){
	    	   bodyA3+="血瘀质、";
	      }
	      if(array[7]>40&&index!=7){
	    	   bodyA3+="气郁质、";
	      }
	      if(array[8]>40&&index!=8){
	    	   bodyA3+="特禀质、";
	      }
	      if(bodyA2!="倾向"){
	           bodyA2=bodyA2.substring(0,bodyA2.length-1)+"。";
	      }
	      if(bodyA3!="兼有"){
	      bodyA3=bodyA3.substring(0,bodyA3.length-1)+"。";
	      }
	      if(bodyA3!="兼有"&&bodyA2!="倾向"){
	    	  bodyA2=bodyA3;
	      }else if(bodyA3!="兼有"&&bodyA2=="倾向"){
	    	  bodyA2= bodyA3;
	      }else if(bodyA3=="兼有"&&bodyA2!="倾向"){
	    	  bodyA2="";
	      }else{
	    	  bodyA2="";
	      }
	      bodyA2=  encodeURI(bodyA2);
	      var loc='result/result'+(index+1)+'.html?bodyA2='+bodyA2;
	      window.location=loc;
	  }else{		         
	      var loc='result/result1.html?bodyA='+"";
	      window.location=loc; 
	  }
//	  else if(array[1]>30&&array[1]<=40){
//
//		  window.location='result/result2.html';
//	  }else if(array[2]>30&&array[2]<=40){
//
//		  window.location='result/result3.html';
//	  }else if(array[3]>30&&array[3]<=40){
//		  window.location='result/result4.html';
//	  }else if(array[4]>30&&array[4]<=40){
//
//		  window.location='result/result5.html';
//	  }else if(array[5]>30&&array[5]<=40){
//
//		  window.location='result/result6.html';
//	  }else if(array[6]>30&&array[6]<=40){
//
//		  window.location='result/result7.html';
//	  }else if(array[7]>30&&array[7]<=40){
//
//		  window.location='result/result8.html';
//	  }else if(array[8]>30&&array[8]<=40){
//
//		  window.location='result/result9.html';
//	    
//	  }else{
//
//		  window.location='result/result9.html';
//	  }
 }
// function getCookie(name) 
//  {
//      var cookieContent = document.cookie;
//      name += "=";
//      var i = 0; 
//      while (i < cookieContent.length) 
//      {
//        var offset = i + name.length;
//        if (cookieContent.substring(i, offset) == name) 
//        { 
//          var endstr = cookieContent.indexOf(";", offset); 
//          if (endstr == -1) endstr = cookieContent.length;
//            return unescape(cookieContent.substring(offset, endstr)); 
//        }
//          i = cookieContent.indexOf(" ", i) + 1; 
//          if (i == 0) break; 
//      }
//      return null; 
//  }
 function setImagePreview() {  
	    var docObj=document.getElementById("doc");  
	    var imgObjPreview=document.getElementById("preview");  
	    if(docObj.files && docObj.files[0]){  
	        //火狐下，直接设img属性  
	    	document.getElementById("preview").style.display = 'inline'
	    
	    	 
	        imgObjPreview.style.height = '80px';                      
	        //imgObjPreview.src = docObj.files[0].getAsDataURL();  
	          
	        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式    
	        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);  
	    }else{  
	        //IE下，使用滤镜  
	        docObj.select();  
	        var imgSrc = document.selection.createRange().text;  
	        var localImagId = document.getElementById("localImag");  
	        //必须设置初始大小  
	        
	        imgObjPreview.style.height = '80px';   
	        //图片异常的捕捉，防止用户修改后缀来伪造图片  
	        try{  
	            localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";  
	            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;  
	        }catch(e){  
	            alert("您上传的图片格式不正确，请重新选择!");  
	            return false;  
	        }  
	        imgObjPreview.style.display = 'none';  
	        document.selection.empty();  
	    }  
	    return true;  
	}  
 function setImagePreview1() {  
	    var docObj=document.getElementById("doc1");  
	    var imgObjPreview=document.getElementById("preview1");  
	    if(docObj.files && docObj.files[0]){  
	        //火狐下，直接设img属性  
	    	document.getElementById("preview1").style.display = 'inline'	    	
	    	 
	        imgObjPreview.style.height = '160px';                       
	        //imgObjPreview.src = docObj.files[0].getAsDataURL();  
	          
	        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式    
	        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);  
	    }else{  
	        //IE下，使用滤镜  
	        docObj.select();  
	        var imgSrc = document.selection.createRange().text;  
	        var localImagId = document.getElementById("localImag");  
	        //必须设置初始大小  
	       
	        imgObjPreview.style.height = '160px'; 
	        //图片异常的捕捉，防止用户修改后缀来伪造图片  
	        try{  
	            localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";  
	            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;  
	        }catch(e){  
	            alert("您上传的图片格式不正确，请重新选择!");  
	            return false;  
	        }  
	        imgObjPreview.style.display = 'none';  
	        document.selection.empty();  
	    }  
	    return true;  
	}  
 function setImagePreview3() {  
	    var docObj=document.getElementById("doc3");  
	    var imgObjPreview=document.getElementById("preview3");  
	    if(docObj.files && docObj.files[0]){  
	        //火狐下，直接设img属性  
	    	document.getElementById("preview3").style.display = 'inline'	    	
	    	
	        imgObjPreview.style.height = '80px';                     
	        //imgObjPreview.src = docObj.files[0].getAsDataURL();  
	          
	        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式    
	        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);  
	    }else{  
	        //IE下，使用滤镜  
	        docObj.select();  
	        var imgSrc = document.selection.createRange().text;  
	        var localImagId = document.getElementById("localImag");  
	        //必须设置初始大小  
	       
	        imgObjPreview.style.height = '80px';   
	        //图片异常的捕捉，防止用户修改后缀来伪造图片  
	        try{  
	            localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";  
	            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;  
	        }catch(e){  
	            alert("您上传的图片格式不正确，请重新选择!");  
	            return false;  
	        }  
	        imgObjPreview.style.display = 'none';  
	        document.selection.empty();  
	    }  
	    return true;  
	}  
 function setImagePreview2() {  
	    var docObj=document.getElementById("doc2");  
	    var imgObjPreview=document.getElementById("preview2");  
	    if(docObj.files && docObj.files[0]){  
	        //火狐下，直接设img属性  
	    	document.getElementById("preview2").style.display = 'inline'	    	
	    	 
	        imgObjPreview.style.height = '160px';                     
	        //imgObjPreview.src = docObj.files[0].getAsDataURL();  
	          
	        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式    
	        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);  
	    }else{  
	        //IE下，使用滤镜  
	        docObj.select();  
	        var imgSrc = document.selection.createRange().text;  
	        var localImagId = document.getElementById("localImag");  
	        //必须设置初始大小  
	        
	        imgObjPreview.style.height = '160px';   
	        //图片异常的捕捉，防止用户修改后缀来伪造图片  
	        try{  
	            localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";  
	            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;  
	        }catch(e){  
	            alert("您上传的图片格式不正确，请重新选择!");  
	            return false;  
	        }  
	        imgObjPreview.style.display = 'none';  
	        document.selection.empty();  
	    }  
	    return true;  
	}  