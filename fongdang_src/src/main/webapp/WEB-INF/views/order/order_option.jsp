<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Order.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
</head>
<body>
    <div class="container">
        <header style="width:100%;height:100px;">
            <div style="width:100%;height:100px;text-align: center;">
            <jsp:include page="../header.jsp"/>
            </div>
        </header>
        <div class="somenail">
            <dl>
                
            </dl>
        </div>
        <div class="wrap">
            <div class="wrap_container">
                <div class="step_wrap">
                    <div class="step" id="step_one">
                        <span>옵션 선택</span>
                    </div>
                    <li style="width:40px;display:inline-block;border:1px dashed rgb(217, 217, 217);"></li>
                    <div class="step" id="step_two">
                        <span>정보 확인</span>
                    </div>
                    <li style="width:40px;display:inline-block;border:1px dashed rgb(217, 217, 217);"></li>
                    <div class="step" id="step_three">
                        <span>펀딩 완료</span>
                    </div>
                </div>
            </div>
            <div class="wrap_container2">
                    <div class="option_wrap">
                        <div class="for_border"></div>
                        <div class="option_top">
                            <h2 style="float:left;margin-bottom: 40px;">옵션 선택</h2>
                        </div>
                        <c:forEach items="${order}" var="order">
                        <div class="option">
                            <ul>
                                <li id="price">
                                    <div class="agree">
                                        <dl class="agree2">
                                            <dt class="all_agree">
                                                    <input type="checkbox" id="chb">
                                                    <label for="chb">
                                                        <span>
                                                        
                                                        </span>
                                                </label>
                                            </dt>
                                            <dd class="all_agree2">
                                                <input type="hidden" name="상품 넘버">
                                                <input type="hidden" name="상세 옵션 넘버">
                                                <p class="option_name">${order.option_name}</p><p class="option_name" id="un">(마감)</p>
                                                <p class="option_info">${order.option_info}</p>
                                                <p class="option_limit">${order.option_limit}</p>
                                                <p class="option_price">${order.option_price}</p>
                                            </dd>
                                        </dl>   
                                        <dl style="margin-bottom:20px;visibility:none">
                                            <p class="option_sum"><input type="text" id="amount" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"class="text"value=""></p>
                                        </dl>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="total_wrap">
                        <div class="price_wrap">                            
                             <p>${delivery_date}에 배송 예정</p>
                        </div>
                        <div class="button_wrap">
                            <button type="submit" id="button_next" data-toggle="modal" data-target="#exampleModalCenter">
                                next step
                            </button>
                        </div>
                        <div style="width:100%;height:10px;margin-bottom:200px;display:block;">
                            <div>
                                
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
       <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form method="post" id="order_form">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">주문 정보 확인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div>
                        <p>
                            상품명: <input type="text" name="p_name" readonly="readonly" value="${product.p_name}">
                        </p>
                        <p>
                            옵션명: <input type="text" name="option_name" readonly="readonly" value="${order.option_name}">
                        </p>
                        <p>
                            수량: <input id="total_amount" type="text" name="amount" readonly="readonly" value="">
                        </p>
                        <p class="p_no" style="display:none">
                           <input type="hidden" name="p_no" value="${product.p_no}">
                        </p>
                        <p class="p_no" style="display:none">
                            <input type="hidden" name="option_no" value="${order.option_no}">
                        </p>
                        <p style="display:none">
                            
                            <input type="hidden" name="payment_plan" value="${product.payment_plan}">
                        </p>
                    </div>
                    <div style="border-top:1px solid rgb(221, 221, 221);border-bottom:1px solid rgb(221, 221, 221)">
                        <p style="margin-top:15px;">
                            개당 상품금액: <input type="text" name="option_price" value="${order.option_price}">
                        </p>
                    </div>
                    
                </div>
                <div class="modalFooter">
                    <button type="button" id="submit" class="btn5">결제 페이지로</button>
                </div>
                </form>
            </div>
        </div>
    </div>
        <footer style="height:100px;background:aqua;">
            <div style="height:100px;text-align: center;">
                <jsp:include page="../footer.jsp"/>
            </div>
        </footer>
</body>
<script>
        
    $(".agree2").click(function(){
        var $thisCheckbox = $(this).find("[type=checkbox]");
        $thisCheckbox.prop("checked", function(){
           return !$(this).prop("checked");
        });  
    });
    var thisCheckbox1 = document.getElementById('chb');
    var text1 = document.querySelector('.option_sum');
$(function(){
   if(thisCheckbox1.checked == true){
    text1.style.display="inline-block";
   }else{
    text1.style.display="none";
   }
});

    const text = document.querySelector('.agree2');
    text.addEventListener('click',function(){
        document.querySelector('.agree').classList.toggle('color');
    });
    
   
</script>
<script>
	var test= document.getElementById('amount').value;
	document.getElementById("total_amount").value = test;
</script>
<script>
$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
</script>
<script>
$(document).ready(function() {    
    $("#submit").click(function () {
    	var form = $("#order_form")[0];
    	var formData = new FormData(form);
    	
    	$.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/order/insert",
            processData : false, //데이터 객체를 문자열로 바꿀지에 대한 값 true=일반문자/ false=데이터객체
			contentType : false, //일반 text인지 구분하는 값 true이면 일반 텍스트로 구분
            data: formData,
            success: function (result) {
                console.log(result);
                if(result == 0){
                	alert("로그인을 한 후에 주문이 가능합니다. 로그인 페이지로 이동합니다.");
					location.href = "<%=request.getContextPath()%>/member/login";
                }else{
                	alert("결제 페이지로 이동합니다.");
                	let url = "<%=request.getContextPath()%>/pay/pay?order_no=${result}";
                	location.replace(url);
                }
            },
   			error : function (result) {
   				alert("에러 발생.");
   				console.log(result);
    		}
    	});
    });
});
</script>
</html>