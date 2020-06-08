<%@page import="info.InformationDAO"%>
<%@page import="client.ClientBean"%>
<%@page import="client.ClientDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInformationWriteProc.jsp</title>
</head>
<body>


	<%
		request.setCharacterEncoding("euc-kr");
			
		//id , 제목, 글 내용 값 읽어옴.
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String content =  request.getParameter("content");
		
		ClientDAO tdao = new ClientDAO();
		ClientBean tbean = tdao.getClientInfo(id);
		
		InformationDAO ndao = new InformationDAO();
		ndao.writeInformation(id, subject, content, tbean);
		
		
		response.sendRedirect("RentcarMain.jsp?center=CarInformation.jsp");
	%>
</body>
</html>