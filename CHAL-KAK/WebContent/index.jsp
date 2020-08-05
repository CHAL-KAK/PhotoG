<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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
	if(session.getAttribute("login_user")==null){%>
		<a href="/CHAL-KAK/join/model_join.jsp">모델회원가입</a>
		<a href="/CHAL-KAK/join/photographer_join.jsp">사진사회원가입</a>
		<a href="/CHAL-KAK/login.jsp">모델 로그인</a>
		<a href="/CHAL-KAK/notice_board.jsp">게시판</a>
		<%} else {%>
		
		<a href='/CHAL-KAK/logout.jsp'>로그아웃</a>
		<a href="/CHAL-KAK/Mypage.jsp">마이페이지</a>
		<a href="/CHAL-KAK/notice_board.jsp">게시판</a>
		<%} %>
		<a href="api/cluster.jsp">�대�ъ�ㅽ��</a> <a href="api/markerclick.jsp">留�而ㅽ�대┃</a>
		<a href="api/multipleMarker.jsp">留�而� �щ�ш�</a>
	</div>
	<div>
		��吏� <input name="date" type="date"> <br /> ���� ��媛� <input
			name="starttime" type="time"><br /> �� ��媛� <input
			name="endtime" type="time"><br /> �몄�� <input name="count"
			type="text"><br /> 而⑥�� <select name="concept">
			<option value="1">���ъ�</option>
			<option value="2">�곗���ъ�</option>
			<option value="3">而ㅽ���ъ�</option>
			<option value="4">媛�議깆�ъ�</option>
		</select><br /> <input type="button" value="寃���"> <input type="reset"
			value="痍⑥��"><br />

	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f56496ce33aada63acf5d83d3eb9b9&libraries=clusterer""></script>
	<script>
		var mapContainer = document.getElementById('map'), // 吏���瑜� ������ div 
		mapOption = {
			center : new kakao.maps.LatLng(37.54699, 127.09598), // 吏����� 以��ъ���
			level : 8
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, 
			averageCenter : true, 
			minLevel : 10,
			disableClickZoom : true
		});

		$.get("api/chicken2.json", function(data) {
			var markers = $(data.positions).map(
					function(i, position) {
						return new kakao.maps.Marker({
							position : new kakao.maps.LatLng(position.lat,
									position.lng),
							clickable : true,
							texts : position.name
						});
					});

			clusterer.addMarkers(markers);

			for (var i = 0; i < markers.length; i++) {

				var message2 = '�ш린瑜�  ���� : ' + markers.length;
				var resultDiv = document.getElementById('result2');
				resultDiv.innerHTML = message2;


			}
		});

		kakao.maps.event.addListener(clusterer, 'clusterclick', function(
				cluster) {
			var marker = cluster.getMarkers();
			console.log(marker);
			
			kakao.maps.event.addListener(marker, 'click', function() {
				console.log(marker);
			});

		});

		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		kakao.maps.event.addListener(map, 'zoom_changed', function() {

			var level = map.getLevel();

			if (level > 5) {

				var message = '���� 吏��� ��踰⑥�� 10 �댁��  ' + level + ' ������';
			} else {
				var message = '���� 吏��� ��踰⑥�� 10 �댄��' + level + ' ������';
			}

			var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;

		});

	</script>
</body>
</html>