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
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<title>main</title>
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
<link href="css/one-page-wonder.min.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}
</style>
</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
<!-- 			<a class="navbar-brand" href="/CHAL-KAK/index.jsp">CHAL KAK</a> -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<c:choose>
				<c:when test="${empty sessionScope.login_user.type}">
				<a class="navbar-brand" href="/CHAL-KAK/index.jsp">CHAL KAK</a>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link"
								href="/CHAL-KAK/noticeboard/notice_board.jsp">board</a>
							<li class="nav-item"><a class="nav-link"
								href="/CHAL-KAK/join/join.jsp">Sign Up</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navdrop"
								role="button" data-toggle="dropdown" data-hover="dropdown">Log
									In</a>
								<div class="dropdown-menu" aria-labelledby="navdrop">
									<a href="/CHAL-KAK/login/model_login.jsp" class="dropdown-item">Model</a>
									<a href="/CHAL-KAK/login/photographer_login.jsp"
										class="dropdown-item">Photographer</a> <a
										href="/CHAL-KAK/login/administrator_login.jsp"
										class="dropdown-item">Administrator</a>
								</div></li>
						</ul>
					</div>
				</c:when>
				<c:otherwise>
				<a class="navbar-brand" href="/CHAL-KAK/index.jsp">CHAL KAK ${sessionScope.login_user.id}님 </a>
					<c:if test="${sessionScope.login_user.type eq 'P'}">
					
						<div class="collapse navbar-collapse" id="navbarResponsive">
							<ul class="navbar-nav ml-auto">
								<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/logout.ck">Logout</a>
								<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/photo_mypage.ck?id=${sessionScope.login_user.id}">MyPage</a>
								<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/noticeboard/notice_board.jsp">board</a></li>

							</ul>
						</div>
					</c:if>
					<c:if test="${sessionScope.login_user.type eq 'M'}">
						<div class="collapse navbar-collapse" id="navbarResponsive">
							<ul class="navbar-nav ml-auto">
								<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/logout.ck">Logout</a>
								<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/model_mypage.ck?id=${sessionScope.login_user.id}">MyPage</a>
								<li class="nav-item"><a class="nav-link"
									href="/CHAL-KAK/noticeboard/notice_board.jsp">board</a></li>

							</ul>
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

	<img src="img/photo02.png" width="100%" height="100%"
		style="border: 1px solid #A9A9A9;">

	<p id="result"></p>
	<p id="result2"></p>
	<p id="result3"></p>
	<!--   <div id="levelresult"></div> -->
	<section>
		<div class="row">
			<div id="map"
				style="width: 60%; height: 600px; margin: 30px 0px 30px 30px; border: 1px solid #A9A9A9; float: left;"></div>
			<div
				style="float: right; margin: 30px 0px 0px 30px; font-family: Nanum Gothic;">
				<p>
					날짜&emsp;<input name="date" type="date"> <br />
				</p>
				<p>
					시작 시간&emsp;<input name="starttime" type="time"><br />
				</p>
				<p>
					끝 시간&emsp; <input name="endtime" type="time"><br />
				</p>
				<p>
					인원 &emsp;<input name="count" type="text"><br />
				</p>
				<p>
					컨셉&emsp; <select name="concept">
						<option value="0">독사진</option>
						<option value="1">우정사진</option>
						<option value="2">커플사진</option>
						<option value="3">가족사진</option>
					</select><br />
				</p>
				<input type="button" value="검색"> <input type="reset"
					value="취소"><br />
			</div>
		</div>
	</section>

	<!-- Footer -->
  <footer class="py-5 bg-secondary">
    <div class="container">
      <p class="m-0 text-center text-white small"> 만든이 : 배윤희 오지혜 조재웅 최은혜 </p>
      <p class="m-0 text-center text-white small"> https://github.com/CHAL-KAK/PhotoG</p>
    </div>
    <!-- /.container -->
  </footer>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f56496ce33aada63acf5d83d3eb9b9&libraries=clusterer""></script>
	<script>
		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
			center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
			level : 14
		// 지도의 확대 레벨 
		});
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(35.76798760178648, 128.0449785654274), // 지도의 중심좌표
			level : 13
		// 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다      

		///// 각각의 마커에 이벤트 입힐것
		function getEvent() {
			$.getJSON('/CHAL-KAK/api/chicken4.json', function(data) {
				$.each(data, function(i, item) {
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : new kakao.maps.LatLng(item.lat, item.lng)
					// 마커의 위치
					});
					// 마커에 표시할 인포윈도우를 생성합니다 
					var infowindow = new kakao.maps.InfoWindow({
						content : item.content
					// 인포윈도우에 표시할 내용
					});
					// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
					// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					(function(marker, infowindow) {
						// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
						kakao.maps.event.addListener(marker, 'mouseover',
								function() {
									infowindow.open(map, marker);
								});
						// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
						kakao.maps.event.addListener(marker, 'mouseout',
								function() {
									infowindow.close();
								});
					})(marker, infowindow);
				});
			});
		}
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'zoom_changed', function() {
			// 지도의 현재 레벨을 얻어옵니다
			var level = map.getLevel();
			if (level > 11) {
				var message = '현재 지도 레벨은 10 이상  ' + level + ' 입니다';
			} else {
				getEvent();
				var message = '현재 지도 레벨은 10 이하' + level + ' 입니다';
			}

// 			var resultDiv = document.getElementById('levelresult');
// 			resultDiv.innerHTML = message;
		});
	</script>
</body>
</html>
