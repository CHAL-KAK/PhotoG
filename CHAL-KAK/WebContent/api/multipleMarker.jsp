<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>������ ��Ŀ�� �̺�Ʈ ����ϱ�1</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f56496ce33aada63acf5d83d3eb9b9"></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
			level : 3
		// ������ Ȯ�� ����
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

		// ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
		var positions = [ {
			content : '<div>īī��</div>',
			latlng : new kakao.maps.LatLng(33.450705, 126.570677)
		}, {
			content : '<div>���¿���</div>',
			latlng : new kakao.maps.LatLng(33.450936, 126.569477)
		}, {
			content : '<div>�Թ�</div>',
			latlng : new kakao.maps.LatLng(33.450879, 126.569940)
		}, {
			content : '<div>�ٸ�����</div>',
			latlng : new kakao.maps.LatLng(33.451393, 126.570738)
		} ];

		for (var i = 0; i < positions.length; i++) {
			// ��Ŀ�� �����մϴ�
			var marker = new kakao.maps.Marker({
				map : map, // ��Ŀ�� ǥ���� ����
				position : positions[i].latlng
			// ��Ŀ�� ��ġ
			});

			// ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// ���������쿡 ǥ���� ����
			});

			// ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
			// �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
			// for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}

		/* �Ʒ��� ���̵� �� �� �ֽ��ϴ� */
		/*
		 for (var i = 0; i < positions.length; i ++) {
		 // ��Ŀ�� �����մϴ�
		 var marker = new kakao.maps.Marker({
		 map: map, // ��Ŀ�� ǥ���� ����
		 position: positions[i].latlng // ��Ŀ�� ��ġ
		 });

		 // ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
		 var infowindow = new kakao.maps.InfoWindow({
		 content: positions[i].content // ���������쿡 ǥ���� ����
		 });

		 // ��Ŀ�� �̺�Ʈ�� ����ϴ� �Լ� ����� ��� ȣ���Ͽ� Ŭ������ ����ϴ�
		 // Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
		 (function(marker, infowindow) {
		 // ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
		 kakao.maps.event.addListener(marker, 'mouseover', function() {
		 infowindow.open(map, marker);
		 });

		 // ��Ŀ�� mouseout �̺�Ʈ�� ����ϰ� ���콺 �ƿ� �� ���������츦 �ݽ��ϴ�
		 kakao.maps.event.addListener(marker, 'mouseout', function() {
		 infowindow.close();
		 });
		 })(marker, infowindow);
		 }
		 */
	</script>
</body>
</html>