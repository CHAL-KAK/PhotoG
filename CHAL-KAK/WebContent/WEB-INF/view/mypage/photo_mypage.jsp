<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function resList(boardseq) {
		$.ajax({
			url : "board_reservlist.ck",
			type : "POST",
			data : {
				bseq : boardseq
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
<style type="text/css">
/* .t1 { */
/*  	display: inline-block; */
/* 	width: 30%; */
/* } */

/* .t2 { */
/* 	display: inline-block; */
/* 	width: 30%; */
/* } */
</style>
</head>
<body>
	<div>
		<div class="t1">
			<c:if test="${empty list}">
				<h3>사진사님이 작성한 게시글이 없어요 ^_^</h3>
			</c:if>
			<c:if test="${!empty list}">
				<h3>사진사 게시물</h3>
				<c:forEach items="${list}" var="board">
					${board.BRD_SEQ}&nbsp;&nbsp;&nbsp;
					${board.PLACE}&nbsp;&nbsp;&nbsp;
					${bord.P_ID}&nbsp;&nbsp;&nbsp;
					${board.CONCEPT}&nbsp;&nbsp;&nbsp;
					${board.MAX}&nbsp;&nbsp;&nbsp;
					${board.START_TIME}&nbsp;&nbsp;&nbsp;
					${board.END_TIME}&nbsp;&nbsp;&nbsp;
<%-- 					${board.PROGRESS}&nbsp;&nbsp;&nbsp; --%>
					<input type="button" value="예약리스트"
							onclick="resList('${board.BRD_SEQ}')" />
					<hr>
				</c:forEach>
			</c:if>
		</div>
		<div id="list" class="t2"></div>
	</div>
	<form action="/CHAL-KAK/upload.ck" method="POST">
		<input type=submit value="등록">
	</form>
	<form action="/CHAL-KAK/confirmProfile.ck?id=${sessionScope.login_user.id}" method="post">
		<input type=submit value="프로필 확인">
	</form>
</body>
</html>