<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Encounter Create</title>
</head>
<body>
<form action="AddEncounter" method="post">
<table><tr> <td> EID: </td> <td><input type="text" name="ce0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ce1" size="20"> </td></tr>
<tr> <td> HID: </td>  <td><input type="text" name="ce2" size="20"> </td></tr>
<tr> <td> PRID: </td>  <td><input type="text" name="ce3" size="20"> </td></tr>
<tr> <td> AdmitDate: </td>  <td><input type="text" name="ce4" size="20"> </td></tr>
<tr> <td> EncounterType: </td>  <td><input type="text" name="ce5" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>