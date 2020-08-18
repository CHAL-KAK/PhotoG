<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="margin: 100px 100px 100px 100px">
	<form:form method="post" enctype="multipart/form-data"
		modelAttribute="pictureVO" action="pictureUpload.ck">
		<h3>*** 업로드할 파일 선택 ***</h3>
		<br>
		<input type="text" name="p_id" value="${sessionScope.login_user.id}" readonly="readonly">의 프로필 등록 창입니다.<br>
		<hr>
		파일 : <form:input type="file" path="file" name="file" />
		<br>
		<br>
		<p style="color: red; font-weight: bold">
			<form:errors path="file" />
		</p>
		<br>

		<input type="submit" value="전송">
	</form:form>
</body>
</html>