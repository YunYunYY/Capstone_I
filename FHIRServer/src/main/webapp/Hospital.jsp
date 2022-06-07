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
<title>Delete Hospital</title>
</head>
<body>
<h4>Create Hospital</h4>
<form action="AddHospital" method="post">
<table><tr> <td> HID: </td> <td><input type="text" name="ch0" size="20"> </td></tr>
<tr> <td> HospitalName: </td>  <td><input type="text" name="ch1" size="20"> </td></tr>
<tr> <td> HospitalIdentifier: </td> <td><input type="text" name="ch2" size="20"> </td></tr>
<tr> <td> Address: </td> <td><input type="text" name="ch3" size="20"> </td></tr>
<tr> <td> PhoneNum: </td> <td><input type="text" name="ch4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<h4>Read Hospital</h4>
<form action="ReadHospital" method="post">
<table><tr> <td> HID: </td> <td><input type="text" name="rh0" size="20"> </td></tr>
<tr> <td> HospitalName: </td>  <td><input type="text" name="rh1" size="20"> </td></tr>
<tr> <td> HospitalIdentifier: </td> <td><input type="text" name="rh2" size="20"> </td></tr>
<tr> <td> Address: </td> <td><input type="text" name="rh3" size="20"> </td></tr>
<tr> <td> PhoneNum: </td> <td><input type="text" name="rh4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<h4>Update Hospital</h4>
<form action="UpdateHospital" method="post">
<table><tr> <td> HID: </td> <td><input type="text" name="uh0" size="20"> </td></tr>
<tr> <td> HospitalName: </td>  <td><input type="text" name="uh1" size="20"> </td></tr>
<tr> <td> HospitalIdentifier: </td> <td><input type="text" name="uh2" size="20"> </td></tr>
<tr> <td> Address: </td> <td><input type="text" name="uh3" size="20"> </td></tr>
<tr> <td> PhoneNum: </td> <td><input type="text" name="uh4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<h4>Delete Hospital</h4>
<form action="DeleteHospital" method="post">
Delete(HID) : <input type="text" name="dh0" size="20"><input type="submit" value= "OK" />
</form>
<table width="100%" border="1">
<thead>
		<tr>
			<th>HID</th>
			<th>HospitalName</th>
			<th>HospitalIdentifier</th>
			<th>Address</th>
			<th>PhoneNum</th>
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
			
			pstmt = conn.prepareStatement("select * from hospital");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("hid") %></td>
			<td><%= rs.getString("HospitalName") %></td>
			<td><%= rs.getString("HospitalIdentifier") %></td>
			<td><%= rs.getString("Address") %></td>
			<td><%= rs.getString("PhoneNum") %></td>		
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