<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeBoard</title>
<script>
    // id를 인수로 받아 form 태그로 전송하는 함수
    function goPage(id) {
      // name이 paging인 태그
      var f = document.paging;

      // form 태그의 하위 태그 값 매개 변수로 대입
      f.id.value=id

      // input태그의 값들을 전송하는 주소
      f.action = "/CHAL-KAK/confirmProfile.ck"

      // 전송 방식 : post
      f.method = "post"
      f.submit();
    };
    </script>
</head>
<body style="margin: 100px 100px 100px 100px;">

		<%
			String path = application.getContextPath();
		%>
		<c:forEach items="${all}" var="b">
			<a href="confirmProfile.ck?id=${b.p_id}">${b.p_id}</a>             				
			<a href="board_one.ck?seq=${b.brd_seq}">${b.title}</a>
			${b.max}                
			${b.day}				
			${b.start_time}         
			${b.end_time}           
			
				<c:if test="${sessionScope.login_user.type eq 'M'}">
				<a href="<%=path%>/noticeboard/reservation_form.jsp?pid=${b.p_id}&day=${b.day}&seq=${b.brd_seq}"> reservation </a>
				</c:if>
			
		<hr>
		</c:forEach>
		<c:if test="${sessionScope.login_user.type eq 'P'}">
		<form action="<%=path%>/noticeboard/notice_form.jsp">
			<input type="submit" value="make a list">
		</form>
		</c:if>
			<input type="button" value="back" onclick="location.href='<%=path%>'">
	</body>
</html>