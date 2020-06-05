<%@page import="db.CarViewBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarReserveView.jsp</title>

<style>
	table{
		margin : auto;
		width : 1200px;
		
		
	}
</style>
</head>
<body>
	
	<% 	
		//예약 확인 전 로그인이 되어있는지 확인.
		String id = (String)session.getAttribute("id");
		
	
		//로그인이 안되어 있다면
		if(id == null){
	%>
			<script>
				alert("로그인 후 이용해주세요.");
				location.href = "RentcarMain.jsp?center=Login.jsp";
			</script>
	
	<%		
			
		}
		//로그인이 되어있다면
		RentcarDAO rdao = new RentcarDAO();
		
		//해당 아이디가 예약하고 있는 데이터들을 가져옴.
		Vector<CarViewBean> v =   rdao.getAllview(id);
		
		
	%>
	
		<table>
			<tr height = "100">
				<td> 차량 예약 완료 화면 </td>
			</tr>
		</table>
		<table>
			<tr height = "100">
				<td width = "120">사진</td>
				<td width = "120">차량이름</td>
				<td width = "70">예약수량</td>
				<td width = "50">금액</td>
				<td width = "70">대여기간</td>
				<td width = "100">대여날짜</td>
				<td width = "110">탑승가능 인원</td>
				<td width = "50">보험</td>
				<td width = "50">WIFI</td>
				<td width = "90">내비게이션</td>
				<td width = "90">베이비시트</td>
				<td width = "100">제조회사</td>
				<td width = "75">비 고</td>
			</tr>
			
		<%
			for(int i = 0; i < v.size(); i++){
				CarViewBean cbean = v.get(i);
				
			
		%>
		
			<tr height = "130">
			<td width = "150"><img src = "img/<%=cbean.getImg()%>" width = "150" height = "100"></td>
				<td width = "120"><%=cbean.getName()%></td>
				<td width = "70"><%=cbean.getQuantity() %></td>
				<td width = "50"><%=cbean.getPrice() %></td>
				<td width = "70"><%=cbean.getRentDuration() %></td>
				<td width = "100"><%=cbean.getRentDate() %></td>
				<td width = "110"><%=cbean.getUsePeople() %></td>
				<td width = "50"><%=cbean.getInsurance() %></td>
				<td width = "50"><%=cbean.getWifi() %></td>
				<td width = "90"><%=cbean.getNavigation() %></td>
				<td width = "90"><%=cbean.getBabySheet() %></td>
				<td width = "100"><%=cbean.getCompany() %></td>
				<td width = "75"><input type = "button" value = "삭제" onclick ="location.href='CarDelete.jsp?no=<%= cbean.getNo()%>'"></td>
			</tr>	
		<%
			}
		%>	
		</table>
</body>
</html>