<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<meta charset="utf-8">
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
</head>
<body>
	<p id="result"></p>
	<p id="result2"></p>
	<p id="result3"></p>
	<div id="map" style="width: 75%; height: 600px"></div>
	<div>

		<%
			if (session.getAttribute("login_user") == null) {
		%>
		<a href="/CHAL-KAK/join/model_join.jsp">모델회원가입</a> <a
			href="/CHAL-KAK/join/photographer_join.jsp">사진사회원가입</a> <a
			href="/CHAL-KAK/model_login.jsp">모델로그인</a> <a
			href="/CHAL-KAK/photographer_login.jsp">사진사로그인</a> <a
			href="/CHAL-KAK/administrator_login.jsp">관리자로그인</a> <a
			href="/CHAL-KAK/notice_board.jsp">게시판</a>
		<%
			} else {
		%>

		<a href='/CHAL-KAK/logout.jsp'>로그아웃</a> <a href="/CHAL-KAK/Mypage.jsp">마이페이지</a>
		<a href="/CHAL-KAK/notice_board.jsp">게시판</a>
		<%
			}
		%>

		<a href="api/cluster.jsp">클러스터</a> <a href="api/markerclick.jsp">마커클릭</a>
		<a href="api/multipleMarker.jsp">마커 여러개</a>

	</div>
	<div>
		날짜 <input name="date" type="date"> <br /> 시작 시간 <input
			name="starttime" type="time"><br /> 끝 시간 <input
			name="endtime" type="time"><br /> 인원 <input name="count"
			type="text"><br /> 컨셉 <select name="concept">
			<option value="1">독사진</option>
			<option value="2">우정사진</option>
			<option value="3">커플사진</option>
			<option value="4">가족사진</option>
		</select><br /> <input type="button" value="검색"> <input type="reset"
			value="취소"><br />
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f56496ce33aada63acf5d83d3eb9b9&libraries=clusterer""></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
			level : 8
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);
		////////////////////////////클러스터 api
		// 마커 클러스터러를 생성합니다 
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 10,
			disableClickZoom : true
		// 클러스터 할 최소 지도 레벨 
		});
		console.log(map);
		// 데이터를 가져오기 위해 jQuery를 사용합니다
		// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
		$.get("api/chicken2.json", function(data) {
			// 데이터에서 좌표 값을 가지고 마커를 표시합니다
			// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
			var markers = $(data.positions).map(
					function(i, position) {
						return new kakao.maps.Marker({
							position : new kakao.maps.LatLng(position.lat,
									position.lng),
							clickable : true,
							title : position.name
						});
					});

			// 클러스터러에 마커들을 추가합니다
			clusterer.addMarkers(markers);
			// 			console.log(clusterer.getMarkers());

			for (var i = 0; i < markers.length; i++) {

				var message2 = '여기를  타니 : ' + markers.length;
				var resultDiv = document.getElementById('result2');
				resultDiv.innerHTML = message2;

				// 				var message3 = markers[0].content;
				// 				var resultDiv = document.getElementById('result3');
				// 				resultDiv.innerHTML = message3;

			}
		});

		kakao.maps.event.addListener(clusterer, 'clusterclick', function(
				cluster) {
			marker = cluster.getMarkers();
			console.log(marker);

			var posi = marker[0].getPosition();
			console.log('위치' + posi);
			var tet = clusterer.getTexts();
			console.log('a' + tet);
			console.log(cluster.getMarkers())

			for (i = 0; i < marker.length; i++) {
				// 				kakao.maps.event.addListener(marker[i], 'click',
				// 						makePhoto(marker[i].getPosition(),map));
				kakao.maps.event.addListener(marker[i], 'click',
						makePhoto(marker[i].getPosition()));

			}

		});
		function makePhoto(posi) {
			alert(posi + '/' + map);
		}

		var content = '<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            카카오 스페이스닷원'
				+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>'
				+ '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'
				+ '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>';

		// 		var mphoto = new kakao.maps.CustomOverlay({
		// 			content : content,
		// 			map : map,
		// 			position : marker[0].getPosition()
		// 		});

		///////////////////////////////지도 레벨 출력 api
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'zoom_changed', function() {

			// 지도의 현재 레벨을 얻어옵니다
			var level = map.getLevel();

			if (level > 5) {

				var message = '현재 지도 레벨은 10 이상  ' + level + ' 입니다';
			} else {
				var message = '현재 지도 레벨은 10 이하' + level + ' 입니다';
			}

			var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;

		});

		///////////

		////
	</script>
</body>
</html>
