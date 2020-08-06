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
			<td>${b.place}              <td>
			<td>${b.concept}            <td>
			<td>${b.max}                <td>
			<td>${b.start_time}         <td>
			<td>${b.end_time}           <td>
			<td>${b.day}				<td>
			
			<td>
				<a href="profile.jsp?pid=${b.p_id}"> profile </a>&emsp;
				<a href="reserv.jsp?pid=${b.p_id}"> reservation </a>
			</td>
		</tr>	
		</c:forEach>		
		<form action="<%=path%>/notice_form.jsp">
			<input type="submit" value="make a list">
			<input type="button" value="back" onclick="location.href='<%=path%>'">
		</form>
	</body>
</html>