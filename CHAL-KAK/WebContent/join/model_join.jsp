<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.register {
	background: -webkit-linear-gradient(left, #3931af, #00c6ff);
	margin-top: 7%;
	padding: 3%;
}

.register-left {
	text-align: center;
	color: #fff;
	margin-top: 4%;
}

.register-left input {
	border: none;
	border-radius: 1.5rem;
	padding: 2%;
	width: 60%;
	background: #f8f9fa;
	font-weight: bold;
	color: #383d41;
	margin-top: 30%;
	margin-bottom: 3%;
	cursor: pointer;
}

.register-right {
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0
		rgba(0, 0, 0, .19);
	background: rgba(0, 0, 0, 0.5);
	/* 	background: #f8f9fa; */
	border-top-left-radius: 10% 50%;
	border-bottom-left-radius: 10% 50%;
}

.register-left img {
	margin-top: 15%;
	margin-bottom: 5%;
	width: 25%;
	-webkit-animation: mover 2s infinite alternate;
	animation: mover 1s infinite alternate;
}

@
-webkit-keyframes mover { 0% {
	transform: translateY(0);
}

100






%
{
transform






:






translateY




(






-20px






)




;
}
}
@
keyframes mover { 0% {
	transform: translateY(0);
}

100






%
{
transform






:






translateY




(






-20px






)




;
}
}
.register-left p {
	font-weight: lighter;
	padding: 12%;
	margin-top: -9%;
}

.register .register-form {
	padding: 10%;
	margin-top: 10%;
}

.btnRegister {
	float: right;
	margin-top: 10%;
	border: none;
	border-radius: 1.5rem;
	padding: 2%;
	background: #0062cc;
	color: #fff;
	font-weight: 600;
	width: 30%;
	cursor: pointer;
}

.register .nav-tabs {
	margin-top: 3%;
	border: none;
	background: #0062cc;
	border-radius: 1.5rem;
	width: 32%;
	float: right;
}

.register .nav-tabs .nav-link {
	padding: 2%;
	height: 34px;
	font-weight: 600;
	font-size: 1rem;
	color: #fff;
	border-top-right-radius: 1.5rem;
	border-bottom-right-radius: 1.5rem;
}

.register .nav-tabs .nav-link:hover {
	border: none;
}

.register .nav-tabs .nav-link.active {
	/* 	width: 100px; */
	color: #0062cc;
	border: 2px solid #0062cc;
	border-top-left-radius: 1.5rem;
	border-bottom-left-radius: 1.5rem;
}

.register-heading {
	text-align: center;
	margin-top: 8%;
	margin-bottom: -15%;
	color: white;
}

.common {
	display: inline-block;
	width: 120px;
}

.common2 {
	width: 200px;
}
</style>
<title>Model_Join</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#idcheck').click(function() {
			var id = document.join.id.value;
			$.ajax({
				url : "/CHAL-KAK/id_check.ck",
				type : "POST",
				data : {
					id : id
				},
				success : function(res) {
					if (res == 1) {
						console.log(res);
						$('#idresult').html('사용가능한 ID 입니다.');
						$('#idresult').addClass('mb-3');
					} else if (res == 0) {
						console.log(res);
						$('#idresult').html('이미 존재하는 ID 입니다.');
						$('#idresult').addClass('mb-3');
					}

				},
				error : function(ret) {
					console.log(ret);
				},
				dataType : "text"
			});

		});
	});
</script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
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
<link href="/CHAL-KAK/css/one-page-wonder.min.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%
		String path = application.getContextPath();
	%>
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/CHAL-KAK/index.jsp">CHAL KAK</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="/CHAL-KAK/noticeboard/notice_board.jsp">board</a>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navdrop"
						role="button" data-toggle="dropdown" data-hover="dropdown">Sign
							Up</a>
						<div class="dropdown-menu" aria-labelledby="navdrop">
							<a href="/CHAL-KAK/join/photographer_join.jsp"
								class="dropdown-item">Photographer</a>
						</div></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navdrop"
						role="button" data-toggle="dropdown" data-hover="dropdown">Log
							In</a>
						<div class="dropdown-menu" aria-labelledby="navdrop">
							<a href="/CHAL-KAK/login/model_login.jsp" class="dropdown-item">Model</a>
							<a href="/CHAL-KAK/login/photographer_login.jsp"
								class="dropdown-item">Photographer</a> <a
								href="/CHAL-KAK/login/administrator_login.jsp"
								class="dropdown-item">Administrator</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
	<form method="post" action="/CHAL-KAK/modeljoin.ck" name="join">
		<div class="container register">
			<div class="row">
				<div class="col-md-3 register-left">
					<img src="/CHAL-KAK/img/camera.png" alt="" />
					<h3>Welcome</h3>
					<p>
						Picture On Life<br>Picture Of Life
					</p>
				</div>
				<div class="col-md-9 register-right">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">

						<h3 class="register-heading">Model Join</h3>
						<div class="row register-form">

							<div class="col-md-12">
								<div class="form-group row my-1 mb-1" style="padding: 3%">
									<input type="text" name="m_id" id="id"
										class="form-control col-sm-9" placeholder="ID" /> <input
										type="button" id="idcheck" value="중복체크" class="btn col-sm-3"
										style="background: #0062cc; color: #fff;" />
								</div>
								<div>
									<div style="color: white;" id="idresult"></div>
								</div>
								<div class="form-group">
									<input type="password" name="m_password" class="form-control"
										placeholder="password" />
								</div>
								<div class="form-group">
									<input type="text" name="m_name" class="form-control"
										placeholder="name" value="" />
								</div>

								<div class="form-group">
									<div class="maxl" style="color: white;">
										<label class="radio inline"> <input type="radio"
											name="m_gender" value="M" id="r0" checked> <span>
												Male </span>
										</label> <label class="radio inline"> <input type="radio"
											name="m_gender" value="F" id="r1"> <span>Female
										</span>
										</label>
									</div>
								</div>
								<div class="form-group">
									<h6 style="color: white;">Birth</h6>
									<input type="date" name="m_bday" class="form-control"
										placeholder="Birth" />
								</div>
								<div class="form-group">
									<input type="text" name="m_ka_id" class="form-control"
										placeholder="kakao ID" />
								</div>

								<input type="submit" class="btnRegister" value="Register" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>