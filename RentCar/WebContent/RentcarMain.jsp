<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>RentcarMain page</title>
<style>
	table{
		text-align : center;
		
		height : 80%;
		margin : auto;
	}
</style>
</head>
<body>

	<%
		//���� �������� �Ź� �ٸ� �� �����Ƿ� ���� �Է¹޴´�.
		String center = request.getParameter("center");
		
		if(center == null){
			
			center = "Center.jsp";
			
		}
	%>

	<table width = "1000">
		<!--  Top page �κ� -->
		<tr height = "130">
			<td><jsp:include page="Top.jsp" /></td>
		</tr>
		<!--  center page �κ� -->
		<tr>
			<td><jsp:include page= "<%= center %>" /></td>
		</tr>
		<!--  Bottom page �κ� -->
		<tr height = "100">
			<td><jsp:include page="Bottom.jsp" /></td>
		</tr>
	</table>
	
	

</body>
</html> 