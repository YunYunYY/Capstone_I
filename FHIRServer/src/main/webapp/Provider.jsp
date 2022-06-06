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
<title>Delete Provider</title>
</head>
<body>
<form action="AddProvider" method="post">
<table><tr> <td> PRID: </td> <td><input type="text" name="cpr0" size="20"> </td></tr>
<tr> <td> LicenseNum: </td>  <td><input type="text" name="cpr1" size="20"> </td></tr>
<tr> <td> ProviderName: </td> <td><input type="text" name="cpr2" size="20"> </td></tr>
<tr> <td> SpecialtyCode: </td> <td><input type="text" name="cpr3" size="20"> </td></tr>
<tr> <td> SpecialtyName: </td> <td><input type="text" name="cpr4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>



<form action="UpdateProvider" method="post">
<table><tr> <td> PRID: </td> <td><input type="text" name="upr0" size="20"> </td></tr>
<tr> <td> LicenseNum: </td>  <td><input type="text" name="upr1" size="20"> </td></tr>
<tr> <td> ProviderName: </td> <td><input type="text" name="upr2" size="20"> </td></tr>
<tr> <td> SpecialtyCode: </td> <td><input type="text" name="upr3" size="20"> </td></tr>
<tr> <td> SpecialtyName: </td> <td><input type="text" name="upr4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

<form action="DeleteProvider" method="post">
Delete(PRID) : <input type="text" name="dpr0" size="20"><input type="submit" value= "OK" />
</form>
<table width="100%" border="1">
<thead>
		<tr>
			<th>PRID</th>
			<th>LicenseNum</th>
			<th>ProviderName</th>
			<th>SpecialtyCode</th>
			<th>SpecialtyName</th>
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
			
			pstmt = conn.prepareStatement("select * from provider");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("prid") %></td>
			<td><%= rs.getString("LicenseNum") %></td>
			<td><%= rs.getString("ProviderName") %></td>
			<td><%= rs.getString("SpecialtyCode") %></td>
			<td><%= rs.getString("SpecialtyName") %></td>		
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