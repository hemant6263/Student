<%@page import="java.util.List"%>
<%@page import="com.dao.StudentDAO"%>
<%@page import="com.bean.Student "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View</title>
</head>
<body>
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
	<%
		StudentDAO s = new StudentDAO();
	%>
	<%
		List<Student> li = s.getAll();
	%>
	<%
		request.setAttribute("list", li);
	%>

	<table border="1" width="90%">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Address</th>
			<th>Phone</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getId()}</td>
				<td>${u.getName()}</td>
				<td>${u.getAddress()}</td>
				<td>${u.getPhone()}</td>
				<td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>
				<td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<a href="addNew.jsp">Add Student</a><br>
</body>
<body>
	LogOut:
	<a href="logOut.jsp"><%=session.getAttribute("user")%></a>
</body>
</html>