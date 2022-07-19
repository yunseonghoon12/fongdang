<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜로그인 - testPage</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<style>
	.box {		
		border-bottom: 1px solid orange;
	}
	.JSON_info {
		margin: 0 auto;
		width: 600px;
		color: navy;
		font-size: 17px;	
	}
	.info {
		margin: 0 auto;
		width: 600px;
		color: blue;
		font-size: 17px;
	}
</style>
<body>	
	<script>
		var authInfo = '<%=request.getAttribute("kakaoInfo")%>';
		console.log(authInfo);
	</script>
	
	<div class="box">
		<h3>네이버 회원 정보</h3>
		<div class="JSON_info">${naverInfo}</div>	
		<p class="info">
			email:${naver_email}<br>
			name:${naver_name}<br>
			nickname:${naver_nickname}
		</p>
		<!-- 네이버 로그인 & 로그아웃 -->
<c:if test="${empty naverInfo }">
		<a href="<%=request.getContextPath()%>/login">네이버 로그인</a>
</c:if>	
<c:if test="${!empty naverInfo }">
		<%-- <a href="<%=request.getContextPath()%>/logout">네이버 로그아웃</a> --%>
<%-- 1. 실패  
		<a href="${logout_URL}">네이버 로그아웃</a> 
--%>
<!-- 2. 실패 
	로그아웃이 되긴하는데 redirect 되는 곳이 네이버 href="http://nid.naver.com/nidlogin.logout" 
-->
<!-- 3. 실패 -> 컨트롤러에서 session.invalidate()를 시도해도 토큰이 없어지지 않아 js에서 사용해봤지만 여전히 안됨
		<button type="button" id="naverLogout">네이버 로그아웃</button> 
-->			
<!-- 4. ajax를 통해 연동해제 URL 갔다 오기 -->	
		<!-- <button id="naverLogout" onclick="logoutWithNaver()">네이버 로그아웃</button> -->
		<a href="http://nid.naver.com/nidlogin.logout">네이버 로그아웃</a>
</c:if>		
	</div>
	
	<div class="box">
		<h3>카카오 회원 정보</h3>
		<div class="JSON_info">${kakaoInfo}</div>
		<p class="info">
			email:${kakao_email}<br>
			name:${kakao_name}<br>			
		</p>
		<!-- 카카오 로그인 & 로그아웃 -->
<c:if test="${empty kakaoInfo}">
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=<spring:eval expression="@property['kakao.api_key']"/>&redirect_uri=<spring:eval expression="@property['kakao.redirect_uri']"/>&response_type=code">
			로그인
		</a>		
</c:if>	
<c:if test="${!empty kakaoInfo}">
		<a href="https://kauth.kakao.com/oauth/logout?client_id=<spring:eval expression="@property['kakao.api_key']"/>&logout_redirect_uri=<spring:eval expression="@property['kakao.logout_redirect_uri']"/>">
			카카오 로그아웃
		</a>
</c:if>	

	</div>


	<script type="text/javascript">
	/* 소셜 로그인 후 가져온 값 확인 */
		var result1 = '${naverInfo}';		
		var naver_email = '${naver_email}';		
		var naver_name = '${naver_name}';
		var naver_nickname = '${naver_nickname}';
		
		var result2= '${kakaoInfo}';
		var kakao_email= '${kakao_email}';
		var kakao_nickname= '${kakao_nickname}';
		
		console.log("\n" + result1);
		console.log("\n[네이버 회원정보]");		
		console.log("email: " + naver_email);		
		console.log("name: " + naver_name);
		console.log("nickname: " + naver_nickname + "\n");
		
		console.log("\n" + result2);
		console.log("\n[카카오 회원정보]");
		console.log("email: " + kakao_email);		
		console.log("nickname: " + kakao_nickname + "\n");
				
		
		function logoutWithNaver() {
			var logout_url;
			// 1. 네이버 로그아웃 URL 얻기
			// 2. 로그아웃 URL 갔다오기
			// 3. 메인 화면으로 이동							
		}
	</script>
</body>
</html>