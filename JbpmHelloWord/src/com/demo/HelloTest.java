package com.demo;

import static org.junit.Assert.*;

import java.util.List;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessDefinition;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.RepositoryService;
import org.junit.Test;

public class HelloTest {

	ProcessEngine processEngine;
	
	@Test
	public void test() {
		processEngine=Configuration.getProcessEngine();
		RepositoryService repositoryService=processEngine.getRepositoryService();
		//发布流程定义
		String deployMentId = repositoryService.createDeployment().addResourceFromClasspath("helloWord.jpdl.xml").deploy();
		//查看流程定义
		List<ProcessDefinition> list=repositoryService.createProcessDefinitionQuery().list();
		for (ProcessDefinition processDefinition : list) {
			System.out.println(processDefinition.getId());
		}
		//删除流程定义
		repositoryService.deleteDeploymentCascade(deployMentId);
		System.out.println(repositoryService.createProcessDefinitionQuery().list().size());
	}

}
