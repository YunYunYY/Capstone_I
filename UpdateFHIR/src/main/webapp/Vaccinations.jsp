<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Vaccinations</title>
</head>
<body>
Update Vaccinations
<form action="UpdateVaccinations" method="post">
<table><tr> <td> VID: </td> <td><input type="text" name="uv0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="uv1" size="20"> </td></tr>
<tr> <td> VaccineName: </td> <td><input type="text" name="uv2" size="20"> </td></tr>
<tr> <td> VaccineCode: </td> <td><input type="text" name="uv3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>