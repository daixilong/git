package com.demo;

import static org.junit.Assert.*;

import java.util.List;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.IdentityService;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.RepositoryService;
import org.jbpm.api.identity.Group;
import org.jbpm.api.identity.User;
import org.junit.Test;

public class TestGroup {

	@Test
	public void test() {
		ProcessEngine engine=Configuration.getProcessEngine();
		//一个组下面的用户可以相互访问
		/*IdentityService identityService= engine.getIdentityService();
		RepositoryService repositoryService= engine.getRepositoryService();
		identityService.createGroup("dev");
		identityService.createUser("user1", "user3", "user4");
		identityService.createUser("user2", "user5", "user6");
		identityService.createMembership("user1", "dev");
		identityService.createMembership("user2", "dev");
		repositoryService.createDeployment().addResourceFromClasspath("Group.jpdl.xml").deploy();
		List<User> list= identityService.findUsers();
		List<Group> groups= identityService.findGroupsByUser("user3");
		 for (Group group : groups) {
			System.out.println("-----"+group.getId()+"---"+group.getName());
		}
		for (User user : list) {
			System.out.println("--"+user.getFamilyName()+"--"+user.getId());
		}*/
		RepositoryService repositoryService= engine.getRepositoryService();
		repositoryService.createDeployment().addResourceFromClasspath("Group.jpdl.xml").deploy();
		ExecutionService executionService=engine.getExecutionService();
		executionService.startProcessInstanceByKey("event");
	}

}
