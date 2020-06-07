<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarBbsUpdateProc.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	

	//수정하고자 하는 게시글 번호, 제목 , 내용을 가져옴.
	int num = Integer.parseInt(request.getParameter("num"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	
	int result =0;
	BoardDAO ddao = new BoardDAO();
	result = ddao.updateBoard(num,subject,content);
	
	
	if(result > 0){
%>
	<script>
		alert("수정되었습니다.");
		location.href="RentcarMain.jsp?center=CarBbsInfo.jsp?num=<%=num%>";
	</script>

<%		
		
	}else{
%>
	<script>
		alert("수정된 사항이 없습니다. 다시 수정해주세요.");
		history.go(-1);
	</script>
<% 		
	}
%>
</body>
</html>