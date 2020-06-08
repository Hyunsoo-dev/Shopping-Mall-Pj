<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInformationWrite.jsp</title>
</head>
<body>
<%

/* 고객센터에서 글 작성 버튼 클릭 시 출력되는 페이지 입니다.
 *
 *
 *
 */
 
	String id = (String)session.getAttribute("id");

	if(id == null){
%>		
	<script>
		alert("로그인 후 이용하세요.")
		lcation.href ="RentcarMain.jsp?center=Login.jsp";
	</script>
<%		
		
	}
		
	
	
%>
	
	<form action="CarInformationWriteProc.jsp" method = "post">
		<table width = "700" border = "1">
			<tr height = "40">
				<td width = "200">작성자</td>
				<td width = "500"><%= id %></td>
			</tr>
			<tr height = "40">
				<td width = "200">제 목</td>
				<td width = "500"><input type = "text" name = "subject" size = "68"></td>
			</tr>
			<tr>
				<td width = "200">글 내용</td>
				<td width = "500"><textarea rows="20" cols="70" name = "content"></textarea></td>
			</tr>
			<tr height = "40">
				<td colspan = "2">
					<input type = "hidden" name = "id" value = "<%=id %>">
					<input type = "submit" value = "작성">
					<input type = "reset" value = "취소">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>