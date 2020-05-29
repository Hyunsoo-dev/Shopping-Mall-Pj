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
		
		//하나의 자동차 정보만 가지고 옴.
		CarListBean bean = rdao.getOneCar(no);  
		
		int category = bean.getCategory();
		String temp = "";
		
		if(category == 1)
			temp = "소형";
		else if(category == 2)
			temp = "중형";
		else
			temp = "대형";
	%>
	<form action="RentcarMain.jsp?center=CarOptionSelect.jsp" method = "post">
	<table width = "1000">
		<tr height = "60">
				<td colspan ="3">최신형 자동차</td>
		</tr>
		<tr>
			<td rowspan = "6" width = "500">
				<img src ="img/<%= bean.getImg() %>" width = "450" height = "500">
			</td>
			<td width = "250">차량 이름</td>
			<td width = "250"><%= bean.getName() %></td>
		</tr>
		<tr>
			<td width = "250">차량 수량</td>
			<td width = "250">
			<select name = "quantity">
				<option value = "1">1</option>
				<option value = "2">2</option>
				<option value = "3">3</option>
			</select>
			</td>
		</tr> 
		<tr>
			<td width = "250">차량 분류</td>
			<td width = "250"><%= temp %></td>
		</tr> 
		<tr>
			<td width = "250">대여 가격</td>
			<td width = "250"><%= bean.getPrice() %></td>
		</tr> 
		<tr>
			<td width = "250">제조 회사</td>
			<td width = "250"><%= bean.getCompany() %></td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<input type = "hidden" name = "no" value = "<%= bean.getNo() %>">
				<input type = "submit" value = "옵션 선택 후 구입">
			</td>
		</tr>
	</table>
	</form>
	
	<br>
	<br>
	<br>
	<p align = "center" >
		차량 정보 보기<br>
		<%= bean.getInfo() %>
	<p>
	
	
</body>
</html>