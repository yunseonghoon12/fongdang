<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜로그인 - testPage</title>
</head>
<body>	
	<script>
		var authInfo = '<%=request.getAttribute("kakaoInfo")%>';
		console.log(authInfo);
	</script>
	<!-- 카카오 로그아웃  -->
	<a href="https://kauth.kakao.com/oauth/logout?client_id=<spring:eval expression="@property['kakao.api_key']"/>&logout_redirect_uri=<spring:eval expression="@property['kakao.logout_redirect_uri']"/>">
		카카오 로그아웃
	</a>
	<hr>
	<div style="text-align:center">${result}</div>	
	<hr>
	<p style="color:blue; text-align: center; font-size: 17px;">
<%
	String nickname= (String)session.getAttribute("sessionId");
%>
		닉네임: ${nickname}
	</p>
	
<c:if test="${empty sessionId }">
	<a href="<%=request.getContextPath()%>/login">네이버 로그인</a>
</c:if>	
<c:if test="${!empty sessionId }">
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
	<a href="http://nid.naver.com/nidlogin.logout">네이버 로그아웃</a>
</c:if>




	<script type="text/javascript">
		var result = '${result}';
		var nickname = '${nickname}';
		var email = '${email}'; 
		var name = '${name}'
		console.log(result);
		console.log("nickname: " + nickname);
		console.log("email: " + email);
		console.log("name: " + name);	
	
		$("#naverLogout").click(function() {
			sessionStorage.clear();
			location.href="<%=request.getContextPath()%>/login";
		}); 		
	</script>
</body>
</html>