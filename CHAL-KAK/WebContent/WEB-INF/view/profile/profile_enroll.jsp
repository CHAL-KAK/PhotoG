<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form method="post" enctype="multipart/form-data"
		modelAttribute="uploadFile" action="upload">
		<h3>*** ���ε��� ���� ���� ***</h3>
		<br>
	���� : <form:input type="file" path="file" name="file" />
		<br>
		<br>
		<form:input type="text" path="filename" name="filename" />

		<p style="color: red; font-weight: bold">
			<form:errors path="file" />
		</p>
		<br>
		
	���� : <br>
		<form:textarea name="desc" path="desc" cols="40" rows="10" />
		<br>
		<br>

		<p style="color: red; font-weight: bold">
			<form:errors path="desc" />
		</p>
		<br>

		<input type="submit" value="����">
	</form:form>
</body>
</html>