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
	
	
	int result = 0;//�α��� �����ϸ� 1, �����ϸ� 0�� ��ȯ�ޱ� ���� ����
	RentcarDAO rdao = new RentcarDAO();
	
	result = rdao.getLogin(id,pass);
	
	//�α��� ���� ��
	if(result == 0){
%>
		<script>
			alert("�α��ο� �����߽��ϴ�. �ٽ� �α��� ���ּ���.");
			history.go(-1);
		</script>
<%		
	//�α��� ���� �� 
	}else{
		session.setAttribute("id", id);
		response.sendRedirect("RentcarMain.jsp");
		
	}
%>
</body>
</html>