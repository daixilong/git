package com.demo;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;

public class ProcessListener implements EventListener {

	@Override
	public void notify(EventListenerExecution arg0) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("----"+arg0);
	}

}
