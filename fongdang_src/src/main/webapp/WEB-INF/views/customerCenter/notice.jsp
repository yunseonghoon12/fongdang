<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="container">
	<div class="wrap">
	<c:forEach items="${noticeList}" var="notice">
		
	
	
	
	
	<button type="submit" onclick="location.href='<%=request.getContextPath()%>/notice/delete/n_no=${noticeList.n_no}'"></button>
	</c:forEach>
	</div>
		<p>
			<c:if test="${    startPage    >    1    }">
			<a href="notice/insertList/${startPage-1}">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" var="p">
				<a href="notice/insertList/${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			<c:if test="${endPage < totalPageCnt}">
			<a href="notice/insertList/${endPage+1}">다음</a>
			</c:if>
		</p>
</div>
<div style="margin-top: 65px;">
	<jsp:include page="../footer.jsp" />
</div>
</body>
<script>

</script>
</html>