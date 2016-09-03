<%@page import="org.jbpm.api.RepositoryService"%>
<%@page import="org.jbpm.api.model.ActivityCoordinates"%>
<%@page import="java.util.Set"%>
<%@page import="org.jbpm.api.ProcessInstance"%>
<%@page import="org.jbpm.api.ExecutionService"%>
<%@page import="org.jbpm.api.Configuration"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String id=request.getParameter("id");
	ProcessEngine processEngine=Configuration.getProcessEngine();
	RepositoryService repositoryService=processEngine.getRepositoryService();
	ExecutionService executionService= processEngine.getExecutionService();
	ProcessInstance instance= executionService.findProcessInstanceById(id);
	Set<String> set= instance.findActiveActivityNames();
	ActivityCoordinates ac=repositoryService.getActivityCoordinates(instance.getProcessDefinitionId(), set.iterator().next());
	System.out.println("---"+ac.getX()+"--"+ac.getY()+"---"+ac.getWidth()+"---"+ac.getHeight());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<img alt="" src="pic.jsp?id=<%=id %>" style="position:absolute;left:0px;top:0px;"/>
<div style="position:absolute;border:1px solid red;left:<%=ac.getX()%>px;top:<%=ac.getY()%>px;width:<%=ac.getWidth()%>px;height:<%=ac.getHeight()%>px;" ></div>
</body>
</html>