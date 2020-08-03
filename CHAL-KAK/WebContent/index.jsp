<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>�̹��� ��Ŀ�� Ŀ���� ��������</title>
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
	<div id="map" style="width: 100%; height: 800px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f56496ce33aada63acf5d83d3eb9b9"></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(37.54699, 127.09598), // ������ �߽���ǥ
			level : 4
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
				+ '  <img src="/WEB-INF/view/d.PNG" width="100" height="150"/>'
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
	</script>
</body>
</html>