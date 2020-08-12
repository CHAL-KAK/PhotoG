<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model_Join</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#idcheck').click(function() {
			var id = document.join.id.value;
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
	<form method="post" action="/CHAL-KAK/modeljoin.ck" name="join">
		<div id="member">
			<div class="t common">
				ID :<input type="text" name="m_id" id="id" />
			</div>
			<div class="t2 common">
				<input type="button" id="idcheck" value="중복체크">
			</div>
			<div id="idresult" class="t3 common"></div>
			<br /> PW : <input type="password" name="m_password"> NAME :
			<input type="text" name="m_name"> GENDER : <input
				type="radio" name="m_gender" value="M" id="r0" checked> <label
				for="r0">Male</label>&emsp;&emsp;&emsp;&emsp; <input type="radio"
				name="m_gender" value="F" id="r1"> <label for="r1">Female</label>
			BIRTH : <input type="date" name="m_bday"> KAKAOTALK ID : <input
				type="text" name="m_ka_id"> <input type="submit"
				value="join" /> <input type="button" value="back"
				onClick="location.href='<%=path%>'">
		</div>
	</form>
</body>
</html>