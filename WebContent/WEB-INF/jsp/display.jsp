<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="defined" uri="http://www.lumlum.cn/lumlum" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>display</title>
<style>
img{
	width:192px;
	height:108px;	
}

.row .col-md-4 .list-group .list-group-item .col-md-6 video{
	width:192px;
    height:108px;	
}
</style>
<script>
window.onload=function(){
	var myVideo=document.getElementsByTagName("video");	
	for(var i=0;i<myVideo.length;i++){
		myVideo[i].currentTime=25;
	}
	
}
</script>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
<link href="${path}/css/navigation.css" rel="stylesheet" type="text/css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<!-- 导航栏部分 -->
<nav class="navbar navbar-default navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><font color="#9900CC" size="+3">Bootstrap</font></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">首页<span class="sr-only">(current)</span></a></li>
        <li><a href="#">游戏</a></li>
        <li><a href="#">直播</a></li>
        <li><a href="#">音乐</a></li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="权力的游戏-第八季">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      
      <ul class="nav navbar-nav navbar-right">
      <%
      	if(session.getAttribute("username")!=null){
      %>
			<li><a href="#">上传视频</a></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">YouTube<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">个人中心</a></li>
	            <li><a href="#">消息</a></li>
	            <li><a href="#">设置</a></li>
	            <li><a href="#">VIP</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">退出</a></li>
	          </ul>
	        </li>
	      
      <% 		
      	}
      	else{
      		out.print("<li><a href='#'>登陆</a></li>");
      		out.print("<li><a href='#'>注册</a></li>");
      	}
      %>
      </ul>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>





<div class="row">
	<div class="col-md-8">
		<video src="${path}/video/${requestScope.videoName}" width=960 height=540 controls>
    		Your browser does not support the video tag.
      	</video>
    </div>
    <div class="col-md-4">
    	<h1>相关视频</h1>
      	<ul class="list-group">
      		<defined:fetchRelevant />
        	      
        
		</ul>
	</div>
    
    
  </div>
</body>
</html>