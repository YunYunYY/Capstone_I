<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
</body>
</html>