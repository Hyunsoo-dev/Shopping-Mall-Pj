<%@page import="info.InformationDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInformationUpdateProc.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	

	//�����ϰ��� �ϴ� �Խñ� ��ȣ, ���� , ������ ������.
	int num = Integer.parseInt(request.getParameter("num"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	
	int result =0;
	InformationDAO ndao = new InformationDAO();
	result = ndao.updateInformation(num,subject,content);
	
	
	if(result > 0){
%>
	<script>
		alert("�����Ǿ����ϴ�.");
		location.href="RentcarMain.jsp?center=CarInformation.jsp?num=<%=num%>";
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