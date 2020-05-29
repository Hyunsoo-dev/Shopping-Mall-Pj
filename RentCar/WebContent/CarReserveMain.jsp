<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarReserveMain page</title>
<style>
	table{
		text-align : center;
	}
</style>
</head>

<body>
	<!--  데이터 베이스에 연결하여 최신순 자동차 3개만 보여주는 데이터를 가져옴. -->
	<%
		RentcarDAO rdao = new RentcarDAO();
		
		//벡터를 이용하여 최신 자동차 3대를 저장
		Vector<CarListBean> v = rdao.getSelectCar(); 
	
	%>
		<table width = "1000">
			<tr height = "60">
				<td colspan ="3">최신형 자동차</td>
			</tr>
		
			<tr height = "240">
	<%
			for(int i = 0; i < v.size(); i++){
				CarListBean bean = v.get(i);	
			
	%>	
				<td width = "333" align = "center">
					<a href = "RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
						<img src = "img/<%=bean.getImg() %>" width = "300" height = "200">
					</a>
					<p>차량 명 : <%= bean.getName() %>
				</td>
	<%
			}	
	%>
			</tr>
			
		</table>
		
		<p align = "center">
			<font size = "5" color = "gray" ><b>차랑 검색 하기</b></font><br><br>
		</p>
		
		
	
		<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method = "post" align = "center">
			<font size = "5" color = "gray"><b>차랑 검색 하기</b></font>
			&nbsp;
			&nbsp;
			&nbsp;
		
			<select name = "category">
				<option value = "1">소형</option>
				<option value = "2">중형</option>
				<option value = "3">대형</option>				
			</select>
			&nbsp;
			&nbsp;
			&nbsp;
			<input type = "submit" value = "검색">
			&nbsp;
			&nbsp;	
			&nbsp;	
		 	
		</form>
			<button onclick = "location.href = 'RentcarMain.jsp?center=CarAllList.jsp'" align = "center">전체 검색</button>
	
</body>
</html>