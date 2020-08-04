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
	<div id="map" style="width: 75%; height: 600px"></div>
	<div>
		<a href="/view/join/join.jsp">ȸ������</a> <a href="/view/login/login.jsp">�α���</a>
		<a href="api/cluster.jsp">Ŭ������</a>
		<a href="api/markerclick.jsp">��ĿŬ��</a>
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

		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // ��Ŀ�̹����� �ּ��Դϴ�    
		imageSize = new kakao.maps.Size(33, 22), // ��Ŀ�̹����� ũ���Դϴ�
		imageOption = {
			offset : new kakao.maps.Point(27, 69)
		}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.

		// Ŀ���� �������̿� ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
		var content = '<div class="customoverlay">'
				+ '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">'
				+ '  <img src="../img/d.PNG" width="100" height="150"/>'
				+ '    <span class="title">���Ǿ߱�����</span>' + '  </a>' + '</div>';

		// Ŀ���� �������̰� ǥ�õ� ��ġ�Դϴ� 
		var position = new kakao.maps.LatLng(37.54699, 127.09598);
		var position2 = new kakao.maps.LatLng(37.54, 127.0587);

		// Ŀ���� �������̸� �����մϴ�
		var customOverlay = new kakao.maps.CustomOverlay({
			map : map,
			position : position,
			content : content,
			yAnchor : 1
		});
		var customOverlay = new kakao.maps.CustomOverlay({
			map : map,
			position : position2,
			content : content,
			yAnchor : 1
		});

////////////////////////////Ŭ������ api
		// ��Ŀ Ŭ�����ͷ��� �����մϴ� 
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
			averageCenter : true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
			minLevel : 10
		// Ŭ������ �� �ּ� ���� ���� 
		});

		// �����͸� �������� ���� jQuery�� ����մϴ�
		// �����͸� ������ ��Ŀ�� �����ϰ� Ŭ�����ͷ� ��ü�� �Ѱ��ݴϴ�
		$.get("../api/chicken.json", function(data) {
			// �����Ϳ��� ��ǥ ���� ������ ��Ŀ�� ǥ���մϴ�
			// ��Ŀ Ŭ�����ͷ��� ������ ��Ŀ ��ü�� ������ �� ���� ��ü�� �������� �ʽ��ϴ�
			var markers = $(data.positions).map(
					function(i, position) {
						return new kakao.maps.Marker({
							position : new kakao.maps.LatLng(position.lat,
									position.lng)
						});
					});

			// Ŭ�����ͷ��� ��Ŀ���� �߰��մϴ�
			clusterer.addMarkers(markers);
		});
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
	</script>
</body>
</html>