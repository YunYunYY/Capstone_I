<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>