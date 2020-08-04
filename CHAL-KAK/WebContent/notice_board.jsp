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
	String id = (String) request.getAttribute("id");
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