<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
MemberVo ssMV = (MemberVo) session.getAttribute("ssMV");
%> --%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/css/header.css"></script>

<header class="site__header">
	<a href="#"><img src="./image/logo.png" id="Logo" /></a>
	<nav>
		<ul class="menu" style="position: relative; left:1%;">
			<li><a href="#">메인</a></li>
			<li><a href="#">펀딩예정</a></li>
			<li><a href="#">펀딩상품</a></li>
			<li><a href="#">고객센터</a>
				<ul class="dep2">
					<li><a href="#">공지사항</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="#">이용가이드</a></li>
				</ul></li>
			<li><input type="text" id="searchText"
				style="margin-left: 160px;" /></li>


		</ul>
		<ul class="menu2">
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#" id="fdapply">펀딩 프로젝트 신청</a>
				<ul class="dep3">
					<li><a href="#" style="margin-top: 5px;">메이커 신청하기</a></li>
					<li><a href="#" style="margin-top: 5px;">펀딩 오픈프로젝트 신청하기</a></li>
				</ul></li>
			<%-- <c:if test="${empty ssMV}">
		        <a href="#" id="login">로그인</a>
		    </c:if>
		    <c:if test="${not empty ssMV}">
		        <a href="#" id="logout">로그아웃</a>
		    </c:if> 
		    <c:if test="${empty ssMV}">
		        <a href="#" id="login">내정보</a>
		    </c:if>
		     <c:if test="${ssMV.mNickname == '관리자'}">
		        <a href="#" id="">내정보</a>
		    <c:if test="${not empty ssMV}">
		        <a href="#" id="logout">회원가입</a>
		    </c:if>
		    
		    </c:if>  --%>
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
    </script>
</header>