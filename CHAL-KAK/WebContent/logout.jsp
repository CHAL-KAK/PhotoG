<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<meta charset="EUC-KR">
<title>Logout</title>
</head>
<body>
<form class="form-compact" action="/CHAL-KAK">
	<div class="row paddingBottom20"
		style="margin: 50px 100px 100px 100px;">
		<div class="container ">
			<div class="row">
				<h4 class="text-center col-12 mb-0">Logout ID : <%=session.getAttribute("id")%></h4>
				<sub class="text-right text-muted col-12"><a href="#"
					tabindex="-1"><i class="far fa-edit"></i></a></sub>
			</div>
			<div class="dropdown-divider mb-3"></div>
			<%
				session.removeAttribute("login_user");
			%>
			<input style="background-color: #eff7f9;" type="submit"
				value="Home" class="form-control form-control-sm">
		</div>
	</div>
</form>
</body>
</html>