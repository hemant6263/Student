<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Time Out</title>
</head>
<h1>${timeout}</h1>
<body>
	<center>
		<div id="login" style="color: #0000FF;">
			<form action="login" method="get">
				<table>
					<tr>
						<td><label>User Name :</label></td>
						<td><input type="text" name="uname"></td>
					</tr>
					<tr>
						<td><label>PassWord :</label></td>
						<td><input type="text" name="pw"></td>
					</tr>
					<tr>
						<td><label> </label></td>
						<td><input type="submit" value="Log In"> </td>
					</tr>
				</table>
			</form>
</body>
</html>