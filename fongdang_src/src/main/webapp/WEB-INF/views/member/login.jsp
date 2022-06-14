<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<script>
	var msg = "${msg}";
	if(msg != '') {
		alert(msg);
	}
</script>
<hr>
	<form action="<%= request.getContextPath()%>/member/login" method="post">
		<div><input type="text" name="email" placeholder="이메일" required></div>
		<div><input type="password" name="password" placeholder="비밀번호" required></div>		
		<div><button type="submit">로그인</button></div>	
	</form>
</body>
</html>