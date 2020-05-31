<%@page import="db.CarReserveBean"%>
<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarReserveComplete.jsp</title>

<style>
	table{
		text-align : center;
		
		height : 80%;
		margin : auto;
	}
</style>
</head>
<body>


<jsp:useBean id = "rbean" class = "db.CarReserveBean">
	<jsp:setProperty name = "rbean" property = "*" />
</jsp:useBean>


<%
	request.setCharacterEncoding("euc-kr");

	String id = (String)session.getAttribute("id");	
	if(id==null){
%>		

		<script>
			alert("로그인 후 예약이 가능합니다.");
			location.href = "RentcarMain.jsp?center=Login.jsp";
		</script>
<%
		
	}
		
		Date d1 = new Date();
		Date d2 = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//parse method --> getRentDate() 로 얻어온 String 타입 데이터를 이용하여 date 객체 생성
		d1 = sdf.parse(rbean.getRentDate());//대여 날짜 
		d2 = sdf.parse(sdf.format(d2));//format method --> Date 를 "yyyy-MM-dd" 형태로 포맷해줌.
		
		int compare = d1.compareTo(d2);//d1이 작으면 -1, d2가 작으면 1반환
		if(compare == -1){
			
%>			

			<script>
				alert("현재 시스템 날짜보다 이전 날짜를 선택할 수 없음.");
				history.go(-1);
			</script>
			
<%
		}
		
		//결과적으로 아무 문제가 없다면 데이터 저장 후 결과 페이지 보여주기
		//아이디 값이 빈클래스에 없기에 
		rbean.setId(id);
		
		RentcarDAO rdao = new RentcarDAO();
		rdao.setReserve(rbean); 
		
		
		
		CarListBean bean = rdao.getOneCar(rbean.getNo());
		String img = bean.getImg();
		
		
		//차량 총 예약금액 
		int totalReservePrice = 0;
		totalReservePrice = bean.getPrice() * rbean.getQuantity();
		
		/* 옵션 값들을 적용한다면 데이터베이스에 "1" 값이 들어가므로 "1"일 때
		10000 값을 지닌 변수를 만들어준다. */
		
		
		int insurance = 0;
		if(rbean.getInsurance() == 1) insurance = 10000;
		
		
		int Navigation = 0; 
		if(rbean.getNavigation() == 1) Navigation = 10000;
		
		int BabySheet = 0;
		if(rbean.getBabySheet() == 1) BabySheet = 10000;
		
		//차량 옵션 총 금액 
		int totalOptionPrice = 0;
		totalOptionPrice = rbean.getRentDuration() * rbean.getQuantity() * (insurance + Navigation + BabySheet);
		
		//차량 총 금액 
		int totalPrice = totalReservePrice + totalOptionPrice;
%>
<table width = "1000">
	<tr height = "30">
		<td colspan = "2"> 차량 예약 완료 화면 </td>
	</tr>
	<tr height = "200">
		<td colspan = "2"><img src = "img/<%=img %>" width = "600" height = "400"></td>
	</tr>
	<tr height = "30">
		<td width = "500" align = "right">차량 총 예약 금액 :&nbsp;&nbsp; </td>
		<td width = "500" align = "left"> &nbsp;&nbsp;<%= totalReservePrice %></td>
	</tr>
	<tr height = "30">
		<td width = "500" align = "right">차량 총 옵션 금액 :&nbsp;&nbsp;</td>
		<td width = "500" align = "left"> &nbsp;&nbsp;<%= totalOptionPrice %></td>
		
	</tr>
	<tr height = "30">
		<td width = "500" align = "right">차량 총 금액 :&nbsp;&nbsp;</td>
		<td width = "500" align = "left"> &nbsp;&nbsp;<%= totalPrice %></td>
		
	</tr>
</table>


</body>
</html>