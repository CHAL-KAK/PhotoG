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
<title>사진사 마이페이</title>
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
<script type="text/javascript">
	function resList(boardseq) {
		var boseq = boardseq.split(",")[0];
		var pro = boardseq.split(",")[1];
		$.ajax({
			url : "board_reservlist.ck",
			type : "POST",
			data : {
				bseq : boseq,
				prog : pro
			},
			success : function(data) {
				$("#list").html(data);
			},
			error : function() {
				alert("fail");
			},
			dataType : "text"

		});
	}
</script>

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

	<div style="margin-top:70px">
		<a href="/CHAL-KAK/modifyform.ck?id=${sessionScope.login_user.id}">
			정보수정 </a>
		<div class="t1" name="plist">
			<c:if test="${empty list}">
				<h3>사진사님이 작성한 게시글이 없어요 ^_^</h3>
			</c:if>
			<c:if test="${!empty list}">
				<h3>사진사 게시물</h3>
				<c:forEach items="${list}" var="board">
					${board.BRD_SEQ}&nbsp;&nbsp;&nbsp;
					${board.PLACE}&nbsp;&nbsp;&nbsp;
					${board.TITLE}&nbsp;&nbsp;&nbsp;
					<c:set var="concept" value="${board.CONCEPT}" />
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
					${board.MAX}&nbsp;&nbsp;&nbsp;
					<fmt:formatDate value="${board.DAY}" pattern="yyyy.MM.dd" />
					${board.START_TIME}&nbsp;&nbsp;&nbsp;
					${board.END_TIME}&nbsp;&nbsp;&nbsp;
					<input type="button" value="예약리스트"
						onclick="resList('${board.BRD_SEQ},${board.PROGRESS}')" />
					<hr>
				</c:forEach>
			</c:if>
		</div>
		<div id="list" class="t2"></div>
	</div>
	<c:if test="${reg eq '0'}">
		<form action="/CHAL-KAK/upload.ck" method="POST">
			<input type=submit value="프로필 사진 등록">
		</form>
	</c:if>
	<c:if test="${reg ne '0'}">
		<form action="/CHAL-KAK/confirmProfile.ck">
			<input type="hidden" name="id" value="${sessionScope.login_user.id}">
			<input type=submit value="프로필 확인">
		</form>
	</c:if>
</body>
</html>