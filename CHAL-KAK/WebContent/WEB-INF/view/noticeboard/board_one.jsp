<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board One</title>
<style>
.main{
}
 
.main_common{
    display: inline;
    margin : 100px 100px 100px 100px;
    border: 1px solid;
}
</style>
</head>
<body>
<%
			String path = application.getContextPath();
		%>
<div class="main">
	<c:forEach items="${one}" var="one">
    <div class="title_content main_common">
    	<input name="p_id" value="${one.p_id}" readonly="readonly"><br>
    	<input name=title value="${one.title}" readonly="readonly"><br>
    	<textarea rows="10" cols="10" readonly="readonly">${one.content}</textarea><br>
    </div>
    <div class="etc main_common">
    	<input type="text" name="start_time" value="${one.start_time}" readonly="readonly"><br>
    	<input type="text" name="end_time" value="${one.end_time}" readonly="readonly"><br>
    	<input type="text" name="place" value="${one.place}" readonly="readonly"><br>
    	<input type="text" name="concept" value="${one.concept}" readonly="readonly"><br>
    	<input type="text" name="max" value="${one.max}" readonly="readonly"><br>
    	<input type="text" name="day" value="${one.day}" readonly="readonly"><br>
    </div>
    </c:forEach>
    <input type="button" value="back" onclick="location.href='<%=path%>/noticeboard.ck'">
</div>
</body>
</html>