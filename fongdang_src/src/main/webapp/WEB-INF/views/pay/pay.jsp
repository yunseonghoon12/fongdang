<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript" src="/jquery-3.6.0.min.js"></script>
  <script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Document</title>
    <style>
        
    
    body{min-height: 100%}
    * {
        margin: 0px;
        padding: 0px;
    }
    a, address, article, aside, audio, 
    b, body, button, canvas, caption, 
    dd, div, dl, dt, em, embed, 
    fieldset, figcaption, figure, 
    footer, form, h1, h2, h3, h4, h5, h6, 
    header, html, i, img, input, label,
     legend, li, nav, ol, p, pre, 
     section, small, span, strong, 
     summary, table, tbody, td, th, thead,
      time, tr, ul, video
    {
        vertical-align: baseline;
        font: inherit;
        box-sizing: border-box;
    }
    ul, ol {
        list-style: none;
    }

    a {
        text-decoration: none
    }
    .container{
        text-align:center
    }
    .wrap{
        
        display: inline-block;
    }
    .wrap_container{
        text-align: center;
    }
    .step_wrap{
        margin-top:20px;
        margin-right:20px;
        margin-left:20px;
        width:800px;
        height:150px;
        border-bottom:1px solid rgb(220, 220, 220);
        display: inline-block;
    }
    .step{
        background-color:rgb(235, 235, 235);
        width:100px;
        height:100px;
        border-radius: 50px;
        text-align: center;
        display: inline-block;
        margin-top:20px;
    }
    .step>span{
        display: inline-block;
        width:60px;
        height:30px;
        margin-top:41px;
        font-size:16px;
    }
    .wrap_container2{
        width: 100%;
        
       

    }
    
    .option_wrap{
        width:100%;
        position:relative;
        border-bottom: 1px solid rgb(217, 217, 217);
        
    }
    .option_top{
        width:800px;
        height:50px;
        margin:0 auto;
        
        
        
        
        
    }

    .option_top>h2{
        font-size:20px;
        font-weight:500;
        margin-top:10px;
    }
    #step_two{
        background-color:#a9def5
        
    }
    #step_two>span{
        color:rgb(255, 255, 255);
    }
    .option{
        width:800px;
        margin:0 auto;
        height:200px;
        margin-bottom:50px;
        
    }
    .option_map{
        width:400px;
        margin:0 auto;
        height:330px;
        
    }
    .option>ul{
        width:800px;

    }
    .option>ul>li{
        float:left;
        border-radius: 5px;
        width:800px;
    }
    .agree .all_agree input[type="checkbox"] {display: none;}
        .agree .all_agree input[type="checkbox"] {display: none;}

        .agree .all_agree input[type="checkbox"] + label {
            display: inline-block; width:17px; height: 17px; background: #d6ecf5;
            cursor: pointer; border-radius: 3px;float: left;             
        }
        .agree .all_agree:after {
            display:block; clear:both; content:"";
        }
        .agree .all_agree input[type="checkbox"]:checked + label {
            background:url(../image/check.png) #d6ecf5 no-repeat center/20px 20px; float: left;display: inline-block;
        }
        .agree {
            position:relative;
        }
        .agree .all_agree input[type="checkbox"] + label span {
            position: absolute; top: 0; left:0px; display: block; font-weight: bold;
        }
        .agree{
            border-radius: 8px;
            position:relative;
            background: rgb(240, 240, 240);
            border:1px solid #ffffff
            
            
        }

        .agree:hover{
            cursor: pointer;
            background: #d6ecf5;
        }
        .agree:active{
            
            
            cursor: pointer;
        }
      
        .somenail{
            background-color: rgb(232, 208, 177);
            height:70px;
            text-align: center;
            border: 1px solid rgb(210, 178, 136)
        }
        .somenail>dl{
            width:800px;
            height:30px;
            text-align: center;
            margin:0 auto;
        }
        .somenail>dl>dt{
            margin-top:20px;
            display:inline-block;
            font-size: 23px;
        }
        .somenail>dl>dd{
            display:inline-block;
            font-size: 18px;
        }
        .all_agree{
            display: inline-block;
            position:absolute;
            right:30px;
            top:40px;
        }
        .all_agree2{
            margin:20px;
            position: relative;
        }
    .option_price{
        
        
        
        
    }
    .p_name{
        text-align: left;
        font-size: 20px;
        font-weight: 500;
        margin-bottom: 10px;
        color:#a9def5;
        margin-left:20px;
    }
    .option_name{
        float:left;
        margin-left:20px;
        width:780px;
        text-align: left;
    }

    .option_info{
        
        
    }
    .total_wrap{
    width:800px;
    margin:0 auto;
    margin-bottom:100px;
    margin-top: 50px;
    }
    .price_wrap{
    font-size: 20px;
    margin-bottom:3px;
    }
    .button_wrap{
        margin-top:20px;
        
    }
    .cupang_wrap{
        font-size: 14px;
    }
    #button_next{
        width:120px;
        height:50px;
        border: 1px solid #d6ecf5;
        background-color:  #e0f1f8;
        border-radius: 4px;
        font-size: 18px;
    }
    #button_next:hover{
        background-color:#a9def5;
        cursor: pointer;
        transition: all 0.2s;
    }
    .option_info{
        width:750px;
        text-align:left;
        position:relative;
        display:inline-block;
        
        color:gray;

        
    }
    
    .option_limit{
        width:750px;
        display:inline-block;
        text-align:left;
        position:relative;
     
        color:gray;
    }
    .option_price{
         margin-top:20px;
        margin-left:20px;
        float:right;
        
       
    }
    .option_s{
        float:left;
    
    margin-left:20px;
    }
    .option_sum{
        
        
    margin-left:20px;
        float:right;
        
    }
    #un{
        display: none;
    }
    .text{
        margin-top:10px;
        width:80px;
        height:30px;
        border-radius: 4px;
        border:1px solid #a9def5;
    }
    .color{
        background: #a9def5;
    }
    .options{
        height:120px;
        border-bottom:1px solid rgb(212, 212, 212);
        margin-top:20px;
        padding-right:20px;
    }
    .address_button{
        width:90px;
        float:left;
    }
    .address_button:hover{ 
        cursor: pointer;
        background-color: rgb(182, 182, 182);
    }
    .support_input{
    border-radius: 3px;
    border:1px solid rgb(146, 146, 146);
    height:35px;
    }
    .address_input_1{
        border-radius: 3px;
    border:1px solid rgb(146, 146, 146);
    height:35px;
    }
    .address_input_2{
        border-radius: 3px;
    border:1px solid rgb(146, 146, 146);
    height:35px;
    }
    .address_input_3{
        border-radius: 3px;
    border:1px solid rgb(146, 146, 146);
    height:35px;
    }
    .btn5{
        background-color: #a9def5;
        border-radius: 5px;
        width:100px;
        height:40px;
        border:none;
        font-weight:bold;
        
    }
    .btn5:hover{
        background-color: #9bbfd9;
        transition: all 0.2s;
    }
    .modalFooter{
        text-align: center;
        margin-bottom:20px;
    }
   
