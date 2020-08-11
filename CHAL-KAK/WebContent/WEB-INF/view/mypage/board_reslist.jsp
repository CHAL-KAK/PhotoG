<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����Ʈ</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function matching(ret) {
		var rseq = ret;
		$.ajax({
			url : "reserv_matching.ck",
			type : "POST",
			data : {
				reseq : rseq
			},
			success : function(res) {
				console.log(res);
				if (res == 1) {
					$("#result" + rseq).html("����Ϸ�");
					$('input[id^=butt]').hide();
				} else if (res == 0) {
					$("#result").html("����");
				}
			},
			error : function(a) {
				console.log(a);

			},
			dataType : "text"
		});
	}
</script>

</head>
<body>

	<c:if test="${empty list}">
		<h3>���� ������ �����ϴ�</h3>
	</c:if>
	<div id="rev">
		<c:if test="${!empty list}">
			<h3>���� ����Ʈ</h3>
			<c:forEach items="${list}" var="reser">
		${reser.REV_SEQ}&nbsp;&nbsp;&nbsp;
		${reser.M_ID}&nbsp;&nbsp;&nbsp;
		${reser.CONCEPT}&nbsp;&nbsp;&nbsp;
		${reser.PEOPLE_NUM}&nbsp;&nbsp;&nbsp;
		${reser.DAY}&nbsp;&nbsp;&nbsp;
		${reser.START_TIME}&nbsp;&nbsp;&nbsp;
		${reser.END_TIME}&nbsp;&nbsp;
		<div id="result${reser.REV_SEQ}">${reser.PROGRESS}&nbsp;&nbsp;&nbsp;</div>
				<input type="button" value="����" id="butt"
					onclick="matching('${reser.REV_SEQ}')" />
				<br />
			</c:forEach>
		</c:if>

	</div>

</body>
</html>