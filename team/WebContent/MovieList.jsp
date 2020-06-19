<%@page import="movie.movieBean"%>
<%@page import="java.util.Vector"%>
<%@page import="movie.movieDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Top.jsp" />

</head>
<body>


<%
//�˻��� ��ȭ �̸� �������� 
	request.setCharacterEncoding("euc-kr");

	String movieName = request.getParameter("movieName").trim(); 
	if(movieName == null || movieName.length() == 0){
		
%>
	<script>
		alert("�˻�� �Է��ϼ���.");
		location.href = "form.jsp";
	</script>
<% 
	
	}
%>
	 
	
   <!--  <header class="masthead text-white text-center">
  <div class="overlay"></div>-->
	
	
	<section>
	<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
		<ul class="navbar-nav">
		    <li class="nav-item active">
		      <a class="nav-link" href="#">���� �˻� ���</a>
		    </li>
		</ul>
			
	</nav>
	
	
	<table>	
	<%
			movieDAO edao = new movieDAO();
			Vector<movieBean> v = edao.getMovieList(movieName);
		
		for(int i = 0; i < v.size(); i++){
			if(i == 7) {			
				break;
			}
			movieBean ebean = v.get(i);
	%>
		
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class = "text-info">
					<a href ="bbs.jsp?movieName=<%=movieName%>">
						<img src = "img/<%= ebean.getImg()%>" height ="200" width = "140">	<br>
					</a>	
						
					<%= ebean.getName1()%><br>
					<%= ebean.getMakingYear() %>
				</td>
				
	<%
			}
	%>
			
			<p align ="right">
				<a href="MovieListMore.jsp?movieName=<%= movieName%>" data-toggle="tooltip" title="more">�� ����</a>
			</p>
			
	</table>
	<hr size="1px" color="gray">
	
	</section> 	
	
	
	<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
		<ul class="navbar-nav">
		    <li class="nav-item active">
		      <a class="nav-link" href="#">��ȭ</a>
		    </li>
		</ul>
			
	</nav>
	<table>
		<%
		for(int i = 0; i < v.size(); i++){
			
			if(i!=0 && i%3==0) {			
		%>
		
			<tr height="20"></tr>
			
		<%		
			}
			
			movieBean ebean = v.get(i);
		%>
		
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
					<a href ="#?movieName=<%=movieName%>">
						<img src = "img/<%= ebean.getImg()%>" height ="80" width = "100"><br>
					</a>
				</td>
				<td width = "200" align = "center" class = "text-info">
					<%= ebean.getName1()%><br>
					<%= ebean.getMakingYear() %><br>
					
				</td>
				
				
						
				
			
		<%
			}
		%>
		<p align ="right">
				<a href="MovieListMore.jsp?movieName=<%= movieName%>" data-toggle="tooltip" title="more">�� ����</a>
		</p>
		
	</table>
	
   <!-- </header> -->
  <!-- Bootstrap core JavaScript -->
 <!--  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

	<hr size="1px" color="gray">
<jsp:include page="Bottom.jsp" />
</body>
</html>