<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarBbsUpdateProc.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	

	//�����ϰ��� �ϴ� �Խñ� ��ȣ, ���� , ������ ������.
	int num = Integer.parseInt(request.getParameter("num"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	
	int result =0;
	BoardDAO ddao = new BoardDAO();
	result = ddao.updateBoard(num,subject,content);
	
	
	if(result > 0){
%>
	<script>
		alert("�����Ǿ����ϴ�.");
		location.href="RentcarMain.jsp?center=CarBbsInfo.jsp?num=<%=num%>";
	</script>

<%		
		
	}else{
%>
	<script>
		alert("������ ������ �����ϴ�. �ٽ� �������ּ���.");
		history.go(-1);
	</script>
<% 		
	}
%>
</body>
</html>