<%@page import="org.jbpm.api.RepositoryService"%>
<%@page import="org.jbpm.api.Configuration"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<%
ProcessEngine processEngine=Configuration.getProcessEngine();
RepositoryService repositoryService=processEngine.getRepositoryService();
repositoryService.deleteDeploymentCascade(request.getParameter("id"));
%>
