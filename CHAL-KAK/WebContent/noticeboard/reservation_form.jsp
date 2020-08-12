<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			제목 <input name="title" value='${all.title}' readonly="readonly">
			내용
			<textarea rows="5" cols="5" 
				readonly="readonly" name="content">${all.content}</textarea>
		</div>
		<div>
			<form action="/CHAL-KAK/reservationForm.ck" method="post"
				accept-charset="UTF-8">
				<%
					request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
					String seq = request.getParameter("seq");
					String str = request.getParameter("day");
					String[] arr = str.split(" ");
					str = arr[0];
				%>
				게시물 번호 <input name="brd_seq" value='<%=seq%>' readonly="readonly"><br />
				작성자 <input name="m_id" value='${sessionScope.login_user.id}'
					readonly="readonly"><br /> 날짜 <input name="day"
					value='<%=str%>' readonly="readonly"><br /> 시작 시간 <input
					name="start_time" type="time" value="12:00"><br /> 끝 시간 <input
					name="end_time" type="time" value="12:00"><br /> 장소 <input
					name="place" type="text"><br /> 컨셉 <select name="concept">
					<option value="1">독사진</option>
					<option value="2">우정사진</option>
					<option value="3">커플사진</option>
					<option value="4">가족사진</option>
				</select><br /> 인원 <input name="people_num" type="text"><br />
				<input	type="submit" value="예약하기">
			</form>
		</div>
	</div>
</body>
</html>