<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	form{
		width:500px;
		padding: 20px;
		margin:0 auto;
	}
	input[type="text"],input[type="password"]{
		display: block;
		padding: 5px;
		width: 100%;
		box-sizing: border-box;
		margin:10px 0;
	}
</style>
<body>
<form action="joinProcess.jsp" method="post" name="joinform">
	<fieldset>
		<legend>회원 가입 페이지</legend>	
		<input type="text" name="id" placeholder="ID">
		<input type="password" name="password" placeholder="PASSWORD">
		<input type="text" name="name" placeholder="name">
		<input type="text" name="age" placeholder="age">
		<div>		
			<label><input type="radio" name="gender" value="male" checked>male</label>
			<label><input type="radio" name="gender" value="female">female</label>
		</div>
		<input type="text" name="email" placeholder="email0">
		<div>
			<a href="javascript:joinform.submit()">sign up!</a>
			<a href="javascript:joinform.reset()">reset</a>
		</div>
	</fieldset>
</form>
</body>
</html>