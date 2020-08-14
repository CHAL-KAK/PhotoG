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
	<div>
		<c:if test="${empty result}">
			<h3>검색하신 조건에 부합하는 데이터가 없습니다.</h3>
		</c:if>
		<c:if test="${!empty result}">
			<h3>게시물 리스트</h3>
			<c:forEach items="${result}" var="blist">
				${blist.P_id}&nbsp;&nbsp;&nbsp;
				${blist.START_TIME}&nbsp;&nbsp;&nbsp;
				${blist.END_TIME}&nbsp;&nbsp;&nbsp;
				${blist.PLACE}&nbsp;&nbsp;&nbsp;
<%-- 				${blist.CONCEPT}&nbsp;&nbsp;&nbsp; --%>
				<c:set var="concept" value="${blist.CONCEPT}" />
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
				${blist.MAX}&nbsp;&nbsp;&nbsp;
				${blist.TITLE}&nbsp;&nbsp;&nbsp;
			</c:forEach>
		</c:if>
	</div>
</body>
</html>