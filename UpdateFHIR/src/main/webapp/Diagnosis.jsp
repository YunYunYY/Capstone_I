<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Diagnosis</title>
</head>
<body>
Update Diagnosis
<form action="UpdateDiagnosis" method="post">
<table><tr> <td> DID: </td> <td><input type="text" name="ud0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ud1" size="20"> </td></tr>
<tr> <td> Diagnosis Name: </td> <td><input type="text" name="ud2" size="20"> </td></tr>
<tr> <td> Diagnosis Code: </td> <td><input type="text" name="ud3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>