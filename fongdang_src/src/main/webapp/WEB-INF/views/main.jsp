<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/css/header.css"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>

<body>
	<div id="bannerWrap">
		<div class="slidebox">
			<input type="radio" name="slide" id="slide01" checked> <input
				type="radio" name="slide" id="slide02"> <input type="radio"
				name="slide" id="slide03"> <input type="radio" name="slide"
				id="slide04">
			<ul class="slidelist">
				<li class="slideitem">
					<div>
						<label for="slide04" class="left"></label> <label for="slide02"
							class="right"></label> <a href="#"><img
							src="./image/anigif.gif" /></a>
					</div>
				</li>
				<li class="slideitem">
					<div>
						<label for="slide01" class="left"></label> <label for="slide03"
							class="right"></label> <a><img src="./image/slide02.jpg" /></a>
					</div>
				</li>
				<li class="slideitem">
					<div>
						<label for="slide02" class="left"></label> <label for="slide04"
							class="right"></label> <a><img src="./image/slide03.jpg" /></a>
					</div>
				</li>
				<li class="slideitem">
					<div>
						<label for="slide03" class="left"></label> <label for="slide01"
							class="right"></label> <a><img src="./image/slide04.jpg" /></a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="section">
		<div id="beforeFunding">
			<p>
			<h2>123123</h2>
			</p>
			<div>
				<div>
					<ul class="productWrap">
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
						<li class="product"><a href="#"><img
								src="./image/slide04.jpg" class="img">
								<p>123</p> </a></li>
					</ul>
				</div>
			</div>

		</div>
		<div id="ranking01"></div>
	</div>
	<div class="section02">
		<div class="top3"></div>
		<div class="top3 margin"></div>
		<div class="top3 margin"></div>
	</div>

	<div class="section03">
		<div class="apply"></div>
	</div>
</body>

</html>