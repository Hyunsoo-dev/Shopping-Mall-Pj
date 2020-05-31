<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LoginProc.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	
	
	int result = 0;//로그인 성공하면 1, 실패하면 0을 반환받기 위한 변수
	RentcarDAO rdao = new RentcarDAO();
	
	result = rdao.getLogin(id,pass);
	
	//로그인 실패 시
	if(result == 0){
%>
		<script>
			alert("로그인에 실패했습니다. 다시 로그인 해주세요.");
			history.go(-1);
		</script>
<%		
	//로그인 성공 시 
	}else{
		session.setAttribute("id", id);
		response.sendRedirect("RentcarMain.jsp");
		
	}
%>
</body>
</html>