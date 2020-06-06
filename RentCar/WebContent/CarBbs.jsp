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
		alert("로그인 후 이용해주세요.");
		location.href = "Login.jsp";
	</script>
	
<% 	
	}
			
	//게시판 글 목록 가져오기.
	BoardDAO ddao = new BoardDAO();
	
	Vector<BoardBean> v  = ddao.getAllList();
%>		

	<table width = "1000">
		<tr height = "40">
			<th>글 번호</th>		
			<th>작성일</th>
			<th>작성자</th>
			<th>제목</th>
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
				
		<!--  카운팅 부분 -->
		<tr height = "40">
			
			<td></td>
		</tr>
		
		<!--  글쓰기 버튼 부분 -->
		<tr height = "40">
			
			<td colspan = "4" align = "right">
			<button  onclick ="location.href='RentcarMain.jsp?center=CarBbsWrite.jsp'">글쓰기</button>
			</td>
		</tr>
	</table>
	
		




</body>
</html>