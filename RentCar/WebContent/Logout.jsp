<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<script>
		var result = confirm("�α׾ƿ� �Ͻðڽ��ϱ�?");

		
			if(result){
		
			<%		
			session.invalidate();
			%>
			location.href = "RentcarMain.jsp";
			
			
			}else{
				history.go(-1);
			}	
			

		</script>

	
</body>
</html>