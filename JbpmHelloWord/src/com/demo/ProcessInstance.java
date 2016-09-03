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
		//����һ������ʵ��
		org.jbpm.api.ProcessInstance instance= executionService.startProcessInstanceByKey("helloWord");
		org.jbpm.api.ProcessInstance instance1= executionService.startProcessInstanceByKey("helloWord");
		//��ȡ����״̬ʵ��
		//System.out.println(instance.isEnded());
		//���»�������ʵ��
		//instance=executionService.signalExecutionById(instance.getId());
		//System.out.println(instance.isEnded()+"״̬");
		//ɾ������
		//executionService.deleteProcessInstanceCascade("helloWord");
		/**
		 * ��������
		 */
	//	executionService.endProcessInstance(instance.getId(), "cancel");
		//��ȡ��ǰ����ʵ��������
		List<org.jbpm.api.ProcessInstance> instances=executionService.createProcessInstanceQuery().list();
		for (org.jbpm.api.ProcessInstance processInstance : instances) {
			System.out.println(processInstance.getId()+"---"+processInstance.getName());
		}
	}

}
