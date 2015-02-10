<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery弹出层特效代码 背景遮盖 支持拖动 - 模板巴士www.mobanbus.cn</title>
    <script type="text/javascript" src="<%=path%>/js/jquery-1.7.js"></script>
<style type="text/css">
/*设置全屏无空隙*/
body {
    padding: 0px;
    margin: 0px;
}
#wrap12 {
    background-color: #CCCCCC;
    width: 100%;
    height: 100%;
    /** z-index必须设置position，设置为绝对的方便控制*/
    position: absolute;
    filter: alpha(opacity = 50); /*IE滤镜，透明度50%*/
     -moz-opacity : 0.5;
    /*Firefox私有，透明度50%*/ opacity : 0.5; /*其他，透明度50%*/
    margin-left: -1px;
    z-index: 1000;
    -moz-opacity: 0.5; /*Firefox私有，透明度50%*/
    opacity: 0.5;
}
 
#quyu {
    background-color: red;
    width: 320px;
    height: 280px;
    position: absolute;
    margin-left: 25%;
    margin-top: 10%;
    z-index: 9999;
}
</style>
<script type="text/javascript">
    var quyu1;
    var wrap1;
    $(function() {
        quyu1 = $("#quyu");
        wrap1 = $("#wrap12");
        close1();
        close2();
    });
    function show1() {
        /* $("#quyu").attr("style","display: block;");*/
        quyu1.prependTo("#wrap");
        wrap1.prependTo("body");
 
    }
    function close1() {
        $("#quyu").remove();
        close2();
    }
    function close2() {
        $("#wrap12").remove();
    }
</script>
</head>
<body>
    <button onclick="show1()">打开</button>
    <button onclick="close1()">关闭</button>
    <br>
    <select>
        <option>1</option>
    </select>
    <div id="wrap12"></div>
    <div id="wrap">
        <div id="quyu">
            <table>
                <tr>
                    <td onclick="close1()">关闭</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>