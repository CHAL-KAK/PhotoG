<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="/CHAL-KAK/modifyupdate.ck?id=${sessionScope.login_user.id}">

	<c:forEach items="${one}" var="i">
	
			ID : <input name="p_id" type="text" value='${sessionScope.login_user.id}' readonly="readonly"/><br/>
			NAME : <input name="p_name" value ='${i.p_name }' type="text" readonly="readonly"><br/> 
			GENDER : <input name="p_gender" value='${i.p_gender}' type="text" readonly="readonly"><br/>
			BIRTH : <input type="text" name="p_bday" value='${i.p_bday}' readonly="readonly"><br/> 
			KAKAOTALK ID : <input type="text" name="p_ka_id" value='${i.p_ka_id}' readonly="readonly"><br/> 
			
			CAMERA :<select name="camera_seq" >
			<option value=3 <c:if test="${i.camera_seq==3}">selected</c:if>>3</option>
			<option value=1 <c:if test="${i.camera_seq==1}">selected</c:if>>1</option>
			<option value=7 <c:if test="${i.camera_seq==7}">selected</c:if>>7</option>
			<option value=8 <c:if test="${i.camera_seq==8}">selected</c:if>>8</option>
			</select> <br/>
			Concept :<select name="concept" >
			<option value="0" <c:if test="${i.concept==0}">selected</c:if>>독사진</option>
			<option value="1" <c:if test="${i.concept==1}">selected</c:if>>우정사진</option>
			<option value="2" <c:if test="${i.concept==2}">selected</c:if>>커플사진</option>
			<option value="3" <c:if test="${i.concept==3}">selected</c:if>>가족사진</option>
			</select> <br/>
			Career : <input type="text" name="career" value='${i.career}'>  <br/>
			URL : <input type="text" name="url" value='${i.url}'>  <br/>
		
	</c:forEach>		
	<input type="submit" value="수정완료" />

	</form>





</body>
</html>