<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="/CHAL-KAK/noticeForm.ck" method="post" accept-charset="UTF-8">
	
	작성자 <input name="p_id" value='${sessionScope.login_user.id}' readonly="readonly"><br/>
	날짜 <input name="day" type="date"><br/>
	제목 <input name="title" type = text ><br>
	시작 시간 <input name="start_time" type="time" value="12:00" ><br/> 
	끝 시간 <input name="end_time" type="time" value="12:00"><br/> 
	장소 <input name="place" type="text"><br/>
	컨셉 <select name="concept">
			<option value="0">독사진</option>
			<option value="1">우정사진</option>
			<option value="2">커플사진</option>
			<option value="3">가족사진</option>
		</select><br/> 
	최대 인원 <input name="max" type="text"><br/> 
	내용 <textarea rows="5" cols="5" name="content"></textarea>
	<input type="submit" value="등록">
</form>
</body>
</html>