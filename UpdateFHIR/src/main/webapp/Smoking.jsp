<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Smoking</title>
</head>
<body>
Update Smoking
<form action="UpdateSmoking" method="post">
<table><tr> <td> SMID: </td> <td><input type="text" name="us0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="us1" size="20"> </td></tr>
<tr> <td> SmokingStatus: </td> <td><input type="text" name="us2" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>