<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Top</title>

<style>

	/* top page 메뉴 버튼 스타일*/
	.top_menu {
	
		
		background-color:powderblue;
		font-size: 100%;
		text-align: center;
		
	}
	
	/* top page 메뉴 버튼 스타일*/
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

	<!-- 세션을 이용한 로그인 처리 -->
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
			<td width = "200" align = "center"> 
			<%= id  %>님
			<% 
				//GUEST 로 로그인된 경우 --> 로그인 버튼 생성함.
				if(id.equals("GUEST")){ 
			
			%>	
					<button onclick = "location.href='RentcarMain.jsp?center=Login.jsp'">로그인</button>
			<%
				}else{
			%>
					<button onclick = "location.href='RentcarMain.jsp?center=Logout.jsp'">로그아웃</button>			
			<%
					
				}
			%>
			</td>			
		</tr>
		<tr height = "50">
			<td class = "top_menu" width = "200" ><a href = "RentcarMain.jsp?center=CarReserveMain.jsp">예 약 하 기</a></td>
			<td class = "top_menu" width = "200" ><a href = "#" >예 약 확 인</a></td>
			<td class = "top_menu" width = "200" ><a href = "#" >자 유 게 시 판</a></td>
			<td class = "top_menu" width = "200" ><a href = "#" >이 벤 트</a></td>
			<td class = "top_menu" width = "200" ><a href = "#" >고 객 센 터</a></td>					
		</tr>
		
	</table>
	



</body>
</html>