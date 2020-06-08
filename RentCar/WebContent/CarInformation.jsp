<%@page import="info.InformationBean"%>
<%@page import="java.util.Vector"%>
<%@page import="info.InformationDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInfomation.jsp</title>
</head>
<body>
<%

/* 웹 사이트 상 고객센터 페이지 입니다.  
 *
 *
 *
 */
 
	String id = (String)session.getAttribute("id");

	if(id == null){
%>		
	<script>
		alert("로그인 후 이용하세요.")
		lcation.href ="RentcarMain.jsp?center=Lojin.jsp";
	</script>
<%		
		
	}
		
%>

	<table width = "1000">
		<tr height = "40">
			<th>글 번호</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>제목</th>	
		</tr>
<%		
		
		InformationDAO ndao = new InformationDAO();
		Vector<InformationBean> v = ndao.getAllInformation(); 
		
		for(int i = 0; i < v.size(); i++){
			InformationBean nbean = v.get(i);
%>
		<tr height = "40">
			<td><%= nbean.getNum() %></td>
			<td><%= nbean.getReg_date() %></td>
			<td><%= nbean.getId() %></td>
			
			<td>
				<a href="RentcarMain.jsp?center=CarInformationInfo.jsp?num=<%= nbean.getNum() %>" style = "text-decoration : none; color : powderblue;">
					<%= nbean.getSubject() %>
				</a>
			</td>	
			
			
		</tr>		
<%
		}
%>		
		<!--  글쓰기 버튼 부분 -->
		<tr height = "40">
			
			<td colspan = "4" align = "right">
			<button  onclick ="location.href='RentcarMain.jsp?center=CarInformationWrite.jsp'">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>