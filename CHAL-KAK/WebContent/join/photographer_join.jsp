<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Photographer_Join</title>
	</head>
	<body>
		<%
			String path = application.getContextPath();
		%>
		<form method="post" action="/CHAL-KAK/photographerjoin.ck">
				ID : <input type="text" name="p_id"/>
				PW : <input type="password" name="p_password">
				NAME : <input type="text" name="p_name">
				GENDER : <input type="radio" name="p_gender" value="M" id="r0" checked>
						 <label for="r0">Male</label>&emsp;&emsp;&emsp;&emsp;
						 <input type="radio" name="p_gender" value="F" id="r1">
						 <label for="r1">Female</label>
				BIRTH : <input type="date" name="p_bday">
				KAKAOTALK ID : <input type="text" name="p_ka_id">
				<br>
				CAMERA :<select name="camera_seq">
					<option>3</option>
							<option>1</option>
							<option>7</option>
							<option>8</option>
							<option>3</option>
						</select>
				Concept :<select name="concept">
							<option>2</option>
							<option>3</option>
							<option>4</option>							
						</select>
				Career : <input type="text" name="career">
				URL : <input type="text" name="url">
			<input type="submit" value="join" />
			<input type="button" value="back" onClick="location.href='<%=path%>'">
		</form>
	</body>
</html>