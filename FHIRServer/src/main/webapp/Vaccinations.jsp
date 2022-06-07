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
<title>Vaccinations</title>
</head>
<body>
<h4>Create Vaccinations</h4>
<form action="AddVaccinations" method="post">
<table><tr> <td> VID: </td> <td><input type="text" name="cv0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="cv1" size="20"> </td></tr>
<tr> <td> VaccineName: </td> <td><input type="text" name="cv2" size="20"> </td></tr>
<tr> <td> VaccineCode: </td> <td><input type="text" name="cv3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<h4>Read Vaccinations</h4>
<form action="ReadVaccinations" method="post">
<table><tr> <td> VID: </td> <td><input type="text" name="rv0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="rv1" size="20"> </td></tr>
<tr> <td> VaccineName: </td> <td><input type="text" name="rv2" size="20"> </td></tr>
<tr> <td> VaccineCode: </td> <td><input type="text" name="rv3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<h4>Update Vaccinations</h4>
<form action="UpdateVaccinations" method="post">
<table><tr> <td> VID: </td> <td><input type="text" name="uv0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="uv1" size="20"> </td></tr>
<tr> <td> VaccineName: </td> <td><input type="text" name="uv2" size="20"> </td></tr>
<tr> <td> VaccineCode: </td> <td><input type="text" name="uv3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<h4>Delete Vaccinations</h4>
<form action="DeleteVaccinations" method="post">
Delete(VID) : <input type="text" name="dv0" size="20"><input type="submit" value= "OK" />
</form>
<table width="100%" border="1">
<thead>
		<tr>
			<th>VID</th>
			<th>PID</th>
			<th>VaccineName</th>
			<th>VaccineCode</th>
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
			
			pstmt = conn.prepareStatement("select * from Vaccinations");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("vid") %></td>
			<td><%= rs.getString("pid") %></td>
			<td><%= rs.getString("VaccineName") %></td>
			<td><%= rs.getString("VaccineCode") %></td>
					
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