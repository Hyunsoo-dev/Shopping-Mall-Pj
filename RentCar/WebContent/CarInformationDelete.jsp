<%@page import="info.InformationDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInformationDelete.jsp</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>


	<script>
		var result2 = confirm("�����Ͻðڽ��ϱ�?");
		if(result2){
	
		<%
			InformationDAO ndao = new InformationDAO();
			
			
			//result ���� 0 �� ��� ���� �ȵ� ��.
			//result ���� 1 �� ��� ������ ��.
			int result = ndao.deleteInformation(num);
			
			if(result > 0){
		%>
		
			alert("�����Ǿ����ϴ�.");
			location.href = "RentcarMain.jsp?center=CarInformation.jsp";
			
		
		<%		
			}else{
				
		%>
	
			alert("�Խñ� ������ �����Ͽ����ϴ�. �ٽ� �õ����ּ���.");
			history.go(-1);
	
		<%	
			}	
		%>
		
			}else 
				history.go(-1);
	</script>	
	
</body>
</html>