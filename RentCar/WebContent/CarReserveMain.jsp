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
	<!--  ������ ���̽��� �����Ͽ� �ֽż� �ڵ��� 3���� �����ִ� �����͸� ������. -->
	<%
		RentcarDAO rdao = new RentcarDAO();
		
		//���͸� �̿��Ͽ� �ֽ� �ڵ��� 3�븦 ����
		Vector<CarListBean> v = rdao.getSelectCar(); 
	
	%>
		<table width = "1000">
			<tr height = "60">
				<td colspan ="3">�ֽ��� �ڵ���</td>
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
					<p>���� �� : <%= bean.getName() %>
				</td>
	<%
			}	
	%>
			</tr>
			
		</table>
		
		<p align = "center">
			<font size = "5" color = "gray" ><b>���� �˻� �ϱ�</b></font><br><br>
		</p>
		
		
	
		<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method = "post" align = "center">
			<font size = "5" color = "gray"><b>���� �˻� �ϱ�</b></font>
			&nbsp;
			&nbsp;
			&nbsp;
		
			<select name = "category">
				<option value = "1">����</option>
				<option value = "2">����</option>
				<option value = "3">����</option>				
			</select>
			&nbsp;
			&nbsp;
			&nbsp;
			<input type = "submit" value = "�˻�">
			&nbsp;
			&nbsp;	
			&nbsp;	
		 	
		</form>
			<button onclick = "location.href = 'RentcarMain.jsp?center=CarAllList.jsp'" align = "center">��ü �˻�</button>
	
</body>
</html>