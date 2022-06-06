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
<title>Delete Encounter</title>
</head>
<body>
<form action="AddEncounter" method="post">
<table><tr> <td> EID: </td> <td><input type="text" name="ce0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ce1" size="20"> </td></tr>
<tr> <td> HID: </td>  <td><input type="text" name="ce2" size="20"> </td></tr>
<tr> <td> PRID: </td>  <td><input type="text" name="ce3" size="20"> </td></tr>
<tr> <td> AdmitDate: </td>  <td><input type="text" name="ce4" size="20"> </td></tr>
<tr> <td> EncounterType: </td>  <td><input type="text" name="ce5" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>



<form action="UpdateAllergy" method="post">
<table><tr> <td> AID: </td> <td><input type="text" name="ua0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ua1" size="20"> </td></tr>
<tr> <td> Allergy Name: </td> <td><input type="text" name="ua2" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<form action="DeleteEncounter" method="post">
Delete(EID) : <input type="text" name="de0" size="20"><input type="submit" value= "OK" />
</form>
<table width="100%" border="1">
<thead>
		<tr>
			<th>EID</th>
			<th>PID</th>
			<th>HID</th>
			<th>PRID</th>
			<th>AdmitDate</th>
			<th>EncounterType</th>
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
			
			pstmt = conn.prepareStatement("select * from Encounter");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("eid") %></td>
			<td><%= rs.getString("pid") %></td>
			<td><%= rs.getString("hid") %></td>
			<td><%= rs.getString("prid") %></td>
			<td><%= rs.getString("AdmitDate") %></td>
			<td><%= rs.getString("EncounterType") %></td>		
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