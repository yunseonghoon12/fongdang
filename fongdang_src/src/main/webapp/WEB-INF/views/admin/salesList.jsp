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
		                     <thead>
		           
								  <tr id=title>
								     <th>상품번호</th> 
								     <th>메이커명</th>
								     <th>카테고리</th> 
								     <th>메이커유형</th>
								     <th>목표금액</th>
								     <th>총펀딩금액</th>
								     <th>정산금액</th>
								     <th>수수료</th>
								     
								  </tr>
							 <thead>
							 <!-- 리턴 받는 값 request.setAttribute("retVolist", retVolist); -->
							    <c:forEach items="${retVolist }" var="vo">
									<tr>
									     <td>${vo.}</td> 
									   	 <td>${vo.}</td>
									     <td>${vo.}</td> 
									     <td>${vo.}</td>
									     <td>${vo.}</td>
									     <td>${vo.}</td>
									     <td>${vo.}</td>
									     <td>${vo.}</td>
								     </tr>
								  </c:forEach>
	       	                 </table>
		                 </div>
	                    </div>
	            </section>


</body>
</html>