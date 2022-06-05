<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Medication</title>
</head>
<body>
Update Medication
<form action="UpdateMedication" method="post">
<table><tr> <td> MID: </td> <td><input type="text" name="um0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="um1" size="20"> </td></tr>
<tr> <td> MedicationName: </td> <td><input type="text" name="um2" size="20"> </td></tr>
<tr> <td> MedicationCode: </td> <td><input type="text" name="um3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>