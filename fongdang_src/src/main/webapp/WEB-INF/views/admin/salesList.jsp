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
								<c:forEach items="${salesList }" var="sales">
								<tr>
									<td><a href="<%=request.getContextPath() %>/admin/sales/read?bno=${sales.P_NO }">${sales.P_NO }</a></td>
									<td>${sales.maker_name}</td>
									<td>${sales.category_id}</td>
									<td>${sales.p_goal}</td>
									<td>${sales.total_funding_money}</td>
									<td>${sales.sales_funding_money}</td>
									<td>${sales.commission}</td>
								</tr>
								</c:forEach>
							</table>
							
		                 </div>
	                    </div>
	            </section>
	            
	            


</body>
</html>