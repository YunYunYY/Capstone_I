<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Provider</title>
</head>
<body>
Update Provider
<form action="UpdateProvider" method="post">
<table><tr> <td> PRID: </td> <td><input type="text" name="upr0" size="20"> </td></tr>
<tr> <td> LicenseNum: </td>  <td><input type="text" name="upr1" size="20"> </td></tr>
<tr> <td> ProviderName: </td> <td><input type="text" name="upr2" size="20"> </td></tr>
<tr> <td> SpecialtyCode: </td> <td><input type="text" name="upr3" size="20"> </td></tr>
<tr> <td> SpecialtyName: </td> <td><input type="text" name="upr4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>