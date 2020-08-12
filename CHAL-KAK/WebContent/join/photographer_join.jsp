<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Photographer_Join</title>
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#idcheck').click(function() {
					var id = document.pjoin.id.value;
					$.ajax({
						url : "/CHAL-KAK/id_check.ck",
						type : "POST",
						data : {
							id : id
						},
						success : function(res) {
							if (res == 1) {
								console.log(res);
								$('#idresult').html('사용가능한 ID 입니다.');
							} else if (res == 0) {
								console.log(res);
								$('#idresult').html('이미 존재하는 ID 입니다.');
							}
		
						},
						error : function(ret) {
							console.log(ret);
						},
						dataType : "text"
					});
		
				});
			});
		</script>
		<style type="text/css">
		.common {
			display: inline-block;
			width: 22%;
		}
</style>
</head>
	<body>
		<%
			String path = application.getContextPath();
		%>
		<form method="post" action="/CHAL-KAK/photographerjoin.ck" name="pjoin">
				<div class="t common">
				ID : <input type="text" name="p_id" id="id"/>
				</div>
				<div class="t2 common">
					<input type="button" id="idcheck" value="중복체크">
				</div>
				<div id="idresult" class="t3 common"></div><br/>
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
							<option value="0">독사진</option>
							<option value="1">우정사진</option>
							<option value="2">커플사진</option>
							<option value="3">가족사진</option>						
						</select>
				Career : <input type="text" name="career">
				URL : <input type="text" name="url">
			<input type="submit" value="join" />
			<input type="button" value="back" onClick="location.href='<%=path%>'">
		</form>
	</body>
</html>