<%@page import="client.ClientDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JoinProc.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	
%>

<jsp:useBean id = "tbean" class = "client.ClientBean">
	<jsp:setProperty name = "tbean" property = "*" />
</jsp:useBean>

<%

	//ȸ�� ���� db�� �Է�
	ClientDAO tdao = new ClientDAO();
	int result = tdao.ClientJoin(tbean);
	
	
	if(result > 0){
%>
	<script>
		alert("���� �Ǿ����ϴ�.");
		location.href="RentcarMain.jsp?center=Login.jsp";
	</script>

<%
	}else if(result == 0){
			
%>
	<script>
		alert("�ߺ��� id �Դϴ�.");
		location.href="RentcarMain.jsp?center=Join.jsp";
	</script>
<%
	}else{ 
		
%>
	<script>
		alert("���Կ� �����Ͽ����ϴ�. �ٽ� �õ����ּ���.");
		location.href = "RentcarMain.jsp?center=Join.jsp"
	</script>
<%
	}
%>
</body>
</html>