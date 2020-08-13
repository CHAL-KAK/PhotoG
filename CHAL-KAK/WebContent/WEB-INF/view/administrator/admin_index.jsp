<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<title>main</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/one-page-wonder.min.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/CHAL-KAK/administratorSearch.ck">CHAL KAK</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navdrop"
						role="button" data-toggle="dropdown" data-hover="dropdown">User</a>
						<div class="dropdown-menu" aria-labelledby="navdrop">
							<a href="/CHAL-KAK/admin_model_list.ck" class="dropdown-item">Model</a>
							<a href="/CHAL-KAK/admin_photographer_list.ck"
								class="dropdown-item">Photographer</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="/CHAL-KAK/admin_board_list.ck">전체 게시글 확인</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/CHAL-KAK/logout.ck">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<img src="img/photo02.png" width="100%" height="100%"
		style="border: 1px solid #A9A9A9;">
<!-- 	<a href="admin_member_list.ck">전체 회원 확인</a> -->
<!-- 	<a href="admin_board_list.ck">전체 게시글 확인</a> -->
<!-- 	<a href='/CHAL-KAK/logout.ck'>로그아웃</a> -->
</body>
</html>