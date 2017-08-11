<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add</title>
</head>
<body>
<%
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = login.jsp");
session.setAttribute("timeout", "Session Timed Out");
%>
<%
	if (session.getAttribute("user") == null) {
		response.sendError(401,"You Need To Login");
	}
%>
	<form action="addServ"  method="get">
		<table>
			<tr>
				<td><label>ID :</label></td>
				<td><input type="text" name="id" value="${id}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><label>Name :</label></td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td><label>Address :</label></td>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<td><label>Phone :</label></td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td><label>                  </label></td>
				<td><input type="submit" value="Add"></td>
			</tr>
		</table>

	</form>
	LogOut:  <a href="logOut.jsp"><%=session.getAttribute("user") %></a>
</body>
</html>