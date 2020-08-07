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
		<h3>사진사 마이페이지</h3>
		<c:forEach items="${list}" var="board">
		${board.BRD_SEQ}&nbsp;&nbsp;&nbsp;
		${board.PLACE}&nbsp;&nbsp;&nbsp;
		${bord.P_ID}&nbsp;&nbsp;&nbsp;
		${board.CONCEPT}&nbsp;&nbsp;&nbsp;
		${board.MAX}&nbsp;&nbsp;&nbsp;
		${board.START_TIME}&nbsp;&nbsp;&nbsp;
		${board.END_TIME}&nbsp;&nbsp;&nbsp;
		${board.PROGRESS}&nbsp;&nbsp;&nbsp;
		<hr>
		</c:forEach>
	</c:if>
</body>
</html>