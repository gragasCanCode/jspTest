<%@page import="com.model.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String sql = "INSERT INTO student (num, name) VALUES (13,'유비')";
String sql2 = "SELECT * FROM student WHERE num=12";

try{
	conn = DBConnection.getConnection();
	conn.setAutoCommit(false);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	pstmt=conn.prepareStatement(sql2);
	rs = pstmt.executeQuery();
	if(!rs.next()){
		conn.rollback();
		out.println("<h3>데이터 삽입에 문제가 발생하여 롤백하였습니다.</h3>");
	}else{
		conn.commit();
		out.println("<h3>데이터 삽입이 모두 완료되었습니다.</h3>");
		conn.setAutoCommit(true);
	}
}catch(Exception e){
	out.print("<h3>데이터 삽입에 실패하였습니다.</h3>");
	e.printStackTrace();
}finally{
	try{
		rs.close();
		pstmt.close();
		conn.close();
	}catch(Exception e2){
		e2.printStackTrace();
	}
}
%>