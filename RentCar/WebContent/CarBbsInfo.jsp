<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarBbsInfo.jsp</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	//�Խñ� ��ȣ�� ������.
	int num  = Integer.parseInt(request.getParameter("num"));

	BoardDAO ddao = new BoardDAO();
	BoardBean dbean = ddao.getOneBoard(num); 
	
	
%>

	<table width = "900" border = "1">
		<tr height = "40">
			<td width ="300">�ۼ���</td>
			<td width ="600"><%=dbean.getId() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">�̸���</td>
			<td width ="600"><%=dbean.getEmail() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">�ۼ���</td>
			<td width ="600"><%=dbean.getReg_date() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">��ȸ��</td>
			<td width ="600"><%=dbean.getReadcount() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">����</td>
			<td width ="600"><%=dbean.getSubject() %></td>
		</tr>
		<tr height = "150">
			<td width ="300">�� ����</td>
			<td width ="600">
			
				<%= dbean.getContent() %>"
			
				
			</td>
		</tr>
		<tr height = "40">
			<td colspan = "2">
			
		<% 
			//�ۼ��ڿ� �α��� �� ����� ������ ��쿡�� ����, ���� ��ư ������.
			if(id.equals(dbean.getId())){
		%>
			
				<input type = "button" value = "����" onclick = "location.href='RentcarMain.jsp?center=CarBbsUpdate.jsp?num=<%=num%>'">

				<input type = "button" value = "����" onclick = "location.href='RentcarMain.jsp?center=CarBbsDelete.jsp?num=<%=num%>'">
		<%
			}
		%>
				<input type = "button" value = "��ü �� ��� ����" onclick = "location.href='RentcarMain.jsp?center=CarBbs.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>