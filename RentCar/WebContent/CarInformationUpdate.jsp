<%@page import="info.InformationBean"%>
<%@page import="info.InformationDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInformationUpdate.jsp</title>
</head>
<body>

	<%

	String id = (String)session.getAttribute("id");
	//�Խñ� ��ȣ�� ������.
	int num = Integer.parseInt(request.getParameter("num"));
	
	InformationDAO ndao = new InformationDAO();
	InformationBean nbean = ndao.getOneInformation(num);
%>

<form action="CarInformationUpdateProc.jsp" method="post">
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
				<td width ="600"><input type = "text" value ="<%=nbean.getSubject() %>" name ="subject"></td>
			</tr>
			<tr height = "40">
				<td width ="300">�� ����</td>
				<td width ="600"><textarea rows="10" cols="100" name ="content"><%= nbean.getContent() %></textarea></td>
			</tr> 
			<tr height = "40">
				<td colspan = "2">
					<input type = "hidden" name ="num" value = "<%=num %>">
					<input type = "submit" value = "�����ϱ�">
					<input type = "reset" value = "���" onclick = "history.go(-1)">
					<input type = "button" value = "��ü �� ��� ����" onclick = "location.href='RentcarMain.jsp?center=CarInformation.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>