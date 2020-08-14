<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">


<title>사진사 정보 수정</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/CHAL-KAK/css/one-page-wonder.min.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/CHAL-KAK/index.jsp">CHAL KAK ${sessionScope.login_user.id}님</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/logout.ck">Logout</a>
					</li>
					
				</ul>
			</div>
		</div>
	</nav>

	<form method="post" action="/CHAL-KAK/modifyupdate.ck?id=${sessionScope.login_user.id}">

	<c:forEach items="${one}" var="i">
	<div style="margin-top:70px">
		<div class="form-group" style="width:20%; margin-left: 10px">
			ID <input name="p_id" type="text" value='${sessionScope.login_user.id}' readonly="readonly" class="form-control"/>
			</div>
		<div class="form-group" style="width:20%; margin-left: 10px">
			NAME <input name="p_name" value ='${i.p_name }' type="text" readonly="readonly" class="form-control">
			</div>
		<div class="form-group" style="width:20%; margin-left: 10px">
			GENDER  <input name="p_gender" value='${i.p_gender}' type="text" readonly="readonly" class="form-control">
			</div>
		<div class="form-group" style="width:20%; margin-left: 10px">
			BIRTH <input type="text" name="p_bday" value='${i.p_bday}' readonly="readonly" class="form-control">
			</div>
			<div class="form-group" style="width:20%; margin-left: 10px">
			KAKAOTALK ID : <input type="text" name="p_ka_id" value='${i.p_ka_id}' readonly="readonly" class="form-control"><br/> 
			</div>
			<div class="form-group" style="width:20%; margin-left: 10px">
			CAMERA :<select name="camera_seq" class="form-control">
	
			<option value=3 <c:if test="${i.camera_seq==3}">selected</c:if>>3</option>
			<option value=1 <c:if test="${i.camera_seq==1}">selected</c:if>>1</option>
			<option value=7 <c:if test="${i.camera_seq==7}">selected</c:if>>7</option>
			<option value=8 <c:if test="${i.camera_seq==8}">selected</c:if>>8</option>
			</select> 
			</div>
			<div class="form-group" style="width:20%; margin-left: 10px">
			Concept :<select name="concept" class="form-control" class="form-control">
			<option value="0" <c:if test="${i.concept==0}">selected</c:if>>독사진</option>
			<option value="1" <c:if test="${i.concept==1}">selected</c:if>>우정사진</option>
			<option value="2" <c:if test="${i.concept==2}">selected</c:if>>커플사진</option>
			<option value="3" <c:if test="${i.concept==3}">selected</c:if>>가족사진</option>
			</select> 
			</div>
			<div class="form-group" style="width:20%; margin-left: 10px">
			Career : <input type="text" name="career" value='${i.career}' class="form-control">  
			</div>
			<div class="form-group" style="width:20%; margin-left: 10px">
			URL : <input type="text" name="url" value='${i.url}' class="form-control">  
			</div>
		</div>
		
	</c:forEach>		
	<input type="submit" value="수정완료" />

	</form>





</body>
</html>