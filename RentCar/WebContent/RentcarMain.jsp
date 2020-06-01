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
		//센터 페이지가 매번 다를 수 있으므로 값을 입력받는다.
		String center = request.getParameter("center");
		
		if(center == null){
			
			center = "Center.jsp";
			
		}
	%>

	<table width = "1000">
		<!--  Top page 부분 -->
		<tr height = "130">
			<td><jsp:include page="Top.jsp" /></td>
		</tr>
		<!--  center page 부분 -->
		<tr>
			<td><jsp:include page= "<%= center %>" /></td>
		</tr>
		<!--  Bottom page 부분 -->
		<tr height = "100">
			<td><jsp:include page="Bottom.jsp" /></td>
		</tr>
	</table>
	
	

</body>
</html> 