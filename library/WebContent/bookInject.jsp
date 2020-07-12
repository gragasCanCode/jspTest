<%@page import="com.servlet.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int bookId = Integer.parseInt(request.getParameter("book_id"));
	String bookName = request.getParameter("book_name");
	int bookCost = Integer.parseInt(request.getParameter("book_cost"));
	
	BookDAO bookDAO = BookDAO.getInstance();
	bookDAO.insert(bookId, bookName, bookCost);
	
	response.sendRedirect("main.jsp");
%>
</body>
</html>