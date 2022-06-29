<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 상품 옵션설정</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/option/optionInsert" method="post">
<div>
  <h2 id="_title"> 옵션등록 </h2>
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

<div>
    <input type="submit" id="btn_register" value="등록">
    <input type="button" value="취소" >
</div>
</form>



</body>
</html>