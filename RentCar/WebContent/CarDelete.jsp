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
		var result = confirm("�����Ͻðڽ��ϱ�?");
		if(result){
			
	<%	

			int no = Integer.parseInt(request.getParameter("no"));
			
			RentcarDAO rdao = new RentcarDAO();
			
			rdao.carReserveDelete(no);	
	%>
			alert("�����Ǿ����ϴ�.");
			location.href="RentcarMain.jsp?center=CarReserveView.jsp";
		}
		else 
			history.go(-1);
	</script>
</body>
</html>