</style>
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
                <dt>${p_name}</dt>
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
                        <div class="for_border">
                        </div>
                        <div class="option">
                           <div class="options">
                            <p class="p_name">${p_name}</p>
                            <p class="option_name">${option name}</p>
                            <p class="option_s">수량:</p>
                            <p class="option_sum">${amount}</p>
                            <p class="option_sum">${total_price}</p>
                            </div>
                          
                           <div style="padding-right:20px;border-bottom:1px solid rgb(212, 212, 212);height:60px;margin-top:40px;">
                                    <p class="option_s" style="font-weight:600;font-size:18px">리워드 합계 금액:</p>
                                    <p class="option_sum" style="font-weight:600;font-size:20px">option_price_sum</p>
                            </div>
                        </div>
                        <div class="option_map" style="display:inline-block;">
                            <div style="height:30px;margin:20px;">
                                <h2 style="float:left;font-weight:600;font-size:20px;">배송 정보 입력</h2>
                            </div>
                            <div class="address_wrap" style="">
                                <div class="address_name" style="float:left;height:20px;width:400px;text-align: left;margin-left:20px; margin-bottom:10px;"><p style="display:inline-block;">주소</p></div>
                                <div class="address_input_1_wrap" style="float:left;height:40px;width:400px;text-align: left;margin-left:20px;">
                                    <div class="address_input_1_box" style="float:left;">
                                        <input class="address_input_1" name="memberaddr1" readonly="readonly" style="width:250px;">
                                    </div>
                                    <div class="address_button" onclick="execution_daum_address()" style="border:1px solid rgb(224, 224, 224);height:35px;border-radius: 5px;background-color: rgb(236, 236, 236);margin-left:10px;text-align: center;padding-top:6px;">
                                        <span style="margin: 0 auto;">주소 찾기</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="address_input_2_wrap" style="float:left;height:40px;width:400px;text-align: left;margin-left:20px;">
                                    <div class="address_input_2_box">
                                        <input class="address_input_2" name="memberaddr2" readonly="readonly" style="width:350px;">
                                    </div>
                                </div>
                                <div class="address_input_3_wrap" style="float:left;height:40px;width:400px;text-align: left;margin-left:20px;">
                                    <div class="address_input_3_box">
                                        <input class="address_input_3" name="memberaddr3" readonly="readonly" style="width:350px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="option_map" style="display:inline-block;padding-left:50px;">
                            <div style="height:30px;margin:20px;">
                                <h2 style="float:left;font-weight:600;font-size:20px;">서포터 정보 입력</h2>
                            </div>
                            <div class="address_wrap" style="">
                                <div class="address_name" style="float:left;height:20px;width:400px;text-align: left;margin-left:20px; margin-bottom:10px;"><p style="display:inline-block;">이름</p></div>
                                <div class="address_input_1_wrap" style="float:left;height:40px;width:400px;text-align: left;margin-left:20px; margin-bottom:10px;">
                                    <div class="address_input_1_box" style="float:left;">
                                        <input class="support_input" name="supporter1"style="width:300px;">
                                    </div>
                                    <input type="hidden" name="amount" value="${amount}">
                                    <input type="hidden" name="order_no" value="${order_no}">
                                    <input type="hidden" name="p_no" value="${p_no}">
                                    <input type="hidden" name="total_price" value="${total_price}">
                                    <div class="clearfix"></div>
                                </div>
                                <div class="address_name" style="float:left;height:20px;width:400px;text-align: left;margin-left:20px; margin-bottom:10px;"><p style="display:inline-block;">휴대폰 번호</p></div>
                                <div class="address_input_2_wrap" style="float:left;height:40px;width:400px;text-align: left;margin-left:20px;margin-bottom:10px;">
                                    <div class="address_input_2_box">
                                        <input class="support_input" name="supporter2" style="width:300px;">
                                    </div>
                                </div>
                                <div class="address_name" style="float:left;height:20px;width:400px;text-align: left;margin-left:20px; margin-bottom:10px;"><p style="display:inline-block;">이메일</p></div>
                                <div class="address_input_3_wrap" style="float:left;height:40px;width:400px;text-align: left;margin-left:20px;margin-bottom:10px;">
                                    <div class="address_input_3_box">
                                        <input class="support_input" name="supporter3" readonly="readonly" style="width:300px;" value="${email}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="total_wrap">
                        <div class="price_wrap">
                            <p>${p_name}에 ${total price} 원을 펀딩합니다.</p>
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
                <form action="" method="POST">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">주문 정보 확인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div>
                        <p>
                            상품명: ${p_name}
                        </p>
                        <p>
                            옵션명: ${option_name}
                        </p>
                        <p>
                            수량: ${amount}
                        </p>
                        <p class="p_no" style="display:none">
                            ${p_no}
                        </p>
                        <p class="p_no" style="display:none">
                            ${option_no}
                        </p>
                        <p style="display:none">
                            ${email}
                        </p>
                    </div>
                    <div style="border-top:1px solid rgb(221, 221, 221);border-bottom:1px solid rgb(221, 221, 221)">
                        <p style="margin-top:15px;">
                            총 결제금액: <input type="text" name="total_sum" readonly="readonly" value="">
                        </p>
                    </div>
                    
                </div>
                <div class="modalFooter">
                    <button type="submit" class="btn5">결제 페이지로</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
