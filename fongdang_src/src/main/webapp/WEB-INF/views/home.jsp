<%@page import="kh.spring.fongdang.member.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<script>
	var msg = "${msg}";
	if(msg != '') {
		alert(msg);
	}
</script>
<P>  The time on the server is ${serverTime}. </P>

<c:if test="${empty loginInfo}">
	<div>
		<button type="button" onclick="location.href='<%= request.getContextPath()%>/member/login';">로그인</button>	
	</div>
</c:if>
<c:if test="${!empty loginInfo }">
	<div>
		<button type="button" onclick="location.href='<%= request.getContextPath()%>/member/logout';">로그아웃</button>	
	</div>
</c:if>

</body>
</html>
