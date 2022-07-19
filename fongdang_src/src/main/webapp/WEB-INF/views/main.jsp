<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/button.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>메인</title>

<style>
body {
	font-family: SUIT-Regular;
}

il, ul {
	list-style: none;
}

.leftImg {
	width: 20px;
}

.rightImg {
	width: 20px;
}

.slidebox .slideitem label {
	position: absolute;
	z-index: 1;
	top: 84%;
	transform: translateY(-50%);
	padding: 20px;
	cursor: pointer;
}

label.left {
	right: 13.5%;
	border-radius: 100%;
	background-color: #5f5f5f7f;
	background-position: center center;
	background-size: 50%;
	background-repeat: no-repeat;
}

label.right {
	right: 8%;
	border-radius: 100%;
	background-color: #5f5f5f7f;
	background-position: center center;
	background-size: 50%;
	background-repeat: no-repeat;
}

.paginglist {
	text-align: center;
	padding: 30px 0;
}

.paginglist>li {
	display: inline-block;
	vertical-align: middle;
	margin: 0 10px;
}

.paginglist>li>label {
	display: block;
	padding: 10px 30px;
	border-radius: 10px;
	background: #ccc;
	cursor: pointer;
}

.paginglist>li:hover>label {
	background: #333;
}

[id="slide01"]:checked ~.slidelist .slideitem {
	transform: translateX(0);
	animation: slide01 30s infinite;
}

[id="slide02"]:checked ~.slidelist .slideitem {
	transform: translateX(-100%);
	animation: slide02 30s infinite;
}

[id="slide03"]:checked ~.slidelist .slideitem {
	transform: translateX(-200%);
	animation: slide03 30s infinite;
}

[id="slide04"]:checked ~.slidelist .slideitem {
	transform: translateX(-300%);
	animation: slide04 30s infinite;
}

.top3_img {
	overflow: hidden;
	width: 100%;
	height: 27%;
	width: 100%;
}

