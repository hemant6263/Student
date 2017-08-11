<%@page import="com.bean.Student"%>
<%@page import="com.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		int timeout = session.getMaxInactiveInterval();
		response.setHeader("Refresh", timeout + "; URL = login.jsp");
		session.setAttribute("timeout", "Session Timed Out");
	%>
	<%
		if (session.getAttribute("user") == null) {
			response.sendError(401, "You Need To Login");
		}
	%>
	<%
		String id = request.getParameter("id");
		Student u = StudentDAO.getRecordById(Integer.parseInt(id));
	%>

	<h1>Edit Form</h1>
	<form action="edit.jsp" method="post">
		<table>
			<tr>
				<td>ID:</td>
				<td><input type="text" name="name" readonly="readonly"
					value="<%=u.getId()%>" /></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" value="<%=u.getName()%>" /></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="Address"
					value="<%=u.getAddress()%>" /></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="Phone" value="<%=u.getPhone()%>" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Edit " /></td>
			</tr>
		</table>
	</form>
	LogOut:
	<a href="logOut.jsp"><%=session.getAttribute("user")%></a>
</body>
</html>