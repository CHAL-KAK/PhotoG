<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeBoard</title>
</head>
<body style="margin: 100px 100px 100px 100px;">
		<%
			String path = application.getContextPath();
		%>
		<c:forEach items="${all}" var="b">
		<tr>
			<td>${b.p_id}               <td>
			<td><a href="board_one.ck?seq=${b.brd_seq}">${b.title}</a></td>
			<td>${b.max}                <td>
			<td>${b.day}				<td>
			<td>${b.start_time}         <td>
			<td>${b.end_time}           <td>
			<td>
				<c:if test="${sessionScope.login_user.type eq 'M'}">
				<a href="reservation_form.jsp?pid=${b.p_id}&day=${b.day}&seq=${b.brd_seq}"> reservation </a>
				</c:if>
			</td>
		</tr>	
		<hr>
		</c:forEach>
		<c:if test="${sessionScope.login_user.type eq 'P'}">
		<form action="<%=path%>/notice_form.jsp">
			<input type="submit" value="make a list">
		</form>
		</c:if>
			<input type="button" value="back" onclick="location.href='<%=path%>'">
	</body>
</html>