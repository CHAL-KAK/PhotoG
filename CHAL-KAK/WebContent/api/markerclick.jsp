<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>��Ŀ�� Ŭ�� �̺�Ʈ ����ϱ�</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<p>
		<em>��Ŀ�� Ŭ�����ּ���!</em>
	</p>

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

		// ��Ŀ�� ǥ���� ��ġ�Դϴ� 
		var position = new kakao.maps.LatLng(33.450701, 126.570667);

		// ��Ŀ�� �����մϴ�
		var marker = new kakao.maps.Marker({
			position : position,
			clickable : true
		// ��Ŀ�� Ŭ������ �� ������ Ŭ�� �̺�Ʈ�� �߻����� �ʵ��� �����մϴ�
		});

		// �Ʒ� �ڵ�� ���� ��Ŀ�� �����ϴ� �ڵ忡�� clickable: true �� ����
		// ��Ŀ�� Ŭ������ �� ������ Ŭ�� �̺�Ʈ�� �߻����� �ʵ��� �����մϴ�
		// marker.setClickable(true);

		// ��Ŀ�� ������ ǥ���մϴ�.
		marker.setMap(map);

		// ��Ŀ�� Ŭ������ �� ��Ŀ ���� ǥ���� ���������츦 �����մϴ�
		var iwContent = '<div style="padding:5px;"><img src="img/d.PNG" width="100" height="150"/></div>', // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
		iwRemoveable = true; // removeable �Ӽ��� ture �� �����ϸ� ���������츦 ���� �� �ִ� x��ư�� ǥ�õ˴ϴ�

		// ���������츦 �����մϴ�
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(marker, 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow.open(map, marker);
		});
	</script>
</body>
</html>