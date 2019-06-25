<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="defined" uri="http://www.lumlum.cn/lumlum" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>index</title>
<style>
video{
	width:352px;
    height:198px;	
}
</style>
<script>
window.onload=function(){
	var myVideo=document.getElementsByTagName("video");	
	for(var i=0;i<myVideo.length;i++){
		myVideo[i].currentTime=25;
	}	
	
	$('#myModal').on('hide.bs.modal', function (){
		document.myForm.submit();
	})
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
      		<a class="navbar-brand" href="index.html"><font color="#9900CC" size="+3">Bootstrap</font></a>
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
				<c:choose>
					<c:when test="${empty sessionScope.username}">
	    				<li><a href="${path}/login" target='_blank'>登陆</a></li>
	       				<li><a href="${path}/register" target='_blank'>注册</a></li>
	    			</c:when>
					<c:otherwise>
	    				<li><a href="#" data-toggle="modal" data-target="#myModal">上传视频</a></li>
	        			<li class="dropdown">
	          				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.username}<span class="caret"></span></a>
	          				<ul class="dropdown-menu">
	            				<li><a href="#">个人中心</a></li>
	            				<li><a href="#">消息</a></li>
	            				<li><a href="#">设置</a></li>
	            				<li><a href="#">VIP</a></li>
	            				<li role="separator" class="divider"></li>
	            				<li><a href="#">退出</a></li>
	          				</ul>
	        			</li>
	    			</c:otherwise>
				</c:choose>
			</ul>      
    	</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>


<!-- Modal 引用上面的<a>上传视频</a> -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">分享视频</h4>
      </div>
      <form method="post" name="myForm" action="${path}/upload" enctype="multipart/form-data">
      	<div class="modal-body">     	
          	<div class="form-group">
            	<label for="video_name">视频名称</label>
                <input type="text" class="form-control" id="video_name" name="video_name">
            </div>
            <div class="form-group">
                <label for="describe">描述</label>
                <textarea class="form-control" rows="4" id="describe" name="describe"></textarea>
            </div>         
            <div class="form-group">
                <label for="upload">上传视频</label>
                <input type="file" id="upload" name="upload">
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">分享</button>
          <button type="button" class="btn btn-default">返回</button>
        </div>
      </form>
    </div>
  </div>
</div>


<!-- 轮播图部分  -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <center><img src="${path}/image/banner 01.png"></center>
    </div>
    <div class="item">
      <center><img src="${path}/image/banner 02.png"></center>
    </div>
    <div class="item">
      <center><img src="${path}/image/banner 03.png"></center>
    </div>
    <div class="item">
      <center><img src="${path}/image/banner 04.png"></center>
    </div>
  </div>
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


<!-- 标签页部分 -->
<div class="container">
	<!-- Nav tabs -->
	<ul class="nav nav-tabs row" role="tablist">
    	<li role="presentation" class="active col-md-4 h3 text-center"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">热门推荐</a></li>
    	<li role="presentation" class="col-md-4 h3 text-center"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">最新发布</a></li>
  	</ul>
  	<!-- Tab panes -->
  	<div class="tab-content">
    	<div role="tabpanel" class="tab-pane active" id="home">        
        	<div class="row">
        		<defined:fetchPopular />        
      		</div>
    	</div> 
    	   
    	<div role="tabpanel" class="tab-pane" id="profile">
      		<div class="row">
      	 		<defined:fetchPopular />          
      		</div>
    	</div>  
  	</div>
</div>

</body>
</html>