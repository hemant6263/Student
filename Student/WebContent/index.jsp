<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#log").click(function() {
			$("#login").show();
			if ($('#signup').css('display') != 'none') {
				$("#signup").css('display','none');
			}
		});

	});
	$(document).ready(function() {
		$("#sign").click(function() {
			$("#signup").toggle();
			if ($('#login').css('display') != 'none') {
				$("#login").css('display','none');
			}
		});
	});

	$(document).ready(function() {
		$("#username").keydown(function() {
			$("#username").css("background-color", "yellow");
		});
	});
	//ajax call
	$(document).ready(function() {
		$("#username").keydown(function() {
			name = $("#username").val();
			$.ajax({
				type : "POST",
				url : "userName.jsp",
				data : "{'name':'" + name + "'}",
				contentType : "application/json",
				async : false,
				success : function(data) {
					$("#response").html(data.d);
				}
			});
		});
	});
</script>

</head>
<center>
	<h1>
		Student Management System
		<h1>
			<hr>
</center>
<body>
	<center>
		<button id="log">Login</button>
		||
		<button id="sign">SignUp</button>
	</center>
</body>
<h1>${message1}</h1>
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
						<td><input type="submit" value="Log In"> ${message}</td>
					</tr>
				</table>
			</form>
		</div>
		<div id="signup" style="color: #0000FF; display: none;">
			<form action="signup" method="get">
				<table>
					<tr>
						<td><label>User Name :</label></td>
						<td><input type="text" name="uname" id="username" value= "${user}">
							<div id="response"></div></td>

					</tr>
					<tr>
						<td><label>PassWord :</label></td>
						<td><input type="text" name="pw"></td>
					</tr>
					<tr>
						<td><label>Re-Enter PassWord :</label></td>
						<td><input type="text" name="pw2"></td>
					</tr>
					<tr>
						<td><label> </label></td>
						<td><input type="submit" value="Sign Up"></td>
					</tr>
				</table>
			</form>
		</div>
	</center>
</body>
</html>