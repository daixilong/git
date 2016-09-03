<%@page import="org.jbpm.api.TaskService"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<%@page import="org.jbpm.api.Configuration"%>
<%
	String result= request.getParameter("result");
	String taskId=request.getParameter("taskId");
	ProcessEngine engine=	Configuration.getProcessEngine();
	TaskService taskService=engine.getTaskService();
	taskService.completeTask(taskId, new String(result.getBytes("utf-8")));
	response.sendRedirect("index.jsp");
%>