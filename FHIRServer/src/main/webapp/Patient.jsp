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
<title>Patient</title>
</head>
<body>
<h4>Create Patient</h4>
<form action="AddPatient" method="post">
<table><tr> <td> PID: </td> <td><input type="text" name="f0" size="20"> </td></tr>
<tr> <td> Last Name: </td>  <td><input type="text" name="f1" size="20"> </td></tr>
<tr> <td> First Name: </td> <td><input type="text" name="f2" size="20"> </td></tr>
<tr> <td> Date-of-Birth: </td> <td><input type="text" name="f3" size="20"> </td></tr>
<tr> <td> Gender: </td> <td><input type="text" name="f4" size="20"> </td></tr>
<tr> <td> Address: </td> <td><input type="text" name="f5" size="20"> </td></tr>
<tr> <td> Phone Number: </td> <td><input type="text" name="f6" size="20"> </td></tr>
<tr> <td> City: </td> <td><input type="text" name="f7" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
<h4>Read Patient</h4>
<form action="ReadPatient" method="post">
<table><tr> <td> PID: </td> <td><input type="text" name="rp0" size="20"> </td></tr>
<tr> <td> LastName: </td>  <td><input type="text" name="rp1" size="20"> </td></tr>
<tr> <td> FirstName: </td> <td><input type="text" name="rp2" size="20"> </td></tr>
<tr> <td> DateOfBirth: </td> <td><input type="text" name="rp3" size="20"> </td></tr>
<tr> <td> Gender: </td> <td><input type="text" name="rp4" size="20"> </td></tr>
<tr> <td> Address: </td> <td><input type="text" name="rp5" size="20"> </td></tr>
<tr> <td> PhoneNum: </td> <td><input type="text" name="rp6" size="20"> </td></tr>
<tr> <td> City: </td> <td><input type="text" name="rp7" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
<h4>Update Patient</h4>
<form action="UpdatePatient" method="post">

<table><tr> <td> PID: </td> <td><input type="text" name="up0" size="20"> </td></tr>
<tr> <td> Last Name: </td>  <td><input type="text" name="up1" size="20"> </td></tr>
<tr> <td> First Name: </td> <td><input type="text" name="up2" size="20"> </td></tr>
<tr> <td> Date-of-Birth: </td> <td><input type="text" name="up3" size="20"> </td></tr>
<tr> <td> Gender: </td> <td><input type="text" name="up4" size="20"> </td></tr>
<tr> <td> Address: </td> <td><input type="text" name="up5" size="20"> </td></tr>
<tr> <td> Phone Number: </td> <td><input type="text" name="up6" size="20"> </td></tr>
<tr> <td> City: </td> <td><input type="text" name="up7" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
<h4>Delete Patient</h4>
<form action="DeletePatient" method="post">
Delete(PID) : <input type="text" name="dp0" size="20"><input type="submit" value= "OK" />
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