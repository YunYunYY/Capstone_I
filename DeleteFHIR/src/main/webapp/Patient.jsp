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
<title>Patient Delete</title>
</head>
<body>
<form action="DeletePatient" method="post">
Delete(ID) : <input type="text" name="dp0" size="20"><input type="submit" value= "OK" />
</form>
<table width="100%" border="1">
<thead>
		<tr>
			<th>ID</th>
			<th>LastName</th>
			<th>FirstName</th>
			<th>DateOfBirth</th>
			<th>Gender</th>
			<th>Address</th>
			<th>PhoneNum</th>
			<th>City</th>
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
			
			pstmt = conn.prepareStatement("select * from patient");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("pid") %></td>
			<td><%= rs.getString("LastName") %></td>
			<td><%= rs.getString("FirstName") %></td>
			<td><%= rs.getString("DateOfBirth") %></td>
			<td><%= rs.getString("Gender") %></td>
			<td><%= rs.getString("Address") %></td>
			<td><%= rs.getString("PhoneNum") %></td>
			<td><%= rs.getString("City") %></td>			
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