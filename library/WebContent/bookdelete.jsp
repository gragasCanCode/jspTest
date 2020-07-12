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
BookDAO dao = BookDAO.getInstance();
dao.delete(bookId);

response.sendRedirect("main.jsp");
%>
</body>
</html>