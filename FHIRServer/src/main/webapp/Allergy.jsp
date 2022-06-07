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
<title>Allergy</title>
</head>
<body>

<h4>Create Allergy</h4>
<form action="AddAllergy" method="post">
<table><tr> <td> AID: </td> <td><input type="text" name="ca0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ca1" size="20"> </td></tr>
<tr> <td> Allergy Name: </td> <td><input type="text" name="ca2" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<h4>Read Allergy</h4>
<form action="ReadAllergy" method="post">
<table><tr> <td> AID: </td> <td><input type="text" name="ra0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ra1" size="20"> </td></tr>
<tr> <td> Allergy Name: </td> <td><input type="text" name="ra2" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<h4>Update Allergy</h4>
<form action="UpdateAllergy" method="post">
<table><tr> <td> AID: </td> <td><input type="text" name="ua0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ua1" size="20"> </td></tr>
<tr> <td> Allergy Name: </td> <td><input type="text" name="ua2" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<h4>Delete Allergy</h4>
<form action="DeleteAllergy" method="post">
Delete(AID) : <input type="text" name="da0" size="20"><input type="submit" value= "OK" />
</form>
<br>



<table width="100%" border="1">
<thead>
		<tr>
			<th>AID</th>
			<th>PID</th>
			<th>AllergyName</th>
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
			
			pstmt = conn.prepareStatement("select * from allergy");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("aid") %></td>
			<td><%= rs.getString("pid") %></td>
			<td><%= rs.getString("AllergyName") %></td>		
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