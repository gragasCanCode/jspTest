<%@page import="com.servlet.dto.BookDTO"%>
<%@page import="java.util.ArrayList"%>
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
	BookDAO bookDAO = BookDAO.getInstance();
	ArrayList<BookDTO> list = bookDAO.select();
	for(BookDTO dto : list){
		out.print(dto+"<br>");
	}
	%>
</body>
</html>