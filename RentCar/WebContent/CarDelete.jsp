<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarDelete.jsp</title>
</head>
<body>

	<script>
		var result = confirm("삭제하시겠습니까?");
		if(result){
			
	<%	

			int no = Integer.parseInt(request.getParameter("no"));
			
			RentcarDAO rdao = new RentcarDAO();
			
			rdao.carReserveDelete(no);	
	%>
			alert("삭제되었습니다.");
			location.href="RentcarMain.jsp?center=CarReserveView.jsp";
		}
		else 
			history.go(-1);
	</script>
</body>
</html>