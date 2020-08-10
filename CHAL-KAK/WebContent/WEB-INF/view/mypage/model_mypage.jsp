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
		<h3>모델님이 작성한 게시글이 없어요 ^_^</h3>
	</c:if>
	<c:if test="${!empty list}">
		<h3>내 예약 정보</h3>
		<c:forEach items="${list}" var="reserv">
		${reserv.REV_SEQ}&nbsp;&nbsp;&nbsp;
		${reserv.CONCEPT}&nbsp;&nbsp;&nbsp;
		${reserv.PEOPLE_NUM}&nbsp;&nbsp;&nbsp;
		${reserv.DAY}&nbsp;&nbsp;&nbsp;
		${reserv.START_TIME}&nbsp;&nbsp;&nbsp;
		${reserv.END_TIME}&nbsp;&nbsp;&nbsp;
		${reserv.PROGRESS}&nbsp;&nbsp;&nbsp;
		<hr>
		</c:forEach>
	</c:if>
</body>
</html>