<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.jbpm.api.TaskService"%>
<%@page import="org.jbpm.api.Configuration"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	TaskService taskService=processEngine.getTaskService();
	String taskId=request.getParameter("taskId").trim();
	System.out.println(taskId+"---");
	int day=Integer.parseInt(request.getParameter("day").trim());
	Map map=new HashMap();
	map.put("day", day);
	taskService.setVariables(taskId, map);
	taskService.completeTask(taskId);
	response.sendRedirect("index.jsp");
%>