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
	//게시글 번호를 가져옴.
	int num  = Integer.parseInt(request.getParameter("num"));
	
	 
	InformationDAO ndao = new InformationDAO();
	InformationBean nbean = ndao.getOneInformation(num);
	
%>



	<table width = "900" border = "1">
		<tr height = "40">
			<td width ="300">작성자</td>
			<td width ="600"><%=nbean.getId() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">이메일</td>
			<td width ="600"><%=nbean.getEmail() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">작성일</td>
			<td width ="600"><%=nbean.getReg_date() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">조회수</td>
			<td width ="600"><%=nbean.getReadcount() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">제목</td>
			<td width ="600"><%=nbean.getSubject() %></td>
		</tr>
		<tr height = "40">
			<td width ="300">글 내용</td>
			<td width ="600"><%= nbean.getContent() %></td>
		</tr>
		<tr height = "40">
			<td colspan = "2">
			
		<% 
			//작성자와 로그인 한 사람이 동일한 경우에만 수정, 삭제 버튼 보여줌.
			if(id.equals(nbean.getId())){
		%>
			
				<input type = "button" value = "수정" onclick = "location.href='RentcarMain.jsp?center=CarInformationUpdate.jsp?num=<%=num%>'">

				<input type = "button" value = "삭제" onclick = "location.href='RentcarMain.jsp?center=CarInformationDelete.jsp?num=<%=num%>'">
		<%
			}
		%>
				<input type = "button" value = "전체 글 목록 보기" onclick = "location.href='RentcarMain.jsp?center=CarInformation.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>