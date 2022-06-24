<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
<form action="<%=request.getContextPath()%>/" method="post">
<div>
  <h2 id="_title"> 펀딩상품등록 </h2>
</div>
<div>카테고리<a id="essential">*</a> 
    <select name="category_id" >
        <option value="캠핑">캠핑</option>
		<option value="식품">식품</option>
        <option value="테크 ⠂가전">테크 ⠂가전</option>
        <option value="뷰티">뷰티</option>
        <option value="반려동물">반려동물</option>
        <option value="기타">기타</option>
    </select>
</div>
<div>상품이름<a id="essential">*</a>
    <input type="text" name="p_name">
</div>

<div>상품 대표이미지<a id="essential">*</a> 
    <input type="file" name="p_thumbnail">
</div>
<div>펀딩 기간설정<a id="essential">*</a>
</div>

<div>펀딩시작일 
    <input type="text" name="start_day" id="">
</div>
<div>펀딩종료일 
    <input type="text" name="end_day" id="">
</div>
<div>결제예정일 
    <input type="text" name="payment_plan" id="">
</div>
<div>발송예정일 
    <input type="text" name="delivery_date" id="">
</div>
<div>목표금액<a id="essential">*</a>
    <input type="text" name="p_goal" id="">
</div>
<div>상품옵션 설정<a id="essential">*</a>
    <br>최대 5개까지 설정가능합니다.
</div>
<div>
  옵션가격 <input type="text" name="option_price"> 옵션이름 <input type="text" name="option_name"> 옵션정보 <input type="text" name="option_info"> 제한수량 <input type="text" name="option_limit">
</div>
<div>
    옵션가격 <input type="text" name="option_price"> 옵션이름 <input type="text" name="option_name"> 옵션정보 <input type="text" name="option_info"> 제한수량 <input type="text" name="option_limit">
</div>
<div>
    옵션가격 <input type="text" name="option_price"> 옵션이름 <input type="text" name="option_name"> 옵션정보 <input type="text" name="option_info"> 제한수량 <input type="text" name="option_limit">
</div>
<div>
    옵션가격 <input type="text" name="option_price"> 옵션이름 <input type="text" name="option_name"> 옵션정보 <input type="text" name="option_info"> 제한수량 <input type="text" name="option_limit">
</div>
<div>
    옵션가격 <input type="text" name="option_price"> 옵션이름 <input type="text" name="option_name"> 옵션정보 <input type="text" name="option_info"> 제한수량 <input type="text" name="option_limit">
</div>
<br>

<div>상품 요약<a id="essential">*</a>
    <input type="text" name="p_summary">
</div>
<div>상품상세정보<a id="essential">*</a>
    <input type="text" name="p_story">
</div>
<div>상품관련 인증증명서<a id="essential">*</a> 
    <input type="file" name="p_certification">
</div>

<div>
    <p> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
    정책 확인 동의하는 체크박스<a id="essential">*</a>
</div>
<div>
    <input type="submit" id="btn_register" value="등록">
    <input type="button" value="취소" >
</div>
</form>


</body>
</html>