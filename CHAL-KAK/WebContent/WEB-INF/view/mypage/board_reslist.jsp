<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예약 리스트</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function matching(ret) {
		var rseq = ret.split(",")[0];
		var bseq = ret.split(",")[1];
		alert(rseq);
		alert(bseq);
		$.ajax({
			url : "reserv_matching.ck",
			type : "POST",
			data : {
				reseq : rseq
			},
			success : function(data) {
				if (data == "1") {
// 					$("#result").html("성공");
				} else if (data == "0") {
// 					$("#result").html("실패");
				}
			},
			error : function() {

			},
			dataType : "text"
		});
	}
</script>

</head>
<body>

	<c:if test="${empty list}">
		<h3>예약 내역이 없습니다</h3>
	</c:if>
	<div id="rev">
		<c:if test="${!empty list}">
			<h3>예약 리스트</h3>
			<c:forEach items="${list}" var="reser">
		${reser.REV_SEQ}&nbsp;&nbsp;&nbsp;
		${reser.M_ID}&nbsp;&nbsp;&nbsp;
		${reser.CONCEPT}&nbsp;&nbsp;&nbsp;
		${reser.PEOPLE_NUM}&nbsp;&nbsp;&nbsp;
		${reser.DAY}&nbsp;&nbsp;&nbsp;
		${reser.START_TIME}&nbsp;&nbsp;&nbsp;
		${reser.END_TIME}&nbsp;&nbsp;&nbsp;
		${reser.PROGRESS}&nbsp;&nbsp;&nbsp;
		<input type="button" value="수락"
					onclick="matching('${reser.REV_SEQ},${reser.BRD_SEQ}')">
				<br />
			</c:forEach>
		</c:if>
		<div id="result"></div>
	</div>
</body>
</html>