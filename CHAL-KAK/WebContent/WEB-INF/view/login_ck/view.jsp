<%@page import="ck.vo.ModelVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="ck.controller.LoginController" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ !empty login_user }">
		<c:out value="${ sessionScope.login_user }"/>
		<!--
		<% 
			//ModelVO vo = (ModelVO) session.getAttribute("login_user");
			//out.print(vo);
		%>
		<fmt:formatDate value="${ res.m_bday }" pattern="yyyy-MM-dd"/>-->
	</c:if>
	<c:if test="${ empty login_user }">
		로그인실패!!!	
	</c:if>
</body>
</html>