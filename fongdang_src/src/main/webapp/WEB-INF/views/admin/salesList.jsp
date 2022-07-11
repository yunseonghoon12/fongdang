<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salesList</title>
</head>
<body>


           <section>
	                <div id="salesList">
	               	   <p class="salesList-title">펀딩매출관리</p>
		               <div class="salesList-tableAll">
		                    <table class="salesList-tableAll">
		                		<tr>
									<td>상품번호</td>
									<td>메이커명</td>
									<td>카테고리</td>
									<td>목표금액</td>
									<td>총펀딩금액</td>
									<td>정산금액</td>
									<td>수수료</td>
								</tr>
								<c:forEach items="${boardlist }" var="board">
								<tr>
									<td><a href="<%=request.getContextPath() %>/sales/read?bno=${sales.bno }">${sales.bno }</a></td>
									<td><a href="<%=request.getContextPath() %>/board/read?bno=${board.bno }">${board.btitle } [${board.rcnt }]</a></td>
									<td>${sales.bno}</td>
									<td>${sales.bno}</td>
									<td>${sales.bno}</td>
									<td>${sales.bno}</td>
									<td>${sales.bno}</td>
								</tr>
								</c:forEach>
							</table>
							
		                 </div>
	                    </div>
	            </section>
	            
	            


</body>
</html>