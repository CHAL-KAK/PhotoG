<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String) session.getAttribute("login_user");
	String path = application.getContextPath();
%>
<%
	if(id == null){
		response.sendRedirect("/CHAL-KAK/login.jsp");	
		
	}
	else{
		response.sendRedirect("/noticeboard.ck");
	}
%>
</body>
</html>