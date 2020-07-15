<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String pass=request.getParameter("password");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	conn = DBConnection.getConnection();
	pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()){
		if(pass.equals(rs.getString("password"))){
			session.setAttribute("id", id);
			out.println("<script>");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}
	}
	out.println("<script>");
	out.println("location.href='loginForm.jsp'");
	out.println("</script>");
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		rs.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
