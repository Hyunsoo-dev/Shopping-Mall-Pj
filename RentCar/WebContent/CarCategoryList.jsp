<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarCategoryList page</title>

<style>
	table{
		text-align : center;
	}
</style>
</head>
<body>



<%
	int category = Integer.parseInt(request.getParameter("category")); 
	
	String temp = "";
	if(category == 1) 
		temp = "����";
	else if(category == 2)
		temp = "����";
	else 
		temp = "����";


	RentcarDAO rdao = new RentcarDAO();
	
	Vector<CarListBean> v = rdao.getCategoryCar(category);
%> 
	
	
	<table width = "1000">
			<tr height = "60">
				<td colspan ="3" align = "center"> <%= temp %> �ڵ���</td>
			</tr>
		<% 	
			int j = 0;
			
			for(int i = 0; i < v.size(); i++){
				CarListBean bean = v.get(i);
				
			//�ϳ��� row �� 3���� column�� �� �� �ְ� ����ϱ� ���� ����
			
				if(j%3 == 0){
		%>
		
					<tr height = "240">
		
		<% 
				}//ù��° if�� ��
		%>	
					<td width = "333" height = "240">
						<a href = "RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
							<img src = "img/<%= bean.getImg() %>" width = "300" height = "200"><br>
						</a>
						<div align = "center" >������: <%= bean.getName() %></div>
					</td>
			
		<%	
				
				j = j + 1;	
			} //for�� ��
		%>	
		
		
	</table>
</body>
</html>