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
		<td colspan ="3"> 옵션 선택 </td>
	</tr>
	<tr>
		<td rowspan = "7">
			<img src = "img/<%= img %>" width = "450" height = "500">
		</td>
		<td width = "250">대여기간</td>
		<td width = "250">
						<select name = "rentDuration" id = "selectOption">
							<option value = "1">1일</option>
							<option value = "2">2일</option>
							<option value = "3">3일</option>
							<option value = "4">4일</option>
							<option value = "5">5일</option>
							<option value = "6">6일</option>
							<option value = "7">7일</option>
						</select>
		</td>
	</tr>
	<tr height = "60">
		<td width = "250">대여일</td>
		<td width = "250">
			<input id = "selectOption" type = "date" name = "rentDate" value = "2020-01-01" min = "2020-01-01" max = "2020-12-31">
			<!-- String 타입으로 저장됨. -->
		</td>
	</tr>
	<tr height = "60">
		<td width = "250">보험 적용</td>
		<td width = "250"><select name = "insurance" id = "selectOption">
							<option value = "1" selected>적용(1일 1만원)</option>
							<option value = "2">미적용</option>
						  </select>
	</tr>
	<tr height = "60">
		<td width = "250">Wifi 적용</td>
		<td width = "250"><select name = "wifi" id = "selectOption">
							<option value = "1" selected>적용(1일 1만원)</option>
							<option value = "2">미적용</option>
						  </select>
	</tr>
	<tr height = "60">
		<td width = "250" >내비게이션 적용</td>
		<td width = "250"><select name = "navigation" id = "selectOption">
							<option value = "1" selected>적용(무료)</option>
							<option value = "2">미적용</option>
						  </select>
	</tr>
	<tr height = "60">
		<td width = "250">베이비시트 적용</td>
		<td width = "250"><select name = "babySheet" id = "selectOption">
							<option value = "1" selected>적용(1일 1만원)</option>
							<option value = "2">미적용</option>
						  </select>
	</tr>
	<tr height = "60">
		<td colspan = "2" width = "250" >
			<input type = "hidden" name = "no" value = "<%= no %>">
			<input type = "hidden" name = "quantity" value = "<%= quantity %>">
			<input type = "submit" value = "차량 예약하기">
		</td>
	</tr>
</table> 
</form>
</body>
</html>