<footer style="height:100px;">
    
</footer>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execution_daum_address(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    addr += extraAddr;
                
                } else {
                    addr += ' ';
                }
 
                $(".address_input_1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $(".address_input_2").val(addr);
            //$("[name=memberAddr2]").val(addr);  
                // 커서를 상세주소 필드로 이동한다.
                $(".address_input_3").attr("readonly",false);
            $(".address_input_3").focus();
        }
    }).open();
}
</script>
<script>
	function priceAmount(){
		var price = $("input[name='total_price']").val(),
		var amount = $("input[name='amount']").val(),
		var total_sum = price * amount +3000;
		return total_sum;
	}
	$(function(){
		$("input[name='total_sum']".val() = priceAmount());
	})
    function payment(){
        const data={
        	pay_no : createPayNo(),
            order_no : $("input[name='order_no']").val(),
            p_no : $("input[name='p_no']").val(),
            amount : $("input[name='total_sum']").val(),
            email : $("input[name='supporter3']").val(),
            order_name : $("input[name='supporter1']").val(),
            order_phone : $("supporter2").val(),
            order_address1 : $("input[name='memberaddr1']").val(),
            order_address2 : $("input[name='memberaddr2']").val(),
            order_address3 : $("input[name='memberaddr3']").val(),
            totalSum :  $("input[name='total_sum']").val(),
            payment_method : 'card'
        }
        if(!data.deleeveryAddress){
            swal("배송지를 입력해주세요");
            return;
        }
        if(!data.phone){
            swal("전화번호를 입력해주세요");
            return;
        }
        paymentCard(data)
    }
    // 주문번호 만들기
    function createPayNo(){
        const date = new Date();
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, "0");
        const day = String(date.getDate()).padStart(2, "0");
        
        let pay_no = year + month + day;
        for(let i=0;i<10;i++) {
            pay_no += Math.floor(Math.random() * 8);	
        }
        return pay_no;
    }

        
		//가맹점 식별코드
        function paymentCard(data){
            
            IMP.init('imp04215728');
            IMP.request_pay({
                pg : 'html5_inicis,
                pay_method : 'card',
                merchant_uid : data.pay_no,
                name : data.order_name , //결제창에서 보여질 이름
                amount : data.amount, //실제 결제되는 가격
                buyer_email : data.email,
                buyer_name : data.order_name,
                buyer_tel : data.order_phone,
                buyer_addr : data.order_address1 + " " + data.order_address2 + " " + data.order_addrress3, 
                buyer_postcode : data.order_address1,
            }, function(rsp) {
                console.log(rsp);
                if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    paymentComplete(data);
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
	}

    function paymentComplete(data){

        $.ajax({
            url: "<%=request.getContextPath()%>/pay/insert",
            method: "POST",
            data: data,
        })
        .done(function(result){
            messageSend();
            swal({
                text: result,
                closeOnClickOutside :false
            })
            .then(function(){
                location.replace("/pay");
            })
        })
        .fail(function(){
            alert("에러");
            location.replace("/")
        })
    }
    $('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
</script>
</html>