<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Model_Join</title>
	</head>
	<body>
		<%
			String path = application.getContextPath();
		%>
		<form method="post" action="/CHAL-KAK/modeljoin.ck">
				ID : <input type="text" name="m_id"/>
				PW : <input type="password" name="m_password">
				NAME : <input type="text" name="m_name">
				GENDER : <input type="radio" name="m_gender" value="M" id="r0" checked>
						 <label for="r0">Male</label>&emsp;&emsp;&emsp;&emsp;
						 <input type="radio" name="m_gender" value="F" id="r1">
						 <label for="r1">Female</label>
				BIRTH : <input type="date" name="m_bday">
				KAKAOTALK ID : <input type="text" name="m_ka_id">
			<input type="submit" value="join" />
			<input type="button" value="back" onClick="location.href='<%=path%>'">
		</form>
	</body>
</html>