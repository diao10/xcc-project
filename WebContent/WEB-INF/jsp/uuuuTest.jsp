<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="../dist/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
<title>Insert title here</title>
</head>
<body>
    <script type="text/javascript">
    var item = {  
            toolbars: [  
                          ['fullscreen', 'undo', 'redo', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat                     ', 'simpleupload', 'insertvideo', 'lineheight','inserttable','|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify'],  
                          ['formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist',                       'selectall', 'cleardoc', 'fontfamily','fontsize']  
                      ],  
              autoHeightEnabled: true, //是否自动长高，默认true  
              autoFloatEnabled: false, //是否保持toolbar的位置不动，默认true  
              wordCount: true, //是否开启字数统计 默认true  
              maximumWords: 100000, //允许的最大字符数 默认值：10000  
              wordOverFlowMsg: "<span style='color:red'>超出范围了！！！！！！！！</span>", //超出字数限制提示  
              elementPathEnabled: false, //是否启用元素路径  
              padding: 0,  
              saveInterval: 5000000, // 将其设置大点，模拟去掉自动保存功能  
              allowDivTransToP: false  
          };  
         //传参生成实例  
        var ue = UE.getEditor('container',item);
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
        UE.Editor.prototype.getActionUrl = function(action) {  
            if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo') {  
            	//return this._bkGetActionUrl.call(this, action);  
            	return '${ctx}/tyyyTest/ued/uploadimage';  
            } else {  
                return this._bkGetActionUrl.call(this, action);  
            }  
        }  
    </script>
	<form action="../Tis/addTis.emp" method="post">
	主题<input>
     <textarea id="container" name="tisContent">UEditor Demo</textarea>
     <input type="submit" value="submit" />
 	</form>
</body>
</html>