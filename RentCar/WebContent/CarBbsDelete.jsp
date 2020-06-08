<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarBbsDelete.jsp</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
	<script>
		var result2 = confirm("삭제하시겠습니까?");
		if(result2){
	
		<%
			BoardDAO ddao = new BoardDAO();
			
			
			//result 값이 0 인 경우 삭제 안된 것.
			//result 값이 1 인 경우 삭제된 것.
			int result = ddao.deleteBoard(num);
			
			if(result > 0){
		%>
		
			alert("삭제되었습니다.");
			location.href = "RentcarMain.jsp?center=CarBbs.jsp";
			
		
		<%		
			}else{
				
		%>
	
			alert("게시글 삭제에 실패하였습니다. 다시 시도해주세요.");
			history.go(-1);
	
		<%	
			}	
		%>
		
			}else 
				history.go(-1);
	</script>	
	
	


</body>
</html>