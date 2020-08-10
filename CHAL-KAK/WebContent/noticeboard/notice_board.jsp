<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String path = application.getContextPath();
	%>

	<c:choose>
		<c:when test="${empty sessionScope.login_user.id}">
			<%
				response.sendRedirect("/CHAL-KAK/board_access_fail.ck");
			%>
		</c:when>
		<c:otherwise>
			<%
				response.sendRedirect("/CHAL-KAK/noticeboard.ck");
			%>
		</c:otherwise>
	</c:choose>
</body>
</html>