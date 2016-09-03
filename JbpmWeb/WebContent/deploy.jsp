<%@page import="java.util.zip.ZipInputStream"%>
<%@page import="org.jbpm.api.RepositoryService"%>
<%@page import="org.jbpm.api.Configuration"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<%

	ProcessEngine processEngine=Configuration.getProcessEngine();
	RepositoryService repositoryService=processEngine.getRepositoryService();
//	repositoryService.createDeployment().addResourceFromClasspath("leave.jpdl.xml").deploy();
	ZipInputStream inputStream=new ZipInputStream(this.getClass().getResourceAsStream("/leave.zip"));
	repositoryService.createDeployment().addResourcesFromZipInputStream(inputStream).deploy();
response.sendRedirect("index.jsp");
%>
