<%@page import="info.InformationBean"%>
<%@page import="java.util.Vector"%>
<%@page import="info.InformationDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInfomation.jsp</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");

	if(id == null){
%>		
	<script>
		alert("�α��� �� �̿�")
		lcation.href ="RentcarMain.jsp?center=Lojin.jsp";
	</script>
<%		
		
	}
		
%>

	<table width = "1000">
		<tr height = "40">
			<th>�� ��ȣ</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>����</th>	
		</tr>
<%		
		
		InformationDAO ndao = new InformationDAO();
		Vector<InformationBean> v = ndao.getAllBoard(); 
		
		for(int i = 0; i < v.size(); i++){
			InformationBean nbean = v.get(i);
%>
		<tr height = "40">
			<th><%= nbean.getNum() %></th>
			<th><%= nbean.getReg_date() %></th>
			<th><%= nbean.getId() %></th>
			<th><%= nbean.getSubject() %></th>	
		</tr>		
<%
		}
%>		
	</table>
</body>
</html>