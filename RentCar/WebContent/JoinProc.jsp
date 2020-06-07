<%@page import="client.ClientDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JoinProc.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	
%>

<jsp:useBean id = "tbean" class = "client.ClientBean">
	<jsp:setProperty name = "tbean" property = "*" />
</jsp:useBean>

<%

	//회원 정보 db에 입력
	ClientDAO tdao = new ClientDAO();
	int result = tdao.ClientJoin(tbean);
	
	
	if(result > 0){
%>
	<script>
		alert("가입 되었습니다.");
		location.href="RentcarMain.jsp?center=Login.jsp";
	</script>

<%
	}else if(result == 0){
			
%>
	<script>
		alert("중복된 id 입니다.");
		location.href="RentcarMain.jsp?center=Join.jsp";
	</script>
<%
	}else{ 
		
%>
	<script>
		alert("가입에 실패하였습니다. 다시 시도해주세요.");
		location.href = "RentcarMain.jsp?center=Join.jsp"
	</script>
<%
	}
%>
</body>
</html>