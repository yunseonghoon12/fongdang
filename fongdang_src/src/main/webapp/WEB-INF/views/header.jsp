<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kh.spring.fongdang.member.domain.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/button.css">

<div class="headerWrap">
	<header class="site__header" style="margin: 0 auto;width=1280px;">
		<nav>
			<a href="<%=request.getContextPath()%>"> <img
				src="<%=request.getContextPath()%>/resources/images/logo.png"
				id="logo"></a>
			<ul class="menu" style="position: relative;">
				<li><a href="#">펀딩예정</a></li>
				<li><a href="<%=request.getContextPath()%>/funding/list">펀딩상품</a></li>
				<li><a href="#">고객센터</a>
					<ul class="dep2">
						<li><a href="#">공지사항</a></li>
						<li><a href="<%=request.getContextPath()%>/customerCenter/ask">1:1 문의</a></li>
						<li><a href="#">이용가이드</a></li>
					</ul></li>
				
				<li>
				
					<form action="" method="GET"
						style="margin-left: 344px; width: 300px;">
						
						<div class="mx-auto mt-5 search-bar input-group mb-3">
							<input name="a" type="text" class="form-control rounded-pill" id="textbox"
								placeholder="category 검색">
							<div class="input-group-append"></div>
						</div>
							<label for="textbox"><img src="<%=request.getContextPath()%>/resources/images/magnifying.png" class="question_header"></label>
					</form>
					<div class="searchR" style="right: 63px;">
						<p style="text-align: center;">카테고리</p>
						<hr style="margin-top: 10px;">
						<ul>
							<li>반려동물</li>
							<li>캠핑</li>
							<li>식품</li>
							<li>테크·가전</li>
							<li>뷰티</li>
							<li>기타</li>
						</ul>
						<hr style="margin-top: 10px;">
						<p class="header_x"
							style="justify-content: end;; cursor: pointer;">닫기</p>
					</div>
				</li>
			</ul>
			<ul class="menu2">


				<c:if test="${empty loginInfo}">
					<li><a href="<%=request.getContextPath()%>/member/login"
						id="login">로그인</a></li>
					<li><a
						href="<%=request.getContextPath()%>/member/registerForm">회원가입</a></li>
				</c:if>

				<c:if test="${!empty loginInfo}">
					<li style="top: 10px;"><a href="#" id="">알림<%-- <img
						src="<%=request.getContextPath()%>/resources/images/bell.png"
						class="header_loginImg"> --%></a></li>
					<c:if test="${!empty loginInfo}">
						<c:if test="${loginInfo.name ne '관리자'}">
							<li style="top: 10px;"><a href="#" id="">내정보<%-- <img
							src="<%=request.getContextPath()%>/resources/images/mypage.png"
							class="header_loginImg"> --%></a></li>
						</c:if>
						<c:if test="${loginInfo.name eq '관리자'}">
							<li style="top: 10px;"><a
								href="<%=request.getContextPath()%>/member/logout" id="">로그아웃</a></li>
						</c:if>
					</c:if>
				</c:if>
				<c:if test="${loginInfo.name ne '관리자'}">
					<li><a href="<%=request.getContextPath()%>/maker/Register"
						id="fdapply">펀딩 프로젝트 신청</a> <%-- <div class="dep3">
						<ul>
							<li><a href="<%=request.getContextPath()%>/maker/Register">펀딩 오픈프로젝트 신청하기</a></li>
						</ul>
					</div> --%></li>
				</c:if>
				<c:if test="${loginInfo.name eq '관리자'}">
					<li><a href="#">관리자 페이지로 이동</a></li>
				</c:if>
			</ul>
		</nav>
		<script>
        const wrapper = document.querySelector('.site__header');
        const menu = document.querySelector('.menu');
        const menuItem = Array.from(menu.querySelectorAll('li a'));

        menu.addEventListener('click', (e) => {
            let target = e.target;
            menuItem.forEach((item) => item.classList.remove('active'));
            target.classList.add('active');
        });
        $(".form-control").on("click", function () {
            $(".searchR").show();
        });
        $(".header_x").on("click", function () {
            $(".searchR").hide();
        });
    </script>
	</header>
</div>