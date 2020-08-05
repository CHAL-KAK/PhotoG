<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>�ݱⰡ ������ Ŀ���� ��������</title>
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '����', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f56496ce33aada63acf5d83d3eb9b9"></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ �߽���ǥ
		mapOption = {
			center : new kakao.maps.LatLng(33.451475, 126.570528), // ������ �߽���ǥ
			level : 3
		// ������ Ȯ�� ����
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

		// ������ ��Ŀ�� ǥ���մϴ� 
		var marker = new kakao.maps.Marker({
			map : map,
			position : new kakao.maps.LatLng(33.450701, 126.570667)
		});

		// Ŀ���� �������̿� ǥ���� ������ �Դϴ�
		// Ŀ���� �������̴� �Ʒ��� ���� ����ڰ� �����Ӱ� �������� �����ϰ� �̺�Ʈ�� ������ �� �ֱ� ������
		// ������ �̺�Ʈ �޼ҵ带 �������� �ʽ��ϴ� 
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

		// ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
		// ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
		var overlay = new kakao.maps.CustomOverlay({
			content : content,
			map : map,
			position : marker.getPosition()
		});

		// ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
		kakao.maps.event.addListener(marker, 'click', function() {
			overlay.setMap(map);
		});

		// Ŀ���� �������̸� �ݱ� ���� ȣ��Ǵ� �Լ��Դϴ� 
		function closeOverlay() {
			overlay.setMap(null);
		}
	</script>
</body>
</html>