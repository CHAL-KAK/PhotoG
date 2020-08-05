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
		<a href="/CHAL-KAK/join/model_join.jsp">��ȸ������</a> <a
			href="/CHAL-KAK/join/photographer_join.jsp">������ȸ������</a> <a
			href="/CHAL-KAK/model_login.jsp">�𵨷α���</a> <a
			href="/CHAL-KAK/photographer_login.jsp">������α���</a> <a
			href="/CHAL-KAK/administrator_login.jsp">�����ڷα���</a> <a
			href="/CHAL-KAK/notice_board.jsp">�Խ���</a>
		<%
			} else {
		%>

		<a href='/CHAL-KAK/logout.jsp'>�α׾ƿ�</a> <a href="/CHAL-KAK/Mypage.jsp">����������</a>
		<a href="/CHAL-KAK/notice_board.jsp">�Խ���</a>
		<%
			}
		%>

		<a href="api/cluster.jsp">Ŭ������</a> <a href="api/markerclick.jsp">��ĿŬ��</a>
		<a href="api/multipleMarker.jsp">��Ŀ ������</a>

	</div>
	<div>
		��¥ <input name="date" type="date"> <br /> ���� �ð� <input
			name="starttime" type="time"><br /> �� �ð� <input
			name="endtime" type="time"><br /> �ο� <input name="count"
			type="text"><br /> ���� <select name="concept">
			<option value="1">������</option>
			<option value="2">��������</option>
			<option value="3">Ŀ�û���</option>
			<option value="4">��������</option>
		</select><br /> <input type="button" value="�˻�"> <input type="reset"
			value="���"><br />
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f56496ce33aada63acf5d83d3eb9b9&libraries=clusterer""></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(37.54699, 127.09598), // ������ �߽���ǥ
			level : 8
		// ������ Ȯ�� ����
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);
		////////////////////////////Ŭ������ api
		// ��Ŀ Ŭ�����ͷ��� �����մϴ� 
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
			averageCenter : true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
			minLevel : 10,
			disableClickZoom : true
		// Ŭ������ �� �ּ� ���� ���� 
		});
		console.log(map);
		// �����͸� �������� ���� jQuery�� ����մϴ�
		// �����͸� ������ ��Ŀ�� �����ϰ� Ŭ�����ͷ� ��ü�� �Ѱ��ݴϴ�
		$.get("api/chicken2.json", function(data) {
			// �����Ϳ��� ��ǥ ���� ������ ��Ŀ�� ǥ���մϴ�
			// ��Ŀ Ŭ�����ͷ��� ������ ��Ŀ ��ü�� ������ �� ���� ��ü�� �������� �ʽ��ϴ�
			var markers = $(data.positions).map(
					function(i, position) {
						return new kakao.maps.Marker({
							position : new kakao.maps.LatLng(position.lat,
									position.lng),
							clickable : true,
							title : position.name
						});
					});

			// Ŭ�����ͷ��� ��Ŀ���� �߰��մϴ�
			clusterer.addMarkers(markers);
			// 			console.log(clusterer.getMarkers());

			for (var i = 0; i < markers.length; i++) {

				var message2 = '���⸦  Ÿ�� : ' + markers.length;
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
			console.log('��ġ' + posi);
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
				+ '            īī�� �����̽����'
				+ '            <div class="close" onclick="closeOverlay()" title="�ݱ�"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">����Ư����ġ�� ���ֽ� ÷�ܷ� 242</div>'
				+ '                <div class="jibun ellipsis">(��) 63309 (����) ���� 2181</div>'
				+ '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">Ȩ������</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>';

		// 		var mphoto = new kakao.maps.CustomOverlay({
		// 			content : content,
		// 			map : map,
		// 			position : marker[0].getPosition()
		// 		});

		///////////////////////////////���� ���� ��� api
		// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// ������ Ȯ�� �Ǵ� ��ҵǸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(map, 'zoom_changed', function() {

			// ������ ���� ������ ���ɴϴ�
			var level = map.getLevel();

			if (level > 5) {

				var message = '���� ���� ������ 10 �̻�  ' + level + ' �Դϴ�';
			} else {
				var message = '���� ���� ������ 10 ����' + level + ' �Դϴ�';
			}

			var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;

		});

		///////////

		////
	</script>
</body>
</html>
