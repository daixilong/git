<%
   	String username=	 request.getParameter("username");
	request.getSession().setAttribute("owner", username);
	response.sendRedirect("index.jsp");
%>