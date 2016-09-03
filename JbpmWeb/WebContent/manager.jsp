<%@page import="org.jbpm.api.task.Task"%>
<%@page import="org.jbpm.api.TaskService"%>
<%@page import="org.jbpm.api.Configuration"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	ProcessEngine engine=Configuration.getProcessEngine();
    TaskService taskService=  engine.getTaskService();
    Task task= taskService.getTask(request.getParameter("id"));
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="manager_submit.jsp" method="post" >
	<fieldset>审批信息
		<input type="hidden" name="taskId" value="<%= request.getParameter("id")%>" />
		<span>申请天数:<%=taskService.getVariable(request.getParameter("id"), "day") %></span>
	</fieldset>
	<input type="submit" value="提交" name="result" /><input type="submit" value="驳回" name="result" />
</form>
</body>
</html>