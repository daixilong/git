package com.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.model.UserInfo;

public class UserInfoTag extends TagSupport  {
	private static final long serialVersionUID = -5323773988350004201L;

	private UserInfo user;
	
	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		//输出
		JspWriter out=pageContext.getOut();
		if(user==null){
			try {
				out.write("没有任何信息");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return SKIP_BODY;
		}
		try {
			out.println("<table>");
			out.println("<tr>");
			out.println("<td>Id</td>");
			out.println("<td>"+user.getId()+"</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<td>Name</td>");
			out.println("<td>"+user.getName()+"</td>");
			out.println("</tr>");
			out.println("</table>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SKIP_BODY;
	}
	
	@Override
	public void release() {
		// TODO Auto-generated method stub
		super.release();
		this.user=null;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}
	
}
