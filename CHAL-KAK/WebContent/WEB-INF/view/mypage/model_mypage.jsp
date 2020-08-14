<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>모델 마이페이지</title>
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
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/CHAL-KAK/index.jsp">CHAL KAK
				${sessionScope.login_user.id}님</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="/CHAL-KAK/logout.ck">Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<div style="margin-top: 70px">
		<c:if test="${empty list}">
			<h3>모델님이 작성한 예약내역이 없어요 ^_^</h3>
		</c:if>
		<c:if test="${!empty list}">
			<h3>내 예약 정보</h3>
			<c:forEach items="${list}" var="reserv">
		${reserv.REV_SEQ}&nbsp;&nbsp;&nbsp;
		<c:set var="concept" value="${reserv.CONCEPT}" />
				<c:if test="${concept eq '0'}">
					<c:out value="독사진"></c:out>
				</c:if>
				<c:if test="${concept eq '1'}">
					<c:out value="우정사진"></c:out>
				</c:if>
				<c:if test="${concept eq '2'}">
					<c:out value="커플사진"></c:out>
				</c:if>
				<c:if test="${concept eq '3'}">
					<c:out value="가족사진"></c:out>
				</c:if>
		${reserv.PEOPLE_NUM}&nbsp;&nbsp;&nbsp;
		<fmt:formatDate value="${reserv.DAY}" pattern="yyyy.MM.dd" />
		${reserv.START_TIME}&nbsp;&nbsp;&nbsp;
		${reserv.END_TIME}&nbsp;&nbsp;&nbsp;
		<c:set var="progress" value="${reserv.PROGRESS}" />
				<c:if test="${progress eq '0'}">
					<c:out value="예약대기"></c:out>
				</c:if>
				<c:if test="${progress eq '1'}">
					<c:out value="예약완료"></c:out>
				</c:if>
				<c:if test="${progress eq '2'}">
					<c:out value="날짜만료"></c:out>
				</c:if>
				<hr>
			</c:forEach>
		</c:if>
</body>
</html>