<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Hospital</title>
</head>
<body>
Update Hospital
<form action="UpdateHospital" method="post">
<table><tr> <td> HID: </td> <td><input type="text" name="uh0" size="20"> </td></tr>
<tr> <td> HospitalName: </td>  <td><input type="text" name="uh1" size="20"> </td></tr>
<tr> <td> HospitalIdentifier: </td> <td><input type="text" name="uh2" size="20"> </td></tr>
<tr> <td> Address: </td> <td><input type="text" name="uh3" size="20"> </td></tr>
<tr> <td> PhoneNum: </td> <td><input type="text" name="uh4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>