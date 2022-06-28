<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="kh.spring.fongdang.member.domain.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
</head>
<body>

							<%
					    Member ssvo = (Member)session.getAttribute("ssMV");
						
						%>
	<c:choose>
	<c:when test="${empty option }">
	<div>no reward</div>
	</c:when>
	<c:otherwise>
	<form action="<%= request.getContextPath()%>/order/insert" method="post">
	<c:forEach items="${option }" var="option">
		<div>
		<!-- 상세상품 정보 가져오기 체크된 항목만 넘기 -->
		<input type="text" name="p_no" value="orderpage">
			<input type="checkbox" value="상품정보 가져오기">
			<input type="text" name="option_no" value="orderpage">
		</div>
		</c:forEach>
		<input type ="hidden" name="email" value="session">
		<input type="text" name="order_no" value="pk/sequence">
		<input type="text" name="total_price" value="상품가격*갯수 + 베송비">
		<input type="text" name="payment_plan" value="productpage">
		<button type="submit">결제페이지로</button>
	</form>
	</c:otherwise>
	</c:choose>
</body>
</html>