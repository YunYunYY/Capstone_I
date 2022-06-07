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
<title>Smoking</title>
</head>
<body>
<h4>Create Smoking</h4>
<form action="AddSmoking" method="post">
<table><tr> <td> SMID: </td> <td><input type="text" name="cs0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="cs1" size="20"> </td></tr>
<tr> <td> SmokingStatus: </td> <td><input type="text" name="cs2" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
<h4>Read Smoking</h4>
<form action="ReadSmoking" method="post">
<table><tr> <td> SMID: </td> <td><input type="text" name="rs0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="rs1" size="20"> </td></tr>
<tr> <td> SmokingStatus: </td> <td><input type="text" name="rs2" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
<h4>Update Smoking</h4>
<form action="UpdateSmoking" method="post">
<table><tr> <td> SMID: </td> <td><input type="text" name="us0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="us1" size="20"> </td></tr>
<tr> <td> SmokingStatus: </td> <td><input type="text" name="us2" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
<h4>Delete Smoking</h4>
<form action="DeleteSmoking" method="post">
Delete(SMID) : <input type="text" name="ds0" size="20"><input type="submit" value= "OK" />
</form>
<table width="100%" border="1">
<thead>
		<tr>
			<th>SMID</th>
			<th>PID</th>
			<th>SmokingStatus</th>
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
			
			pstmt = conn.prepareStatement("select * from smoking");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("smid") %></td>
			<td><%= rs.getString("pid") %></td>
			<td><%= rs.getString("SmokingStatus") %></td>			
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