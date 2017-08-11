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
	if (session.getAttribute("user") == null) {
		response.sendError(401,"You Need To Login");
	}
%>
<jsp:useBean id="u" class="com.bean.Student"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%new StudentDAO().update(u) ;%>
<%response.sendRedirect("view.jsp") ;%>
</body>
</html>