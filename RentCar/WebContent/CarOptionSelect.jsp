<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarOptionSelect.jsp</title>

<style>
	#selectOption{
		width : 140px;
		height :25px;
	}
	table{
		text-align : center;
	}
</style>

</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	
	String img = request.getParameter("img");
	
%>

<form action="RentcarMain.jsp?center=CarReserveComplete.jsp" method = "post">
<table width = "1000"> 
	<tr height = "60">
		<td colspan ="3"> �ɼ� ���� </td>
	</tr>
	<tr>
		<td rowspan = "7">
			<img src = "img/<%= img %>" width = "450" height = "500">
		</td>
		<td width = "250">�뿩�Ⱓ</td>
		<td width = "250">
						<select name = "rentDuration" id = "selectOption">
							<option value = "1">1��</option>
							<option value = "2">2��</option>
							<option value = "3">3��</option>
							<option value = "4">4��</option>
							<option value = "5">5��</option>
							<option value = "6">6��</option>
							<option value = "7">7��</option>
						</select>
		</td>
	</tr>
	<tr height = "60">
		<td width = "250">�뿩��</td>
		<td width = "250">
			<input id = "selectOption" type = "date" name = "rentDate" value = "2020-01-01" min = "2020-01-01" max = "2020-12-31">
			<!-- String Ÿ������ �����. -->
		</td>
	</tr>
	<tr height = "60">
		<td width = "250">���� ����</td>
		<td width = "250"><select name = "insurance" id = "selectOption">
							<option value = "1" selected>����(1�� 1����)</option>
							<option value = "2">������</option>
						  </select>
	</tr>
	<tr height = "60">
		<td width = "250">Wifi ����</td>
		<td width = "250"><select name = "wifi" id = "selectOption">
							<option value = "1" selected>����(1�� 1����)</option>
							<option value = "2">������</option>
						  </select>
	</tr>
	<tr height = "60">
		<td width = "250" >������̼� ����</td>
		<td width = "250"><select name = "navigation" id = "selectOption">
							<option value = "1" selected>����(����)</option>
							<option value = "2">������</option>
						  </select>
	</tr>
	<tr height = "60">
		<td width = "250">���̺��Ʈ ����</td>
		<td width = "250"><select name = "babySheet" id = "selectOption">
							<option value = "1" selected>����(1�� 1����)</option>
							<option value = "2">������</option>
						  </select>
	</tr>
	<tr height = "60">
		<td colspan = "2" width = "250" >
			<input type = "hidden" name = "no" value = "<%= no %>">
			<input type = "hidden" name = "quantity" value = "<%= quantity %>">
			<input type = "submit" value = "���� �����ϱ�">
		</td>
	</tr>
</table> 
</form>
</body>
</html>