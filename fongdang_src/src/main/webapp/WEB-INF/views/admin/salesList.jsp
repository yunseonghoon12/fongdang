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
								<c:forEach items="${saleslist }" var="sales">
								<tr>
									<td><a href="<%=request.getContextPath() %>/admin/sales/read?bno=${sales.pno }">${sales.pno }</a></td>
									<td>${sales.pno}</td>
									<td>${sales.pno}</td>
									<td>${sales.pno}</td>
									<td>${sales.pno}</td>
									<td>${sales.pno}</td>
									<td>${sales.pno}</td>
								</tr>
								</c:forEach>
							</table>
							
		                 </div>
	                    </div>
	            </section>
	            
	            


</body>
</html>