<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
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
 
  <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="form.jsp">WATCHA</a>
      
      	
    	 <form action = "MovieList.jsp" method ="post">
            <div class="form-row">
              <div class="col-12 col-md-8">
                <input type="text" name="movieName" class="form-control">
              </div>
              <div class="col-12 col-md-4">
                <button type="submit" class="btn btn-primary">검색</button>
              </div>
            </div>
          </form>
      
      
      <a class="btn btn-primary" href="#">Sign In</a>
    </div>
  </nav>

</body>
</html>