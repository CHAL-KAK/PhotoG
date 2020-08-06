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
	
	작성자 <input name="p_id" value='<%=session.getAttribute("login_user") %>' readonly="readonly"><br/>
	날짜 <input name="day" type="date"><br/>
	시작 시간 <input name="start_time" type="time" value="12:00" ><br/> 
	끝 시간 <input name="end_time" type="time" value="12:00"><br/> 
	장소 <input name="place" type="text"><br/>
	컨셉 <select name="concept">
			<option value="1">독사진</option>
			<option value="2">우정사진</option>
			<option value="3">커플사진</option>
			<option value="4">가족사진</option>
		</select><br/> 
	최대 인원 <input name="max" type="text"><br/> 
	<input type="submit" value="등록">
</form>
</body>
</html>