<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Patient</title>
</head>
<body>
<form action="UpdatePatient" method="post">
Update
<table><tr> <td> PID: </td> <td><input type="text" name="up0" size="20"> </td></tr>
<tr> <td> Last Name: </td>  <td><input type="text" name="up1" size="20"> </td></tr>
<tr> <td> First Name: </td> <td><input type="text" name="up2" size="20"> </td></tr>
<tr> <td> Date-of-Birth: </td> <td><input type="text" name="up3" size="20"> </td></tr>
<tr> <td> Gender: </td> <td><input type="text" name="up4" size="20"> </td></tr>
<tr> <td> Address: </td> <td><input type="text" name="up5" size="20"> </td></tr>
<tr> <td> Phone Number: </td> <td><input type="text" name="up6" size="20"> </td></tr>
<tr> <td> City: </td> <td><input type="text" name="up7" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>

</body>
</html>