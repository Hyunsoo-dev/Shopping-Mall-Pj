<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <meta name = "viewport" content ="width=dvice=width",initial-scale='1'> 	
  <meta charset="UTF-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Landing Page - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="css/landing-page.min.css" rel="stylesheet">
		
	<title>전시포유</title>

</head>
<body>
	<%
		String center = request.getParameter("center");
		if(center == null){
			center = "Center.jsp";
		}
		
		//검색한 영화 이름 가져오기 
		String movieName = request.getParameter("movieName");
	%>
	
	
	 <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="#">WATCHA</a>
      <a class="btn btn-primary" href="#">Sign In</a>
    </div>
  </nav>
   <header class="masthead text-white text-center">
    <div class="overlay"></div>
	<div>영화 정보 입력</div>
	
	<form action="insertMovieProc.jsp" method = "get">
		<table>
			<tr>
				<td>영화이름</td>
				<td><input type = "text" name = "name1"></td>
			</tr>
			<tr>
				<td>제작년도</td>
				<td><input type = "text" name = "makingYear"></td>
			</tr>
			
			
		</table>
	</form>
	
</body>
</html>