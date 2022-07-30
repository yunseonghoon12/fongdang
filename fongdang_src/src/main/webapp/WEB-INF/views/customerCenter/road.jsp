<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
<!DOCTYPE html>
<html>
<head>
<title>퐁당</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	font-family: SUIT-Regular;
	margin: 0;
	padding: 0;
}

.allWrap {
	padding: 65px;
	min-width: 1200px;
	max-width: 1200px;
	margin: 0 auto;
	font-size: 18px;
}

.textMapWrap {
	margin: 0 auto;
	display: flex;
}

#map {
	width: 610px;
	height: 500px;
	position: relative;
	overflow: hidden;
	margin-left: 25px;
	border-radius: 5px;
}

.introWrap {
	display: flex;
	margin-top: 80px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="allWrap">
		<div class="textMapWrap">
			<div style="width: 43%;position: relative;">
			<img style="position: absolute;right: -611px;top: -40px;height: 40px; width: 585px;" 
			src="<%=request.getContextPath()%>/resources/images/road02.gif">
				<hr style="position: relative; border-style: groove; right: 375px; top: 18px; width: 540px;">
				<h2 style="text-align: center;">오시는길</h2>
				<br> <br> <br>
				<h3>주소</h3>
				<p>서울특별시 강남구 테헤란로14길 6 남도빌딩</p>
				<br>
				<h3>운영시간</h3>
				<p>09:30~17:30</p>
				<br> <br>
				<p>* 퐁당 내에는 주차 공간이 마련되어 있지 않아요. 주차장 앱 또는 포털 서비스 지도 검색을 통해 주변
					주차장을 이용해 주시길 바랍니다.</p>
			</div>
			<div id="map"></div>
		</div>

		<div class="introWrap" style="position: relative;">
		<img style="position: absolute;right: 539px;top: -40px; width: 520px;" src="<%=request.getContextPath()%>/resources/images/road03.gif">
			<div style="width: 50%; height: 344px; overflow: hidden; border-radius: 23px; position: relative; top: 0px;">
				<img src="<%=request.getContextPath()%>/resources/images/fongdang.jpg">
			</div>
			<div style="width: 50%;">
				<hr
					style="position: relative; border-style: groove; left: 330px; top: 18px; width: 540px;">
				<h2 style="text-align: center;">퐁당소개</h2>
				<br> <br> <br>
				<div style="text-align: center;">
					<p>퐁당은 도전하는 사람들과 그 도전을 지지하는 사람들이 모입니다.</p>
					<p>이들은 진심으로 소통하고 투명하게 공유하며 함께 성장했지요.</p>
					<br>
					<p>그럼 우리 이제 직접 만날까요?</p>
					<p>작은 파동이 모여 큰 파동을 이루듯</p>
					<p>퐁당 플랫폼에서 눈여겨보던 누군가의 도전을</p>
					<p>응원해주고 체험해보세요.</p>
					<p>궁금한 것은 물어보고 당신의 의견을 들려주세요.</p>
					<p>직접 경험해보는 거예요.</p>
					<p>그러고 나서 누군가를 지지한다면, 점점 더 많은 사람들이 모인다면</p>
					<br>
					<p>퐁당은</p>
					<p>새로운 영감과 가능성의</p>
					<p>파도가 되고자 합니다.</p>
				</div>
			</div>
		</div>
	</div>

<div style="margin-top: 65px;">
	<jsp:include page="../footer.jsp" />
</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2c1f7266c7882e29f054c8c9c9fa5fc"></script>
	<script>
		var container = document.getElementById('map'); //지도 표시 div
		var options = {
			center : new kakao.maps.LatLng(37.498933398783876,
					127.03280117765928), //지도의 중심좌표
			level : 3
		//지도의 확대 레벨
		};

		var map = new kakao.maps.Map(container, options);

		// 마커가 표시될 위치
		var markerPosition = new kakao.maps.LatLng(37.498933398783876,
				127.03280117765928);

		// 마커 생성
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드
		// marker.setMap(null);
	</script>
</body>
</html>