.top_img:hover {
	transform: scale(1.2);
}
</style>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<div class="main_AllWrap" style="width: 1200px; margin: 0 auto;">
		<div id="bannerWrap">
			<div class="slidebox" style="margin-top: 30px;">
				<input type="radio" name="slide" id="slide01" checked> <input
					type="radio" name="slide" id="slide02"> <input type="radio"
					name="slide" id="slide03"> <input type="radio" name="slide"
					id="slide04">
				<ul class="slidelist">
					<li class="slideitem">
						<div>
							<label for="slide04" class="left"><img class="leftImg"
								src="<%=request.getContextPath()%>/resources/images/left-arrow.png" /></label>
							<label for="slide02" class="right"><img class="rightImg"
								src="<%=request.getContextPath()%>/resources/images/right-arrow.png" /></label>
							<a href="<%=request.getContextPath()%>/funding/info/before/12"><img
								src="<%=request.getContextPath()%>/resources/images/main04.jpg" /></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide01" class="left"><img class="leftImg"
								src="<%=request.getContextPath()%>/resources/images/left-arrow.png" /></label>
							<label for="slide03" class="right"><img class="rightImg"
								src="<%=request.getContextPath()%>/resources/images/right-arrow.png" /></label>
							<a href="<%=request.getContextPath()%>/funding/info/28"><img
								src="<%=request.getContextPath()%>/resources/images/main06.gif" /></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide02" class="left"><img class="leftImg"
								src="<%=request.getContextPath()%>/resources/images/left-arrow.png" /></label>
							<label for="slide04" class="right"><img class="rightImg"
								src="<%=request.getContextPath()%>/resources/images/right-arrow.png" /></label>
							<a href="<%=request.getContextPath()%>/funding/info/56"><img
								src="<%=request.getContextPath()%>/resources/images/main07.gif" /></a>
						</div>
					</li>
					<li class="slideitem">
						<div>
							<label for="slide03" class="left"><img class="leftImg"
								src="<%=request.getContextPath()%>/resources/images/left-arrow.png" /></label>
							<label for="slide01" class="right"><img class="rightImg"
								src="<%=request.getContextPath()%>/resources/images/right-arrow.png" /></label>
							<a href="<%=request.getContextPath()%>/maker/view"><img
								src="<%=request.getContextPath()%>/resources/images/main05.gif" /></a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="section">
			<div id="beforeFunding">
				<p style="font-family: SUIT-SemiBold; font-size: 25px;">주목하세요!
					오픈 예정 프로젝트</p>
				<p style="margin-left: 150px; font-family: SUIT-Regular">-먼저
					참여하는 분들께 드리는 얼리버드 혜택-</p>
				<div class="wrap_content">
					<section>
						<div class="container_content">
							<c:forEach items="${preProducts}" var="product">

								<div style="margin-right: 35px;">
									<a class="product_link"
										href="<%=request.getContextPath()%>/funding/info/before/${product.p_no}">
										<div class="product_image">
											<div class="wrap_product_thumbnail">
												<img class="product_thumbnail" src="${product.p_thumbnail}">

											</div>
										</div>
									</a> <a class="product_link"
										href="<%=request.getContextPath()%>/funding/info/before/${product.p_no}">
										<div class="product_name">
											<!-- ${vo.product } -->
											<p class="product_name_color">${product.p_name}</p>
										</div>
										<div class="product_name_intro">
											<!-- ${vo.product } -->
											<p style="color: black;">
												<span>00일 오픈예정! </span>
											</p>
										</div>
									</a>
									<div class="product_title">
										<!-- ${vo.product } -->
										<h4 style="color: #EF9A9A;">
											54,000<span style="color: black;"> 원</span><span
												style="color: black; margin-left: 3px;"> 잡화 </span>
										</h4>
									</div>
								</div>

							</c:forEach>

						</div>
					</section>
				</div>
			</div>
			<div id="ranking01">
				<p style="font-family: SUIT-SemiBold; font-size: 25px;">실시간 랭킹!</p>
				<div style="display: flex;">
					<ul style="top: 20px; position: relative;">
						<li>
							<h3 class="rankNum fistNum">1</h3>
						</li>
						<li>
							<h3 class="rankNum">2</h3>
						</li>
						<li>
							<h3 class="rankNum">3</h3>
						</li>
						<li>
							<h3 class="rankNum">4</h3>
						</li>
						<li>

							<h3 class="rankNum">5</h3>

						</li>
					</ul>
					<div id="rankingWrap">
						<ul class="rankingWrap">
							<li class="ranking02"><a href="#"><h5
										class=" productName" style="width: 180px;">
										[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br> <span
											class="productPer">102%<span class="productCate">화장품</span></span>
									</h5></a> <a href="#"><div class="rankgImgWrap">
										<img
											src="<%=request.getContextPath()%>/resources/images/pets.jpg"
											class="rankgImg">
									</div> </a></li>
							<li class="ranking02">
								<h5 class=" productName" style="width: 180px;">
									[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br> <span
										class="productPer">102%<span class="productCate">화장품</span></span>
								</h5> <a href="#"><div class="rankgImgWrap">
										<img
											src="<%=request.getContextPath()%>/resources/images/pets.jpg"
											class="rankgImg">
									</div> </a>
							</li>
							<li class="ranking02">
								<h5 class=" productName" style="width: 180px;">
									[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br> <span
										class="productPer">102%<span class="productCate">화장품</span></span>
								</h5> <a href="#"><div class="rankgImgWrap">
										<img
											src="<%=request.getContextPath()%>/resources/images/pets.jpg"
											class="rankgImg">
									</div> </a>
							</li>
							<li class="ranking02">
								<h5 class=" productName" style="width: 180px;">
									[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br> <span
										class="productPer">102%<span class="productCate">화장품</span></span>
								</h5> <a href="#"><div class="rankgImgWrap">
										<img
											src="<%=request.getContextPath()%>/resources/images/pets.jpg"
											class="rankgImg">
									</div> </a>
							</li>
							<li class="ranking02">
								<h5 class=" productName" style="width: 180px;">
									[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br> <span
										class="productPer">102%<span class="productCate">화장품</span></span>
								</h5> <a href="#"><div class="rankgImgWrap">
										<img
											src="<%=request.getContextPath()%>/resources/images/pets.jpg"
											class="rankgImg">
									</div> </a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<hr style="border-color: rgba(135, 132, 132, 0.253)">
		<div class="section02">

			<div class="top3">
				<div class="top3_img">
					<img class="top_img"
						style="width: 100%; height: 100%; transition: transform .25s;"
						src="<%=request.getContextPath()%>/resources/images/refunding.jpg">
				</div>
				<h3
					style="text-align: center; margin-bottom: 11px; position: relative; top: 7px;">오직
					퐁당에서만! 앵콜펀딩</h3>
				<div style="background-color: blue; width: 100%; height: 100px;"></div>
				<div
					style="background-color: blue; width: 100%; height: 100px; margin-top: 15px;"></div>
				<div
					style="background-color: blue; width: 100%; height: 100px; margin-top: 15px;"></div>
			</div>
			<div class="top3 margin">
				<div class="top3_img">
					<img class="top_img"
						style="width: 100%; height: 100%; transition: transform .25s;"
						src="<%=request.getContextPath()%>/resources/images/goodbye.jpg">
				</div>
				<h3
					style="text-align: center; margin-bottom: 11px; position: relative; top: 7px;">놓치면
					아쉬운 종료임박 펀딩</h3>
				<div style="background-color: blue; width: 100%; height: 100px;"></div>
				<div style="background-color: blue; width: 100%; height: 100px; margin-top: 15px;"></div>
				<div style="background-color: blue; width: 100%; height: 100px; margin-top: 15px;"></div>
			</div>
			<div class="top3 margin">
				<div class="top3_img">
					<img class="top_img"
						style="width: 100%; position: relative; height: 150%; transition: transform .25s; top: -24px;"
						src="<%=request.getContextPath()%>/resources/images/bestofbest.webp">
				</div>
				<h3
					style="text-align: center; margin-bottom: 11px; position: relative; top: 7px;">퐁당추천
					BEST펀딩</h3>
				<div style="background-color: blue; width: 100%; height: 100px;"></div>
				<div style="background-color: blue; width: 100%; height: 100px; margin-top: 15px;"></div>
				<div style="background-color: blue; width: 100%; height: 100px; margin-top: 15px;"></div>
			</div>
		</div>
		<hr style="border-color: rgba(135, 132, 132, 0.253)">
		<div class="section03" id="section03">

			<div class="apply01">
				<p>퐁당에서 프로젝트 오픈하기</p>
				<p>당신의 이야기를 소개하고 투자자와 서포터를 만나보세요.</p>
				<p style="position: relative; top: 80px; color: white;">당신을
					응원합니다.</p>
			</div>
			<div class="apply02">
				<a href="<%=request.getContextPath()%>/maker/view"><button
						class="btn btn-fill-fcolor">신청하기</button></a>
			</div>
			<img src="<%=request.getContextPath()%>/resources/images/main03.gif"
				class="section03_img">
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>

</html>