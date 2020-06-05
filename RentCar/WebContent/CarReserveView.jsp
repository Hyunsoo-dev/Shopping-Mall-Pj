<%@page import="db.CarViewBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarReserveView.jsp</title>

<style>
	table{
		margin : auto;
		width : 1200px;
		
		
	}
</style>
</head>
<body>
	
	<% 	
		//���� Ȯ�� �� �α����� �Ǿ��ִ��� Ȯ��.
		String id = (String)session.getAttribute("id");
		
	
		//�α����� �ȵǾ� �ִٸ�
		if(id == null){
	%>
			<script>
				alert("�α��� �� �̿����ּ���.");
				location.href = "RentcarMain.jsp?center=Login.jsp";
			</script>
	
	<%		
			
		}
		//�α����� �Ǿ��ִٸ�
		RentcarDAO rdao = new RentcarDAO();
		
		//�ش� ���̵� �����ϰ� �ִ� �����͵��� ������.
		Vector<CarViewBean> v =   rdao.getAllview(id);
		
		
	%>
	
		<table>
			<tr height = "100">
				<td> ���� ���� �Ϸ� ȭ�� </td>
			</tr>
		</table>
		<table>
			<tr height = "100">
				<td width = "120">����</td>
				<td width = "120">�����̸�</td>
				<td width = "70">�������</td>
				<td width = "50">�ݾ�</td>
				<td width = "70">�뿩�Ⱓ</td>
				<td width = "100">�뿩��¥</td>
				<td width = "110">ž�°��� �ο�</td>
				<td width = "50">����</td>
				<td width = "50">WIFI</td>
				<td width = "90">������̼�</td>
				<td width = "90">���̺��Ʈ</td>
				<td width = "100">����ȸ��</td>
				<td width = "75">�� ��</td>
			</tr>
			
		<%
			for(int i = 0; i < v.size(); i++){
				CarViewBean cbean = v.get(i);
				
			
		%>
		
			<tr height = "130">
			<td width = "150"><img src = "img/<%=cbean.getImg()%>" width = "150" height = "100"></td>
				<td width = "120"><%=cbean.getName()%></td>
				<td width = "70"><%=cbean.getQuantity() %></td>
				<td width = "50"><%=cbean.getPrice() %></td>
				<td width = "70"><%=cbean.getRentDuration() %></td>
				<td width = "100"><%=cbean.getRentDate() %></td>
				<td width = "110"><%=cbean.getUsePeople() %></td>
				<td width = "50"><%=cbean.getInsurance() %></td>
				<td width = "50"><%=cbean.getWifi() %></td>
				<td width = "90"><%=cbean.getNavigation() %></td>
				<td width = "90"><%=cbean.getBabySheet() %></td>
				<td width = "100"><%=cbean.getCompany() %></td>
				<td width = "75"><input type = "button" value = "����" onclick ="location.href='CarDelete.jsp?no=<%= cbean.getNo()%>'"></td>
			</tr>	
		<%
			}
		%>	
		</table>
</body>
</html>