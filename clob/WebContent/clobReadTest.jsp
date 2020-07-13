<%@page import="com.model.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = null;
	ResultSet rs = null;
	try{
		conn = DBConnection.getConnection();
		pstmt = conn.prepareStatement("SELECT * FROM clobtable WHERE num=1");
		rs = pstmt.executeQuery();
		if(rs.next()){
			out.println(rs.getString("content"));
		}
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