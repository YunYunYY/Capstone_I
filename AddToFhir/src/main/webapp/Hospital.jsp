<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hospital Create</title>
</head>
<body>
<form action="AddHospital" method="post">
<table><tr> <td> HID: </td> <td><input type="text" name="ch0" size="20"> </td></tr>
<tr> <td> HospitalName: </td>  <td><input type="text" name="ch1" size="20"> </td></tr>
<tr> <td> HospitalIdentifier: </td> <td><input type="text" name="ch2" size="20"> </td></tr>
<tr> <td> Address: </td> <td><input type="text" name="ch3" size="20"> </td></tr>
<tr> <td> PhoneNum: </td> <td><input type="text" name="ch4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>