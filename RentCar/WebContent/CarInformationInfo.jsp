<%@page import="info.InformationDAO"%>
<%@page import="info.InformationBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInformationInfo.jsp</title>
</head>
<body>
<%

	String id = (String)session.getAttribute("id");
	//�Խñ� ��ȣ�� ������.
	int num  = Integer.parseInt(request.getParameter("num"));
	
	 
	InformationDAO ndao = new InformationDAO();
	InformationBean nbean = ndao.getOneInformation(num);
	
%>



	<table width = "900" border = "1">
		<tr height = "40">
			<td width ="300">�ۼ���</td>
			<td width ="600"><%=nbean.getId() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">�̸���</td>
			<td width ="600"><%=nbean.getEmail() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">�ۼ���</td>
			<td width ="600"><%=nbean.getReg_date() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">��ȸ��</td>
			<td width ="600"><%=nbean.getReadcount() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">����</td>
			<td width ="600"><%=nbean.getSubject() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">�� ����</td>
			<td width ="600"><%= nbean.getContent() %></td>
		</tr>
		<tr height = "40">
			<td colspan = "2">
			
		<% 
			//�ۼ��ڿ� �α��� �� ����� ������ ��쿡�� ����, ���� ��ư ������.
			if(id.equals(nbean.getId())){
		%>
			
				<input type = "button" value = "����" onclick = "location.href='RentcarMain.jsp?center=CarInformationUpdate.jsp?num=<%=num%>'">

				<input type = "button" value = "����" onclick = "location.href='RentcarMain.jsp?center=CarInformationDelete.jsp?num=<%=num%>'">
		<%
			}
		%>
				<input type = "button" value = "��ü �� ��� ����" onclick = "location.href='RentcarMain.jsp?center=CarInformation.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>