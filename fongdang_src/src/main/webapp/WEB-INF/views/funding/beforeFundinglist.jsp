<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<!DOCTYPE html>
<html>
<head>
<title>펀딩 예정리스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<style>
body {
	font-family: SUIT-Regular;
	text-decoration: none;
}

.AllWarp {
	width: 1200px;
	margin: 0 auto;
}
/* TOP 카테고리 */
.productList {
	width: 100%;
	margin: 50px auto 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.productList>ul {
	font-size: 0;
}

.productList>ul>li {
	display: inline-block;
	vertical-align: top;
	width: 150px;
}

.productList>ul>li>a {
	display: block;
	width: auto;
	text-decoration: none;
	margin: 5px;
}

.productList>ul>li>a .screen {
	position: relative;
	overflow: hidden;
	border-radius: 30px;
}

.productList>ul>li>a .screen .top {
	position: absolute;
	bottom: 150%;
	left: 20px;
	z-index: 2;
	color: #fff;
	font-size: 16px;
	font-weight: 900;
	transition: all .35s;
}

.productList>ul>li>a .screen .bottom {
	position: absolute;
	top: 150%;
	left: 20px;
	z-index: 2;
	color: #fff;
	font-size: 12px;
	transition: all .35s;
}

.productList>ul>li>a .screen img {
	width: 100%;
	height: 100px;
}

.productList>ul>li>a h3 {
	font-size: 14px;
	text-align: center;
	color: #666;
	top: 5px;
	position: relative;
}
.productList>ul>li>a:hover h3 {
	color: #EF9A9A;
}
.productList>ul>li>a .screen::after {
	content: '';
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .6);
	z-index: 1;
	opacity: 0;
	transition: all .35s;
}

.productList>ul>li>a:hover .top {
	bottom: 52%;
}

.productList>ul>li>a:hover .bottom {
	top: 52%;
}

.productList>ul>li>a:hover .screen::after {
	opacity: 1;
}
/* 드랍다운 카테고리 */
.category02 {
	margin: 15px 15%;
	display: flex;
	justify-content: end;
}

#cateSelect {
	position: relative;
	left: 150px;
	border-radius: 5px;
	width: 100px;
	height: 30px;
	border-color: #b7b6b6cc;
	background-color: #e7e7e7cc;
	box-shadow: 4px 6px 6px 2px #0000000f, 0px 4px 6px -1px #0000001a;
	border-radius: 5px;
}

#cateSelect:hover {
	border: #353535cc solid 2px;
}

/* 상품 리스트 */
* {
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

.imglist_ul {
	width: 1200px;
	margin: 95px auto 0;
	padding: 10px;
	position: relative;
	left: 54px;
}

.imglist_ul>li {
	display: inline-block;
	width: 30%;
	vertical-align: top;
	font-size: 12px;
}

.productWrap {
	margin-top: 50px;
}

.productWrap a {
	display: block;
	width: auto;
	color: #333;
	margin: 5px 5px 10px 5px;
}

.productWrap a .screen {
	position: relative;
	overflow: hidden;
	padding-bottom: 56.25%;
}

.productWrap a .screen img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	z-index: 1;
	transition: all 1s;
}

.itemsWrap:hover .screen img {
	transform: scale(1.1) translate(-45%, -45%);
}

.productWrap a .screen span {
	display: block;
	position: absolute;
	transition: all .2s;
	background: #EF9A9A;
	z-index: 2;
}

/* 사진 테두리 */
.productWrap a .screen span:nth-child(1) {
	top: 0;
	height: 5px;
	width: 0;
}

.productWrap a .screen span:nth-child(2) {
	top: 0;
	right: 0;
	width: 5px;
	height: 0;
}

.productWrap a .screen span:nth-child(3) {
	bottom: 0;
	right: 0;
	height: 5px;
	width: 0;
}

.productWrap a .screen span:nth-child(4) {
	bottom: 0;
	left: 0;
	width: 5px;
	height: 0;
}

.productWrap a:hover .screen span:nth-child(1) {
	width: 100%;
}

.productWrap a:hover .screen span:nth-child(2) {
	height: 100%;
	transition-delay: .1s;
}

.productWrap a:hover .screen span:nth-child(3) {
	width: 100%;
	transition-delay: .2s;
}

.productWrap a:hover .screen span:nth-child(4) {
	height: 100%;
	transition-delay: .3s;
}

.productWrap a h3 {
	margin: 5px 10px;
	font-size: 19px;
}

.itemsWrap:hover h3, .itemsWrap:hover p, .itemsWrap:hover h4 {
	color: #EF9A9A;
}

.productWrap a p {
	margin: 0 10px;
	font-size: 19px;
	line-height: 18px;
}

a#topBtn {
	position: fixed;
	right: 4%;
	bottom: 14%;
	display: none;
	z-index: 9999;
}

