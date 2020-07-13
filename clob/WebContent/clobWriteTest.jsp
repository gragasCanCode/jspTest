<%@page import="com.model.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
StringBuffer sb=null;

try{
	conn = DBConnection.getConnection();
	String sql = "INSERT INTO clobtable (num, content) VALUES (1,?)";
	sb = new StringBuffer();
	for(int i=0; i<10000; i++){
		sb.append("무다");
	}
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, sb.toString());
	pstmt.executeUpdate();
	out.println("데이터를 저장했습니다.");
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		pstmt.close();
		conn.close();
	}catch(Exception e2){
		e2.printStackTrace();
	}
}
%>