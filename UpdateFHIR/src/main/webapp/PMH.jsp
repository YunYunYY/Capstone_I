<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update PMH</title>
</head>
<body>
Update PMH
<form action="UpdatePMH" method="post">
<table><tr> <td> PMID: </td> <td><input type="text" name="upmh0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="upmh1" size="20"> </td></tr>
<tr> <td> MedicalType: </td> <td><input type="text" name="upmh2" size="20"> </td></tr>
<tr> <td> MedicalName: </td> <td><input type="text" name="upmh3" size="20"> </td></tr>
<tr> <td> MedicalCode: </td> <td><input type="text" name="upmh4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>