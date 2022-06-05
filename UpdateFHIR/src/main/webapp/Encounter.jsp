<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Encounter</title>
</head>
<body>
Update Encounter
<form action="UpdateEncounter" method="post">
<table><tr> <td> EID: </td> <td><input type="text" name="ue0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="ue1" size="20"> </td></tr>
<tr> <td> HID: </td>  <td><input type="text" name="ue2" size="20"> </td></tr>
<tr> <td> PRID: </td>  <td><input type="text" name="ue3" size="20"> </td></tr>
<tr> <td> AdmitDate: </td>  <td><input type="text" name="ue4" size="20"> </td></tr>
<tr> <td> EncounterType: </td>  <td><input type="text" name="ue5" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>