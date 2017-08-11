<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="loginError.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<h1>Home Page</h1>
<%
	if (session.getAttribute("user") == null) {
		response.sendError(401, "You Need To Login");
	}
%>
<%
	int timeout = session.getMaxInactiveInterval();
	response.setHeader("Refresh", timeout + "; URL = login.jsp");
	session.setAttribute("timeout", "Session Timed Out");
%>
<body>
	<a href="addNew.jsp">Add New </a>
	<br>
	<a href="view.jsp">Delete And Update</a>
	<br> LogOut:
	<a href="logOut.jsp"><%=session.getAttribute("user")%></a>
</body>

</html>