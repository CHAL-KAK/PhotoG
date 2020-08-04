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

		<a href="/CHAL-KAK/model_join.jsp">모델회원가입</a>
		<a href="/CHAL-KAK/login.jsp">모델 로그인</a>
		<a href="/CHAL-KAK/notice_board.jsp">게시판</a>

		
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
		// 吏����� ���� ��踰�
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);
		////////////////////////////�대�ъ�ㅽ�� api
		// 留�而� �대�ъ�ㅽ�곕�щ�� ���깊�⑸���� 
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // 留�而ㅻ�ㅼ�� �대�ъ�ㅽ�곕� 愿�由ы��怨� ������ 吏��� 媛�泥� 
			averageCenter : true, // �대�ъ�ㅽ�곗�� �ы�⑤�� 留�而ㅻ�ㅼ�� ��洹� ��移�瑜� �대�ъ�ㅽ�� 留�而� ��移�濡� �ㅼ�� 
			minLevel : 10,
			disableClickZoom : true
		// �대�ъ�ㅽ�� �� 理��� 吏��� ��踰� 
		});

		// �곗�댄�곕�� 媛��몄�ㅺ린 ���� jQuery瑜� �ъ�⑺�⑸����
		// �곗�댄�곕�� 媛��몄�� 留�而ㅻ�� ���깊��怨� �대�ъ�ㅽ�곕�� 媛�泥댁�� ��寃⑥�����
		$.get("api/chicken2.json", function(data) {
			// �곗�댄�곗���� 醫��� 媛��� 媛�吏�怨� 留�而ㅻ�� �����⑸����
			// 留�而� �대�ъ�ㅽ�곕�щ� 愿�由ы�� 留�而� 媛�泥대�� ���깊�� �� 吏��� 媛�泥대�� �ㅼ����吏� ���듬����
			var markers = $(data.positions).map(
					function(i, position) {
						return new kakao.maps.Marker({
							position : new kakao.maps.LatLng(position.lat,
									position.lng),
							clickable : true,
							texts : position.name
						});
					});

			// �대�ъ�ㅽ�곕�ъ�� 留�而ㅻ�ㅼ�� 異�媛��⑸����
			clusterer.addMarkers(markers);

			for (var i = 0; i < markers.length; i++) {

				var message2 = '�ш린瑜�  ���� : ' + markers.length;
				var resultDiv = document.getElementById('result2');
				resultDiv.innerHTML = message2;

				// 				var message3 = markers[0].content;
				// 				var resultDiv = document.getElementById('result3');
				// 				resultDiv.innerHTML = message3;

			}
		});

		kakao.maps.event.addListener(clusterer, 'clusterclick', function(
				cluster) {
			var marker = cluster.getMarkers();
			console.log(marker);
			
			kakao.maps.event.addListener(marker, 'click', function() {
				// 留�而� ���� �명�ъ�����곕�� �����⑸����
// 				infowindow.open(map, marker);
				console.log(marker);
			});

			// 				var posi = marker[0].getPosition();
			// 				console.log('��移�' + posi);
			// 				var tet=clusterer.getTexts();
			// // 				var text = cluster.getTexts();
			// 				console.log('a'+tet);
			// 		       console.log(cluster.getMarkers())
		});

		///////////////////////////////吏��� ��踰� 異��� api
		// 吏��� ���� 異���瑜� ���댄�� �� ����  以� 而⑦�몃·�� ���깊�⑸����
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 吏���媛� ���� ���� 異�����硫� 留�吏�留� ���쇰�명�곕� ���댁�� �⑥��瑜� �몄�����濡� �대깽�몃�� �깅��⑸����
		kakao.maps.event.addListener(map, 'zoom_changed', function() {

			// 吏����� ���� ��踰⑥�� �살�댁�듬����
			var level = map.getLevel();

			if (level > 5) {

				var message = '���� 吏��� ��踰⑥�� 10 �댁��  ' + level + ' ������';
			} else {
				var message = '���� 吏��� ��踰⑥�� 10 �댄��' + level + ' ������';
			}

			var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;

		});

		///////////

		////
	</script>
</body>
</html>