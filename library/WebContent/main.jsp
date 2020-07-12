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
	<h1>도서관 관리 프로그램</h1>
	<main>
		<h2><a href="booklist.jsp">책 목록 확인하러가기</a></h2>
		<form action="bookInject.jsp" method="post">
			<fieldset>
				<legend>책 추가하기</legend>
				<ul>				
					<li><label>책 아이디  <input type="text" name="book_id"></label></li>			
					<li><label>책 이름  <input type="text" name="book_name"></label></li>			
					<li><label>책 가격  <input type="text" name="book_cost"></label></li>		
				</ul>			
				<input type="submit" value="추가하기">
			</fieldset>
		</form>
		<form action="bookdelete.jsp" method="post">
			<fieldset>
				<legend>책 제거하기</legend>
				<ul>
					<li><label>책 아이디   <input type="text" name="book_id"></label></li>
				</ul>
				<input type="submit" value="제거하기">
			</fieldset>
		</form>
	</main>
</body>
</html>