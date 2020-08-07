<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty list}">
		<h3>사진사님이 작성한 게시글이 없어요 ^_^</h3>
	</c:if>
	<c:if test="${!empty list}">
		<h3>게시물 리스트</h3>
		<c:forEach items="${list}" var="board">
		${board.BRD_SEQ}&nbsp;&nbsp;&nbsp;
		${board.PLACE}&nbsp;&nbsp;&nbsp;
		${bord.P_ID}&nbsp;&nbsp;&nbsp;
		${board.CONCEPT}&nbsp;&nbsp;&nbsp;
		${board.MAX}&nbsp;&nbsp;&nbsp;
		${board.START_TIME}&nbsp;&nbsp;&nbsp;
		${board.END_TIME}&nbsp;&nbsp;&nbsp;
		${board.PROGRESS}&nbsp;&nbsp;&nbsp;
	</c:forEach>
	</c:if>

	<form action="/CHAL-KAK/profile/profile_enroll.jsp" method="POST">
		<input type=submit value="등록">
	</form>

</body>
</html>