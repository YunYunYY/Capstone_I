<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>PMH Create</title>
</head>
<body>
<form action="AddPMH" method="post">
<table><tr> <td> PMID: </td> <td><input type="text" name="cpmh0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="cpmh1" size="20"> </td></tr>
<tr> <td> MedicalType: </td> <td><input type="text" name="cpmh2" size="20"> </td></tr>
<tr> <td> MedicalName: </td> <td><input type="text" name="cpmh3" size="20"> </td></tr>
<tr> <td> MedicalCode: </td> <td><input type="text" name="cpmh4" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>