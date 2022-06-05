<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Allergy</title>
</head>

<body>
Update Allergy
<form action="UpdateAllergy" method="post">
<table><tr> <td> AID: </td> <td><input type="text" name="ua0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ua1" size="20"> </td></tr>
<tr> <td> Allergy Name: </td> <td><input type="text" name="ua2" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>