<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
</head>
<body>
    <div class="container">
        <header style="width:100%;height:100px;background:aqua;">
            <div style="width:100%;height:100px;text-align: center;">
                <h1 style="padding:30px 0 ;margin:auto;font-size:25px;width:150px;">header입니다</h1>
            </div>
        </header>
        <div class="somenail">
            <dl>
                <dt>profile of funding</dt>
                <dd><img><a>회사 명</a></dd>
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
                <form method="post" action="">
                    <div class="option_wrap">
                        <div class="for_border"></div>
                        <div class="option_top">
                            <h2 style="float:left;margin-bottom: 40px;;">옵션 선택</h2>
                        </div>
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
                                                <p class="option_name">option_name</p><p class="option_name" id="un">(마감)</p>
                                                <p class="option_info">option_info</p>
                                                <p class="option_limit">option_limit</p>
                                                <p class="option_price">1000000원</p>
                                            </dd>
                                        </dl>   
                                        <dl style="margin-bottom:20px;">
                                            <p class="option_sum"><input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"class="text"value=""></p>
                                        </dl>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="total_wrap">
                        <div class="price_wrap">
                            <p>(profile of funding),(회사명)에게total price 원을 펀딩합니다.</p>
                        </div>
                        <div class="cupang_wrap">
                            <p>when arrived</p>
                        </div>
                        <div class="button_wrap">
                            <button type="submit" id="button_next">
                                next step
                            </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
        <footer style="height:100px;background:aqua;">
            <div style="height:100px;text-align: center;">
                <h1 style="padding:30px 0 ;margin:auto;font-size:25px;width:150px;">footer입니다</h1>
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
</html>