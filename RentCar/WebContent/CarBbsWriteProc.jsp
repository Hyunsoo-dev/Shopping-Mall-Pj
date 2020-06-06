<%@page import="client.ClientBean"%>
<%@page import="client.ClientDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarBbsWriteProc.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	

	//id , 제목, 글 내용 값 읽어옴.
	String id = request.getParameter("id");
	String subject = request.getParameter("subject");
	String content =  request.getParameter("content");
	
	//글쓰기 누른 회원의 회원정보 가져오기
	ClientDAO tdao = new ClientDAO();
	ClientBean tbean = tdao.getClientInfo(id);
	
	 
	
	BoardDAO dbao = new BoardDAO();
	dbao.boardWrite(id,subject,content, tbean);
	
	response.sendRedirect("RentcarMain.jsp?center=CarBbs.jsp");
%>


</body>
</html>