.topImg {
	width: 100px;
}

.moreView {
	justify-content: center;
	align-items: center;
	margin: 30px auto;
	width: 500px;
	text-align: center;
	height: 50px;
}

.productWrap a .nameWrap:hover h3, .productWrap a .nameWrap:hover h4,
	.productWrap a .nameWrap:hover h5, .productWrap a .nameWrap:hover p {
	color: #EF9A9A;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="AllWarp">
		<div class="productList">
			<ul>
				<li><a
					href="<%=request.getContextPath()%>/funding/beforelist/cateC1"
					id="C1">
						<div class="screen">
							<div class="top">테크·가전</div>
							<div class="bottom">Appliances</div>
							<img
								src="<%=request.getContextPath()%>/resources/images/appliances.jpg">
						</div>
						<div>
							<h3>가전</h3>
						</div>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/funding/beforelist/cateC4"
					id="C4">
						<div class="screen">
							<div class="top">캠핑 용품</div>
							<div class="bottom">Camping</div>
							<img
								src="<%=request.getContextPath()%>/resources/images/camping.jpg">
						</div>
						<div>
							<h3>캠핑</h3>
						</div>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/funding/beforelist/cateC2"
					id="C2">
						<div class="screen">
							<div class="top">화장품</div>
							<div class="bottom">Beauty</div>
							<img
								src="<%=request.getContextPath()%>/resources/images/beauty.jpg">
						</div>
						<div>
							<h3>뷰티</h3>
						</div>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/funding/beforelist/cateC3"
					id="C3">
						<div class="screen">
							<div class="top">식료퓸</div>
							<div class="bottom">Groceries</div>
							<img
								src="<%=request.getContextPath()%>/resources/images/Groceries.jpg">
						</div>
						<div>
							<h3>식품</h3>
						</div>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/funding/beforelist/cateC5"
					id="C5">
						<div class="screen">
							<div class="top">반려동물</div>
							<div class="bottom">Pets</div>
							<img
								src="<%=request.getContextPath()%>/resources/images/pets.jpg">
						</div>
						<div>
							<h3>반려동물</h3>
						</div>
				</a></li>
				<li><a
					href="<%=request.getContextPath()%>/funding/beforelist/cateC6">
						<div class="screen" id="C6">
							<div class="top">기타 등등</div>
							<div class="bottom">Etc</div>
							<img src="<%=request.getContextPath()%>/resources/images/etc.jpg">
						</div>
						<div>
							<h3>기타</h3>
						</div>
				</a></li>
			</ul>
		</div>
		<hr style="border-style: outset; margin-top: 10px;">

		<div class="productWrap">
			<ul class="imglist_ul">
				<c:forEach items="${preProducts}" var="product">
					<li class="itemsWrap"><a
						href="<%=request.getContextPath()%>/funding/info/before/${product.p_no}">
							<div class="screen">
								<span></span><span></span><span></span><span></span> <img
									src="${product.p_thumbnail}">
							</div>
							<div class="nameWrap" style="overflow: hidden; height: 60px;">
								<h4 style="font-size: 16px;">${product.p_name}</h4>
								<h5 style="font-size: 15px; color: #ccc;">${product.category_name}&nbsp;&nbsp;|
									${product.maker_name}</h5>
							</div>
							<div style="width: 100%; height: 3px; background-color: EF9A9A;"></div>
							<p style="color: black; font-size: 15px;">
								<span style="font-weight: 600; left: -10px; position: relative;">${product.start_day}
									오픈예정! </span>
							</p>
					</a></li>
				</c:forEach>
			</ul>
			<hr style="border-style: outset; margin-bottom: 10px;">
		</div>
		<a id="topBtn" href="#"> <img
			src="<%=request.getContextPath()%>/resources/images/up.png"
			class="topImg">
		</a>
	</div>
	<button class="moreView btn btn-fill-fcolor" id="moreView"
		style="display: flex; font-size: 20px;">상품 더보기</button>



	<script>
		/* 	맨 위로 올라가기 버튼 */
		$(function() {

			$(window).scroll(function() {
				if ($(this).scrollTop() > 250) {
					$('#topBtn').fadeIn();
				} else {
					$('#topBtn').fadeOut();
				}
			});
			$("#topBtn").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>
	<script>
		/* 상품 더 불러오기 버튼 */
		$(function() {
			$(".itemsWrap").hide();
			$(".itemsWrap").slice(0, 12).show();

			$(".moreView").click(function() {
				$(".itemsWrap:hidden").slice(0, 12).show();
				if ($(".itemsWrap:hidden").length == 0) {
					alert("마지막 상품 조회입니다.");
					$("#moreView").hide();
				}
				;
			});
		});
	</script>
	<jsp:include page="../footer.jsp" />
</body>

</html>