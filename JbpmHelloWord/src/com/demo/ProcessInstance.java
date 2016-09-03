package com.demo;

import static org.junit.Assert.*;

import java.util.List;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.ProcessEngine;
import org.junit.Test;

public class ProcessInstance {

	private ProcessEngine processEngine;
	
	@Test
	public void test() {
		processEngine=Configuration.getProcessEngine();
		processEngine.getRepositoryService().createDeployment().addResourceFromClasspath("helloWord.jpdl.xml").deploy();
		ExecutionService executionService=processEngine.getExecutionService();
		//创建一个流程实例
		org.jbpm.api.ProcessInstance instance= executionService.startProcessInstanceByKey("helloWord");
		org.jbpm.api.ProcessInstance instance1= executionService.startProcessInstanceByKey("helloWord");
		//获取流程状态实例
		//System.out.println(instance.isEnded());
		//重新唤醒流程实例
		//instance=executionService.signalExecutionById(instance.getId());
		//System.out.println(instance.isEnded()+"状态");
		//删除流程
		//executionService.deleteProcessInstanceCascade("helloWord");
		/**
		 * 结束流程
		 */
	//	executionService.endProcessInstance(instance.getId(), "cancel");
		//获取当前流程实例的数量
		List<org.jbpm.api.ProcessInstance> instances=executionService.createProcessInstanceQuery().list();
		for (org.jbpm.api.ProcessInstance processInstance : instances) {
			System.out.println(processInstance.getId()+"---"+processInstance.getName());
		}
	}

}
