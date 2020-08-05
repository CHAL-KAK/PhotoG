<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* String id = (String) session.getAttribute("login_user"); */
	String path = application.getContextPath();
%>
<%
	/* if(id == null){
		response.sendRedirect("/CHAL-KAK/board_access_fail.ck");	
		
	}
	else{
		response.sendRedirect("/CHAL-KAK/noticeboard.ck");
	} */

response.sendRedirect("/CHAL-KAK/noticeboard.ck");
%>
</body>
</html>