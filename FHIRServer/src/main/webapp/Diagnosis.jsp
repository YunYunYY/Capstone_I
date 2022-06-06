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
<title>Delete Diagnosis</title>
</head>
<body>
<form action="AddDiagnosis" method="post">
<table><tr> <td> DID: </td> <td><input type="text" name="cd0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="cd1" size="20"> </td></tr>
<tr> <td> DiagnosisName: </td> <td><input type="text" name="cd2" size="20"> </td></tr>
<tr> <td> DiagnosisCode: </td> <td><input type="text" name="cd3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>




<form action="UpdateDiagnosis" method="post">
<table><tr> <td> DID: </td> <td><input type="text" name="ud0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ud1" size="20"> </td></tr>
<tr> <td> Diagnosis Name: </td> <td><input type="text" name="ud2" size="20"> </td></tr>
<tr> <td> Diagnosis Code: </td> <td><input type="text" name="ud3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<form action="DeleteDiagnosis" method="post">
Delete(DID) : <input type="text" name="dd0" size="20"><input type="submit" value= "OK" />
</form>
<table width="100%" border="1">
<thead>
		<tr>
			<th>PID</th>
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
			
			pstmt = conn.prepareStatement("select * from diagnosis");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("did") %></td>
			<td><%= rs.getString("pid") %></td>
			<td><%= rs.getString("DiagnosisName") %></td>
			<td><%= rs.getString("DiagnosisCode") %></td>		
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