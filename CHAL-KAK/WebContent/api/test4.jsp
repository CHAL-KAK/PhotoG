<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<meta charset="UTF-8">
<title>main</title>
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
<script>
	// 	$().ready(function() {
	// 		var level = map.getLevel();
	// 		alert(level);
	// 		if (level < 12) {
	// 			alert("12보다 작아짐");
	// 		}
	// 	});
</script>
</head>
<body>
	<p id="result"></p>
	<p id="result2"></p>
	<p id="result3"></p>

	<p>
		<span id="result4"></span>
	</p>

	<div id="levelresult"></div>
	<div id="map" style="width: 75%; height: 600px"></div>
	<div>

		<c:choose>
			<c:when test="${empty sessionScope.login_user.type}">
				<a href="/CHAL-KAK/join/model_join.jsp">모델회원가입</a>
				<a href="/CHAL-KAK/join/photographer_join.jsp">사진사회원가입</a>
				<br>
				<a href="/CHAL-KAK/login/model_login.jsp">모델로그인</a>
				<a href="/CHAL-KAK/login/photographer_login.jsp">사진사로그인</a>
				<a href="/CHAL-KAK/login/administrator_login.jsp">관리자로그인</a>
				<br>
				<a href="/CHAL-KAK/noticeboard/notice_board.jsp">게시판</a>
			</c:when>
			<c:otherwise>
				<c:if test="${sessionScope.login_user.type eq 'P'}">
					${sessionScope.login_user.type} : ${sessionScope.login_user.id}님 로그인되셨습니다.<br>
					<a href='/CHAL-KAK/login/logout.jsp'>로그아웃</a>
					<a
						href="/CHAL-KAK/photo_mypage.ck?id=${sessionScope.login_user.id}">사진사
						마이페이지</a>
					<a href="/CHAL-KAK/noticeboard/notice_board.jsp">게시판</a>
				</c:if>
				<c:if test="${sessionScope.login_user.type eq 'M'}">
					${sessionScope.login_user.type} : ${sessionScope.login_user.id}님 로그인되셨습니다.<br>
					<a href='/CHAL-KAK/login/logout.jsp'>로그아웃</a>
					<a
						href="/CHAL-KAK/model_mypage.ck?id=${sessionScope.login_user.id}">모델
						마이페이지</a>
					<a href="/CHAL-KAK/noticeboard/notice_board.jsp">게시판</a>
				</c:if>
			</c:otherwise>
		</c:choose>

		<hr>
		<a href='/CHAL-KAK/login/logout.jsp'>로그아웃</a> <a
			href="api/cluster.jsp">클러스터</a> <a href="api/markerclick.jsp">마커클릭</a>
		<a href="api/multipleMarker.jsp">마커 여러개</a>

	</div>
	<div>
		날짜 <input name="date" type="date"> <br /> 시작 시간 <input
			name="starttime" type="time"><br /> 끝 시간 <input
			name="endtime" type="time"><br /> 인원 <input name="count"
			type="text"><br /> 컨셉 <select name="concept">
			<option value="0">독사진</option>
			<option value="1">우정사진</option>
			<option value="2">커플사진</option>
			<option value="3">가족사진</option>
		</select><br /> <input type="button" value="검색"> <input type="reset"
			value="취소"><br />
	</div>

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
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			minLevel : 10, // 클러스터 할 최소 지도 레벨
			disableClickZoom : false
		// 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
		});


		// 데이터를 가져오기 위해 jQuery를 사용합니다
		// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
		$.get("/CHAL-KAK/api/chicken.json", function(data) {
			// 데이터에서 좌표 값을 가지고 마커를 표시합니다
			// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
			var markers = $(data.positions).map(
					function(i, position) {
						return new kakao.maps.Marker({
							position : new kakao.maps.LatLng(position.lat,
									position.lng)
						});
					});

			// 클러스터러에 마커들을 추가합니다
			clusterer.addMarkers(markers);
		});
		function getevent() {
			alert("호출?");
			$.getJSON('/CHAL-KAK/api/chicken3.json', function(data) {
				console.log('여긴?');
				$.each(data, function(i, position) {
					var marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : new kakao.maps.LatLng(position.lat,
								position.lng)
					// 마커의 위치
					});

					// 마커에 표시할 인포윈도우를 생성합니다 
					var infowindow = new kakao.maps.InfoWindow({
						content : position.content
					// 인포윈도우에 표시할 내용
					});
					console.log("infowindow");

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
					console.log("event 입힙");
				});
			});
		}
		
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'zoom_changed', function() {

			// 지도의 현재 레벨을 얻어옵니다
			var level = map.getLevel();

			if (level < 12) {
				getevent();
				var message = '현재 지도 레벨은 10 이상  ' + level + ' 입니다';
			} else {
				var message = '현재 지도 레벨은 10 이하' + level + ' 입니다';
			}

			var resultDiv = document.getElementById('result4');
			resultDiv.innerHTML = message;

		});
	</script>
</body>
</html>