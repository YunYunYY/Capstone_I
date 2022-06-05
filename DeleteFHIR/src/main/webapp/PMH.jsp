<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Delete PMH</title>
</head>
<body>
<form action="DeletePMH" method="post">
Delete(PMID) : <input type="text" name="dpmh0" size="20"><input type="submit" value= "OK" />
</form>
<table width="100%" border="1">
<thead>
		<tr>
			<th>PMID</th>
			<th>PID</th>
			<th>MedicalType</th>
			<th>MedicalName</th>
			<th>MedicalCode</th>
		</tr>
	</thead>
	<tbody>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String jdbcDriver = "jdbc:mysql://172.18.221.213:3306/testemr?useSSL=false";
			String dbUser = "root";
			String dbPwd = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
			
			pstmt = conn.prepareStatement("select * from pmh");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("pmid") %></td>
			<td><%= rs.getString("pid") %></td>
			<td><%= rs.getString("MedicalType") %></td>
			<td><%= rs.getString("MedicalName") %></td>
			<td><%= rs.getString("MedicalCode") %></td>		
		</tr>
	<%
			}
		}catch(SQLException se){
			se.printStackTrace();
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
	</tbody>
</table>
</body>
</html>