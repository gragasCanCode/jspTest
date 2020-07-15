<%@page import="com.model.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=null;
if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
	out.println("<script>");
	out.println("location.href='loginForm.jsp'");
	out.println("</script>");
}
String delete_id=request.getParameter("id");

Connection conn = null;
PreparedStatement pstmt = null;

try{
	conn = DBConnection.getConnection();
	pstmt = conn.prepareStatement("DELETE FROM member WHERE id=?");
	pstmt.setString(1, delete_id);
	pstmt.executeUpdate();
	
	out.println("<script>");
	out.println("location.href='member_list.jsp'");
	out.println("</script>");
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>