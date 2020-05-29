<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarReserveInfo page</title>

<style>
	table{
		text-align : center;
	}
</style>
</head>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no"));
	
		RentcarDAO rdao = new RentcarDAO();
		
		//�ϳ��� �ڵ��� ������ ������ ��.
		CarListBean bean = rdao.getOneCar(no);  
		
		int category = bean.getCategory();
		String temp = "";
		
		if(category == 1)
			temp = "����";
		else if(category == 2)
			temp = "����";
		else
			temp = "����";
	%>
	<form action="RentcarMain.jsp?center=CarOptionSelect.jsp" method = "post">
	<table width = "1000">
		<tr height = "60">
				<td colspan ="3">�ֽ��� �ڵ���</td>
		</tr>
		<tr>
			<td rowspan = "6" width = "500">
				<img src ="img/<%= bean.getImg() %>" width = "450" height = "500">
			</td>
			<td width = "250">���� �̸�</td>
			<td width = "250"><%= bean.getName() %></td>
		</tr>
		<tr>
			<td width = "250">���� ����</td>
			<td width = "250">
			<select name = "quantity">
				<option value = "1">1</option>
				<option value = "2">2</option>
				<option value = "3">3</option>
			</select>
			</td>
		</tr> 
		<tr>
			<td width = "250">���� �з�</td>
			<td width = "250"><%= temp %></td>
		</tr> 
		<tr>
			<td width = "250">�뿩 ����</td>
			<td width = "250"><%= bean.getPrice() %></td>
		</tr> 
		<tr>
			<td width = "250">���� ȸ��</td>
			<td width = "250"><%= bean.getCompany() %></td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<input type = "hidden" name = "no" value = "<%= bean.getNo() %>">
				<input type = "submit" value = "�ɼ� ���� �� ����">
			</td>
		</tr>
	</table>
	</form>
	
	<br>
	<br>
	<br>
	<p align = "center" >
		���� ���� ����<br>
		<%= bean.getInfo() %>
	<p>
	
	
</body>
</html>