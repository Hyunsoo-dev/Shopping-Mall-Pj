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
	//게시글 번호를 가져옴.
	int num  = Integer.parseInt(request.getParameter("num"));

	BoardDAO ddao = new BoardDAO();
	BoardBean dbean = ddao.getOneBoard(num); 
	
	
%>

	<table width = "900" border = "1">
		<tr height = "40">
			<td width ="300">작성자</td>
			<td width ="600"><%=dbean.getId() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">이메일</td>
			<td width ="600"><%=dbean.getEmail() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">작성일</td>
			<td width ="600"><%=dbean.getReg_date() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">조회수</td>
			<td width ="600"><%=dbean.getReadcount() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">제목</td>
			<td width ="600"><%=dbean.getSubject() %></td>
		</tr>
		<tr height = "150">
			<td width ="300">글 내용</td>
			<td width ="600">
			
				<%= dbean.getContent() %>"
			
				
			</td>
		</tr>
		<tr height = "40">
			<td colspan = "2">
			
		<% 
			//작성자와 로그인 한 사람이 동일한 경우에만 수정, 삭제 버튼 보여줌.
			if(id.equals(dbean.getId())){
		%>
			
				<input type = "button" value = "수정" onclick = "location.href='RentcarMain.jsp?center=CarBbsUpdate.jsp?num=<%=num%>'">

				<input type = "button" value = "삭제" onclick = "location.href='RentcarMain.jsp?center=CarBbsDelete.jsp?num=<%=num%>'">
		<%
			}
		%>
				<input type = "button" value = "전체 글 목록 보기" onclick = "location.href='RentcarMain.jsp?center=CarBbs.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>