<%@page import="java.util.Vector"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarBbs.jsp</title>
</head>
<body>

<%
	
	String id = (String)session.getAttribute("id");
	
	if(id == null){
	
		
%>	
	<script>
		alert("�α��� �� �̿����ּ���.");
		location.href = "Login.jsp";
	</script>
	
<% 	
	}
			
	//�Խ��� �� ��� ��������.
	BoardDAO ddao = new BoardDAO();
	
	Vector<BoardBean> v  = ddao.getAllList();
%>		

	<table width = "1000">
		<tr height = "40">
			<th>�� ��ȣ</th>		
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>����</th>
		</tr>
		
<% 	
		for(int i = 0; i < v.size(); i++){
			BoardBean dbean = v.get(i);
%>
		<tr height = "40">
			
			<td><%= dbean.getNum() %></td>
			<td><%= dbean.getReg_date() %></td>
			<td><%= dbean.getWriter() %></td>
			<td><%= dbean.getContent() %></td>
		</tr>
<%
		}
%>
				
		<!--  ī���� �κ� -->
		<tr height = "40">
			
			<td></td>
		</tr>
		
		<!--  �۾��� ��ư �κ� -->
		<tr height = "40">
			
			<td colspan = "4" align = "right">
			<button  onclick ="location.href='RentcarMain.jsp?center=CarBbsWrite.jsp'">�۾���</button>
			</td>
		</tr>
	</table>
	
		




</body>
</html>