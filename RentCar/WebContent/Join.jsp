<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Join.jsp</title>

<style type="text/css">

	h2{
		text-align : center;
	}
</style>
</head>
<body>

	
	<form action="JoinProc.jsp" method = "post">
		<h2>ȸ������</h2>
		<table width = "700" >
			<tr height = "60">
				<th width = "250">���̵�</th>
				<td width =" 450">
					<input type = "text" name = "id" size = "60">
				</td>
			</tr>
			<tr height = "60">
				<th width = "250">�̸�</th>
				<td width =" 450">
					<input type = "text" name = "name" size = "60">
				</td>
			</tr>
			<tr height = "60">
				<th width = "250">��й�ȣ</th>
				<td width =" 450">
					<input type = "password" name = "password" size = "60">
				</td>
			</tr>
			<tr height = "60">
				<th width = "250">�̸���</th>
				<td width =" 450">
					<input type = "email" name = "email" size = "60">
				</td>
			</tr>
			<tr height = "60">
				<td colspan = "2">
					<input type = "submit" value = "ȸ������">
					<input type = "reset" value = "���">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>