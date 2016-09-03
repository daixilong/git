<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.jbpm.api.ProcessDefinition"%>
<%@page import="org.jbpm.api.ProcessInstance"%>
<%@page import="org.jbpm.api.ExecutionService"%>
<%@page import="org.jbpm.api.RepositoryService"%>
<%@page import="org.jbpm.api.Configuration"%>
<%@page import="org.jbpm.api.ProcessEngine"%>
<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	RepositoryService repositoryService=processEngine.getRepositoryService();
	ExecutionService executionService= processEngine.getExecutionService();
	String id=request.getParameter("id");
	ProcessInstance processInstance=executionService.findProcessInstanceById(id);
	String processdefinedId=processInstance.getProcessDefinitionId();
	ProcessDefinition definition= repositoryService.createProcessDefinitionQuery().processDefinitionId(processdefinedId).uniqueResult();
	InputStream inputStream=repositoryService.getResourceAsStream(definition.getDeploymentId(), "leave.png");
	byte[] b=new byte[1024];
	int len=-1;
	while((len=inputStream.read(b, 0, 1024))!=-1){
			response.getOutputStream().write(b, 0, len);
	}
	response.getOutputStream().flush();
	response.getOutputStream().close();
	response.flushBuffer();
	out.clear();
	out=pageContext.pushBody();
%>
