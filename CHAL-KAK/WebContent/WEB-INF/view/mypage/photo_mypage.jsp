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
.common {
	display: inline-block;
	width: 45%;
}
</style>
</head>
<body>
	<div>
		<div class="t common">
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
					${board.PROGRESS}&nbsp;&nbsp;&nbsp;
					<input type="button" value="예약리스트"
							onclick="resList('${board.BRD_SEQ}')" />
					<hr>
				</c:forEach>
			</c:if>
		</div>
		<div id="list" class="t2 common"></div>
	</div>
</body>
</html>