<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Medication Create</title>
</head>
<body>
<form action="AddMedication" method="post">
<table><tr> <td> MID: </td> <td><input type="text" name="cm0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="cm1" size="20"> </td></tr>
<tr> <td> MedicationName: </td> <td><input type="text" name="cm2" size="20"> </td></tr>
<tr> <td> MedicationCode: </td> <td><input type="text" name="cm3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>