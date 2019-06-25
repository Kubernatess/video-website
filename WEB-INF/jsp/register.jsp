<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page"/>
<link href="${path}/css/register.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="${path}/addUser" method="GET" validate>
  <fieldset>
    <legend>Register</legend>
    <p>用户名*</p><input type="text" name="username"/>    
    <p>密码*</p><input type="password" name="password"/>   
    <p>确认密码*</p><input type="password" />
    <p>电话/手机号*</p><input type="text" placeholder="选填" />
    <p>邮箱*</p><input placeholder="选填" />
    <br/><br/>
    <input type="submit" value="提交"><br/><br/>
  </fieldset>
</form>
</body>
</html>