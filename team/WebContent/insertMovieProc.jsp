<%@page import="movie.movieDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "ebean" class = "movie.movieBean">
	<jsp:setProperty name = "ebean" property = "*"/>
</jsp:useBean>
	
	<%
		movieDAO edao = new movieDAO();
		edao.setMovie(ebean);
	%>
</body>
</html>