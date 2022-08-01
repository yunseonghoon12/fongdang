<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kh.spring.fongdang.member.domain.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/maker_header.css">
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/button.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script> 
     $.noConflict(); //이때부터 jQuery는 $ 식별자를 포기하고 jQuery() 를 사용함    
	var _$ = jQuery 
    </script> 
<div class="headerWrap" style="position: relative;top: -16px;">
	<header class="site__header" style="margin: 0 auto;width=1280px;    font-family: 'SUIT-Regular';">
		<nav>
			<a href="<%=request.getContextPath()%>"> <img
				src="<%=request.getContextPath()%>/resources/images/logo.png"
				id="logo"></a>
			<ul class="menu" style="position: relative;">
				<li><a href="<%=request.getContextPath()%>/funding/beforelist">펀딩예정</a></li>
				<li><a href="<%=request.getContextPath()%>/funding/list">펀딩상품</a></li>
				<li><a href="#">고객센터</a>
					<ul class="dep2">
						<li><a href="#">공지사항</a></li>
						<li><a href="<%=request.getContextPath()%>/customerCenter/ask">1:1 문의</a></li>
						<li><a href="#">이용가이드</a></li>
						<li><a href="<%=request.getContextPath()%>/customerCenter/road">오시는길</a></li>
					</ul></li>
				
				<li>
				
					<form action="<%=request.getContextPath()%>/funding/list.search" method="GET"
						style="margin-left: 344px; width: 300px;">
						
						<div class="mx-auto mt-5 search-bar input-group mb-3">
							<input name="search_categroy" type="search" class="form-control rounded-pill"
								id="header_textbox" placeholder="category 검색">
							<div class="input-group-append"></div>
						</div>					
						<label for="header_textbox"><img
							src="<%=request.getContextPath()%>/resources/images/magnifying.png"
							class="question_header"></label>
					</form>
					<div class="searchR" style="right: 63px;">
						<p style="text-align: center;">카테고리</p>
						<hr style="margin-top: 10px;">
						<ul>
							<li><a href="<%=request.getContextPath()%>/funding/list/cateC5"><p>반려동물</p></a></li>
							<li><a href="<%=request.getContextPath()%>/funding/list/cateC4"><p>캠핑</p></a></li>
							<li><a href="<%=request.getContextPath()%>/funding/list/cateC3"><p>식품</p></a></li>
							<li><a href="<%=request.getContextPath()%>/funding/list/cateC1"><p>테크·가전</p></a></li>
							<li><a href="<%=request.getContextPath()%>/funding/list/cateC2"><p>뷰티</p></a></li>
							<li><a href="<%=request.getContextPath()%>/funding/list/cateC6"><p>기타</p></a></li>
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
							<li style="top: 10px;"><a href="<%=request.getContextPath()%>/member/myfongdang" id="">내정보<%-- <img
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
					<li><a href="<%=request.getContextPath()%>"
						>메인으로 나가기</a></li>
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
        _$(".form-control").on("click", function () {
            _$(".searchR").show();
        });
        _$(".header_x").on("click", function () {
            _$(".searchR").hide();
        });
    </script>
	</header>
</div>