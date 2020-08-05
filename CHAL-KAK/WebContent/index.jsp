<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<meta charset="UTF-8">
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

		<c:choose>
		<c:when test="${empty login_user.id}">
			<a href="/CHAL-KAK/join/model_join.jsp">모델회원가입</a> <a
			href="/CHAL-KAK/join/photographer_join.jsp">사진사회원가입</a> <a
			href="/CHAL-KAK/model_login.jsp">모델로그인</a> <a
			href="/CHAL-KAK/photographer_login.jsp">사진사로그인</a> <a
			href="/CHAL-KAK/administrator_login.jsp">관리자로그인</a> <a

			href="/CHAL-KAK/noticeboard/notice_board.jsp">게시판</a>
			</c:when>
		<c:otherwise>
		${login_user.id}님 로그인되셨습니다.<br>
		<a href='/CHAL-KAK/logout.jsp'>로그아웃</a> <a href="/CHAL-KAK/Mypage.jsp">마이페이지</a>
		<a href="/CHAL-KAK/noticeboard/notice_board.jsp">게시판</a>
		</c:otherwise>
		</c:choose>

		<a href="api/cluster.jsp">클러스터</a> <a href="api/markerclick.jsp">마커클릭</a>
		<a href="api/multipleMarker.jsp">마커 여러개</a>

	</div>
	<div>
		날짜 <input name="date" type="date"> <br /> 시작 시간 <input
			name="starttime" type="time"><br /> 끝 시간 <input
			name="endtime" type="time"><br /> 인원 <input name="count"
			type="text"><br /> 컨셉 <select name="concept">
			<option value="1">독사진</option>
			<option value="2">우정사진</option>
			<option value="3">커플사진</option>
			<option value="4">가족사진</option>
		</select><br /> <input type="button" value="검색"> <input type="reset"
			value="취소"><br />
	</div>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f56496ce33aada63acf5d83d3eb9b9&libraries=clusterer""></script>
	<script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
      mapOption = {
         center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
         level : 7
      // 지도의 확대 레벨
      };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
      
      $.getJSON('/CHAL-KAK/api/chicken4.json', function(data) {
	    	 $.each(data, function(i, item) {
	    		  var marker = new kakao.maps.Marker({
	    	            map : map, // 마커를 표시할 지도
	    	            position : new kakao.maps.LatLng(item.lat, item.lng)
	    	         // 마커의 위치
	    	         });

	    	         // 마커에 표시할 인포윈도우를 생성합니다 
	    	         var infowindow = new kakao.maps.InfoWindow({
	    	            content : item.content
	    	         // 인포윈도우에 표시할 내용
	    	         });

	    	         // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	    	         // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    	         (function(marker, infowindow) {
	    	            // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
	    	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	    	               infowindow.open(map, marker);
	    	            });

	    	            // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
	    	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	    	               infowindow.close();
	    	            });
	    	         })(marker, infowindow);
	    	  });
    	  });
      
      
      // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
      /* var positions = [
            {
               content : '<img src = "/CHAL-KAK/img/d.PNG" width = 100px; height =100px>',
               latlng : new kakao.maps.LatLng(33.450705, 126.570677)
            },
            {
               content : '<img src = "/CHAL-KAK/img/d.PNG" width = 100px; height =100px>',
               latlng : new kakao.maps.LatLng(33.450936, 126.569477)
            },
            {
               content : '<img src = "/CHAL-KAK/img/d.PNG" width = 100px; height =100px>',
               latlng : new kakao.maps.LatLng(33.450879, 126.569940)
            },
            {
               content : '<img src = "/CHAL-KAK/img/d.PNG" width = 100px; height =100px>',
               latlng : new kakao.maps.LatLng(33.451393, 126.570738)
            } ]; */
 
      /* for (var i = 0; i < positions.length; i++) {
         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
            map : map, // 마커를 표시할 지도
            /* position : positions[i].latlng */
    
       /*     position : new kakao.maps.LatLng(positions[i].lat, posisions[i].lng)
         // 마커의 위치
        
         
         
         /*
         });

         // 마커에 표시할 인포윈도우를 생성합니다 
         var infowindow = new kakao.maps.InfoWindow({
            content : positions[i].content
         // 인포윈도우에 표시할 내용
         });

         // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
         // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
         (function(marker, infowindow) {
            // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
            kakao.maps.event.addListener(marker, 'mouseover', function() {
               infowindow.open(map, marker);
            });

            // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {
               infowindow.close();
            });
         })(marker, infowindow);
      } */
   </script>
</body>
</html>