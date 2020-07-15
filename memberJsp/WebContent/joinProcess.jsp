<%@page import="com.model.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String pass=request.getParameter("password");
String name=request.getParameter("name");
int age=Integer.parseInt(request.getParameter("age"));
String gender=request.getParameter("gender");
String email=request.getParameter("email");

Connection conn = null;
PreparedStatement pstmt = null;

try{
	conn = DBConnection.getConnection();
	pstmt = conn.prepareStatement("INSERT INTO member VALUES (?,?,?,?,?,?)");
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setInt(3, age);
	pstmt.setString(4, gender);
	pstmt.setString(5, email);
	pstmt.setString(6, name);
	
	int res = pstmt.executeUpdate();
	if(res != 0){
		out.print("<script>");
		out.print("location.href='loginForm.jsp'");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("location.href='joinForm.jsp'");
		out.print("</script>");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		pstmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
