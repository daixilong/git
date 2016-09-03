<%@page import="com.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%
   		UserInfo userInfo=new UserInfo();
   		userInfo.setId("1");
   		userInfo.setName("张三");
   		pageContext.setAttribute("user", userInfo);
   %>
  <%@taglib prefix="c" uri="/myTag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>tagSupport的使用</title>
</head>
<body>
	<c:userInfo user="${user}" />
</body>
</html>