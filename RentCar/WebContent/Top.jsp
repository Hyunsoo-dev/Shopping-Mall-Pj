<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Top</title>

<style>

	/* top page �޴� ��ư ��Ÿ��*/
	.top_menu {
	
		
		background-color:red;
		font-size: 100%;
		text-align: center;
		
	}
	
	/* top page �޴� ��ư ��Ÿ��*/
	a{  
		color : white; 
		text-decoration: none;
	}
	

	table{
		text-align : center;
	}
	#logo{
		text-align :left;
	}
</style>
</head>
<body>

	<!-- ������ �̿��� �α��� ó�� -->
	<%
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			id = "GUEST";
		}
	%>
	
	<table width = "1000">
		<tr height = "70">
			<td id = "logo" colspan = "4">
				<a href = "RentcarMain.jsp" style = "text-decoration:none;">
					<img src = "img/amazoncar.png">
				</a>
			</td>
			<td width = "200" align = "center"> <%= id  %> �� �ݰ����ϴ�.</td>			
		</tr>
		<tr height = "50">
			<td class = "top_menu" width = "200" ><a href = "RentcarMain.jsp?center=CarReserveMain.jsp">�� �� �� ��</a></td>
			<td class = "top_menu" width = "200" ><a href = "#" >�� �� Ȯ ��</a></td>
			<td class = "top_menu" width = "200" ><a href = "#" >�� �� �� �� ��</a></td>
			<td class = "top_menu" width = "200" ><a href = "#" >�� �� Ʈ</a></td>
			<td class = "top_menu" width = "200" ><a href = "#" >�� �� �� ��</a></td>					
		</tr>
		
	</table>
	



</body>
</html>