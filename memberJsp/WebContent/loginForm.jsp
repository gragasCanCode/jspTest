<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="lcontainer">
		<h2>login form</h2>
		<form action="loginProcess.jsp" name="loginform" method="post">
			<input type="text" name="id" placeholder="ID">
			<input type="password" name="password" placeholder="PASSWORD">
			<div class="submit-and-signup">
			<a href="javascript:loginform.submit()">login</a>
			<a href="joinForm.jsp">sign up</a>						
			</div>
		</form>
	</div>
</body>
</html>