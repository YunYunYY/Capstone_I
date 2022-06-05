<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="AddVaccinations" method="post">
<table><tr> <td> VID: </td> <td><input type="text" name="cv0" size="20"> </td></tr>
<tr> <td> PID: </td>  <td><input type="text" name="cv1" size="20"> </td></tr>
<tr> <td> VaccineName: </td> <td><input type="text" name="cv2" size="20"> </td></tr>
<tr> <td> VaccineCode: </td> <td><input type="text" name="cv3" size="20"> </td></tr>
</table>
<input type="submit" value= "OK" />
</form>
</body>
</html>