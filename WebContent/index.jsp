<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/uploadify/uploadify.css">
    <script type="text/javascript" src="<%=path%>/js/jquery-1.7.js"></script>
    <script type="text/javascript" src="<%=path%>/js/uploadify/swfobject.js"></script>
    <script type="text/javascript" src="<%=path%>/js/uploadify/jquery.uploadify.v2.1.4.js"></script>
    <script type="text/javascript" src="<%=path%>/js/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
<script type="text/javascript">
$(function() { 
	
	$("#uploadify").uploadify({
		'uploader'       : '<%=path%>/js/uploadify/uploadify.swf', //是组件自带的flash，用于打开选取本地文件的按钮 
		'script'         : '<%=path%>/email_uploadFile.action',//处理上传的路径，这里使用Struts2是XXX.action 
		'cancelImg'      : '<%=path%>/js/uploadify/cancel.png',//取消上传文件的按钮图片，就是个叉叉
		'folder'         : 'uploads', //上传文件的目录
		'fileDataName'   : 'uploadify',//和input的name属性值保持一致就好，Struts2就能处理了
		'queueID'        : 'fileQueue',
		'auto'           : true,//是否选取文件后自动上传
		'multi'          : true,//是否支持多文件上传
		'simUploadLimit' : 2,//每次最大上传文件数
		'buttonText'     : 'BROWSE',//按钮上的文字
		'displayData'    : 'percentage',//有speed和percentage两种，一个显示速度，一个显示完成百分比 
		'fileDesc'       : '支持格式:jpg/gif/jpeg/png/bmp/flv.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的 
		'fileExt'        : '*.jpg;*.gif;*.jpeg;*.png;*.bmp;*.*;',//允许的格式
		'onComplete'     : function (event, queueID, fileObj, response, data){
			$("#result").append(response+"\t"+data.speed+"<br>");//显示上传成功结果
			//setInterval("showResult()",2000);//两秒后删除显示的上传成功结果
		}
	});
	 
});
 

	//删除文件
function delFile(obj){
	$(obj).parent().remove();
}

//	function showResult(){//删除显示的上传成功结果
//	  $("#result").html("");
//	}
//	function uploadFile(){//上传文件
//	 jQuery('#uploadify').uploadifyUpload();
//	}
//	function clearFile(){(){//清空所有上传队列
//	    jQuery('#uploadify').uploadifyClearQueue();
//	}
</script>
  </head>
  
  <body>
	<input type="file" name="uploadify" id="uploadify" /><!--
	<p>
		<a href="javascript:uploadFile()">开始上传</a>&nbsp;
		<a href="javascript:clearFile()">取消所有上传</a>
	</p>
	-->
	<div id="fileQueue"></div>
	<div id="result"></div><!--显示结果-->
  
  
  </body>
</html>
