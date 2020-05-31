<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarReserveComplete.jsp</title>
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
		
	}else{
		
		Date d1 = new Date();
		Date d2 = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//getRentDate() 로 얻어온 String 타입 데이터를 이용하여 date 객체 생성
		d1 = sdf.parse(rbean.getRentDate());//대여 날짜 
		d2 = sdf.parse(sdf.format(d2));//Date 를 "yyyy-MM-dd" 형태로 포맷해줌.
		
		int compare = d1.compareTo(d2);//d1이 작으면 -1, d2가 작으면 1반환
		if(compare == -1){
			
%>			

			<script>
				alert("현재 시스템 날짜보다 이전 날짜를 선택할 수 없음.");
				history.go(-1);
			</script>
			
<%
		}
	}
%>


</body>
</html>