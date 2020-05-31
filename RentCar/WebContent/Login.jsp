<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login.jsp</title>

<style>
	table{
		
		height : 100%;
		margin : auto;
		text-align : center;
		
	}
</style>

</head>
<body>

<form action="LoginProc.jsp" method = "post">
<table width = "300">
	<tr height = "50">
		<td width = "120"> 아이디 </td>
		<td width = "180">
			<input type = "text" name = "id" size = "20"> 
		</td>
	</tr>
	<tr height = "50">	
		<td width = "120"> 비밀번호 </td>
		<td width = "180">
			<input type = "password" name = "password" size = "20"> 
		</td>
	</tr>
	<tr height = "50">
		<td colspan = "2">
			<input type = "submit" value = "로그인">
		</td>
	</tr>
</table>
</form>

</body>
</html>