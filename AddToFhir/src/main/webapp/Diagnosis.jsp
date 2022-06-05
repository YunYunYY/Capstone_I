<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Diagnosis Create</title>
</head>
<body>
<form action="AddDiagnosis" method="post">
<table><tr> <td> DID: </td> <td><input type="text" name="cd0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="cd1" size="20"> </td></tr>
<tr> <td> DiagnosisName: </td> <td><input type="text" name="cd2" size="20"> </td></tr>
<tr> <td> DiagnosisCode: </td> <td><input type="text" name="cd3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>