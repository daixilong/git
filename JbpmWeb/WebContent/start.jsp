<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.jbpm.api.ExecutionService"%>
<%@page import="org.jbpm.api.Configuration"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	ExecutionService executionService=processEngine.getExecutionService();
	Map map=new HashMap();
	map.put("owner", request.getSession().getAttribute("owner"));
	executionService.startProcessInstanceById(request.getParameter("id"), map);
	response.sendRedirect("index.jsp");
%>