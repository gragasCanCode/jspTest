<%@page import="com.model.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
String id=null;
if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
	out.println("<script>");
	out.println("location.href='loginForm.jsp'");
	out.println("</script>");
}

String info_id=request.getParameter("id");

Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	conn = DBConnection.getConnection();
	pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
	pstmt.setString(1, info_id);
	rs = pstmt.executeQuery();
	rs.next();
}catch(Exception e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table{
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td>아이디 : </td>
			<td><%=rs.getString("id") %></td>
		</tr>
		<tr>
			<td>패스워드 : </td>
			<td><%=rs.getString("password") %></td>
		</tr>
		<tr>
			<td>이름: </td>
			<td><%=rs.getString("name") %></td>
		</tr>
		<tr>
			<td>성별 : </td>
			<td><%=rs.getString("gender") %></td>
		</tr>
			
		<tr>
			<td>나이 : </td>
			<td><%=rs.getString("age") %></td>
		</tr>
		<tr>
			<td>이메일 : </td>
			<td><%=rs.getString("email") %></td>
		</tr>
		<tr>
			<td colspan=2><a href="member_list.jsp">리스트로 돌아가기</a></td>
		</tr>
	</table>
</body>
</html>