<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Ȯ��, ��� �̺�Ʈ ����ϱ�</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<p>
		<em>������ Ȯ�� �Ǵ� ��� ���ּ���!</em>
	</p>
	<p id="result"></p>

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

		// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// ������ Ȯ�� �Ǵ� ��ҵǸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(map, 'zoom_changed', function() {

			// ������ ���� ������ ���ɴϴ�
			var level = map.getLevel();

			var message = '���� ���� ������ ' + level + ' �Դϴ�';
			var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;

		});
	</script>
</body>
</html>