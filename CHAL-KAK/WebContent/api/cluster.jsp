<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<meta charset="utf-8">
<title>clusterTest</title>

</head>
<body>
	<p style="margin-top: -12px">
		����� �����͸� ���÷��� <em class="link"> <a
			href="/download/web/data/chicken.json" target="_blank">���⸦ Ŭ���ϼ���!</a>
		</em>
	</p>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f56496ce33aada63acf5d83d3eb9b9&libraries=clusterer"></script>
	<script>
		var map = new kakao.maps.Map(document.getElementById('map'), { // ������ ǥ���� div
			center : new kakao.maps.LatLng(36.2683, 127.6358), // ������ �߽���ǥ 
			level : 14
		// ������ Ȯ�� ���� 
		});

		// ��Ŀ Ŭ�����ͷ��� �����մϴ� 
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
			averageCenter : true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
			minLevel : 10
		// Ŭ������ �� �ּ� ���� ���� 
		});

		// �����͸� �������� ���� jQuery�� ����մϴ�
		// �����͸� ������ ��Ŀ�� �����ϰ� Ŭ�����ͷ� ��ü�� �Ѱ��ݴϴ�
		$.get("chicken.json", function(data) {
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
	</script>
</body>
</html>