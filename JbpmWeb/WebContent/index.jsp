<%@page import="org.jbpm.api.task.Task"%>
<%@page import="org.jbpm.api.ProcessInstance"%>
<%@page import="org.jbpm.api.ExecutionService"%>
<%@page import="org.jbpm.api.TaskService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="org.jbpm.api.ProcessDefinition"%>
<%@page import="java.util.List"%>
<%@page import="org.jbpm.api.RepositoryService"%>
<%@page import="org.jbpm.api.Configuration"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<a href="deploy.jsp" >发布流程</a><br>
	<table border="1px" cellpadding="1" cellspacing="1" >
		<tr>
			<td>id</td>
			<td>name</td>
			<td>version</td>
			<td>oper</td>
		</tr>
	
	<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	RepositoryService repositoryService=processEngine.getRepositoryService();
	ExecutionService executionService= processEngine.getExecutionService();
	TaskService taskService=processEngine.getTaskService();
	List<ProcessDefinition> definitions=repositoryService.createProcessDefinitionQuery().list();
	 List<ProcessInstance> instances=	executionService.createProcessInstanceQuery().list();
	 String owner=  (String)request.getSession().getAttribute("owner");
	List<Task> tasks= taskService.findPersonalTasks(owner);
	for(ProcessDefinition definition:definitions){
		%>
			<tr>
				<td><%=definition.getId() %></td>
				<td><%=definition.getName() %></td>
				<td><%=definition.getVersion() %></td>
				<td><%=definition.getId() %></td>
				<td><a href="remove.jsp?id=<%=definition.getDeploymentId() %>" >删除流程</a><a href="start.jsp?id=<%=definition.getId() %>" >开启流程</a></td>
			</tr>
		<% 
	}
	%>
	</table>
	<span>流程实例展示</span><br>
<table border="1px" cellpadding="1" cellspacing="1" >
		<tr>
			<td>id</td>
			<td>activity</td>
			<td>state</td>
			<td></td>
		</tr>
		<%
			for(ProcessInstance instance:instances){
				%>
					<tr>
						<td><%=instance.getId() %></td>
						<td><%=instance.findActiveActivityNames() %></td>
						<td><%=instance.getState() %></td>
						<td><a href="view.jsp?id=<%=instance.getId() %>" >查看流程图</a></td>
					</tr>
				<% 
			}
		%>
	</table>
	<span>待办任务</span><br>
	<table border="1px" cellpadding="1" cellspacing="1" >
		<tr>
			<td>id</td>
			<td>name</td>
			<td></td>
		</tr>
		<%
			for(Task task:tasks){
				%>
					<tr>
						<td><%=task.getId() %></td>
						<td><%=task.getName() %></td>
						<td><a href="<%=task.getFormResourceName() %>?id=<%=task.getId() %>" >发起流程</a></td>
					</tr>
				<% 
			}
		%>
	</table>
</body>
</html>