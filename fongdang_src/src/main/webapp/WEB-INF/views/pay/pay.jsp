<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
  <script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
    <title>Document</title>

  
    <title>결제</title>
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
        width:700px;
        display: inline-block;
    }
    .wrap_container{
        text-align: center;
    }
   .step_wrap{
        margin-top:20px;
        margin-bottom:20px;
        width:700px;
        height:150px;
        border-bottom:1px solid rgb(220, 220, 220);
        display: inline-block;
    }
    .step{
        background-color:rgb(235, 235, 235);
        width:90px;
        height:90px;
        border-radius: 50px;
        text-align: center;
        display: inline-block;
        margin-top:20px;
    }
       .step>span{
        display: inline-block;
        width:60px;
        height:30px;
        margin-top:38px;
        font-size:14px;
    }
    .wrap_container2{
        width: 100%;
        
       

    }
    
    .option_wrap{
        width:100%;
        padding-bottom:50px;
        position:relative;
        border-bottom: 1px solid rgb(217, 217, 217);
        
    }
    .option_top{
        width:700px;
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
        width:700px;
        margin:0 auto;
        height:200px;
        margin-bottom:50px;
        
    }
    .option_map{
        width:320px;
        margin:0 auto;
        height:300px;
        
    }
    .option>ul{
        width:700px;

    }
    .option>ul>li{
        float:left;
        border-radius: 5px;
        width:700px;
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
            height:50px;
            text-align: center;
            border: 1px solid rgb(210, 178, 136)
        }
        .somenail>dl{
            width:700px;
            height:30px;
            text-align: center;
            margin:0 auto;
        }
        .somenail>dl>dt{
            margin-top:5px;
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
   
    input{
    font-size:15px;
    padding-left:10px;
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
        width:680px;
        text-align: left;
    }

    .option_info{
        
        
    }
    .total_wrap{
    width:700px;
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
        width:680px;
        text-align:left;
        position:relative;
        display:inline-block;
        
        color:gray;

        
    }
    
    .option_limit{
        width:650px;
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
    margin-top:20px;
    margin-left:20px;
    }
    .option_sum{
    margin-top:20px;    
        
    margin-left:20px;
        float:right;
        
    }
     .option_ss{
        float:left;
    
    margin-left:20px;
    }
    .option_sums{
    
        
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
<jsp:include page="../header.jsp"/>
   <div style="margin-top:10px;"class="container">
        <div class="somenail">
            <dl style="margin-top:15px;">
                ${pay.p_name}
                <input type="hidden" id="ppp" value="${pay.p_no}">
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
                        <span>결제 정보</span>
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
                            <p class="p_name">${pay.p_name}</p>
                            <input type="hidden" value="${pay.p_name}" name="p_name">
                            <input type="hidden" value="${pay.p_no}" name="p_no">
                            <p class="option_name">${lol.option_name}</p>
                            <input type="hidden" value="${lol.option_name}" name="option_name">
                              <input type="hidden" value="${order.amount}" name="amount">
                            <input type="hidden" value="${order.order_no}" name="order_no">
                            <p class="option_sum"></p>
                            <p class="option_s">수량:</p>
                            <p class="option_sum">${order.amount} 개</p>
                          
                            </div>
                          
                           <div style="padding-right:20px;border-bottom:1px solid rgb(212, 212, 212);height:60px;margin-top:40px;">
                                    <p class="option_ss" style="font-weight:600;font-size:16px">리워드 합계 금액:</p>
                                    <p class="option_sums" id="comma" style="font-weight:600;font-size:16px">${order.total_price} </p>
                                    <input type="hidden" value="${order.total_price}" name="total_price">
                            </div>
                        </div>
                        <div class="option_map" style="display:inline-block;float:left">
                            <div style="height:30px;margin:20px;">
                                <h2 style="float:left;font-weight:600;font-size:18px;">배송 정보 입력</h2>
                            </div>
                            <div class="address_wrap" style="">
                                <div class="address_name" style="float:left;height:20px;width:300px;text-align: left;margin-left:20px; margin-bottom:10px;"><p style="display:inline-block;font-size:14px">주소</p></div>
                                <div class="address_input_1_wrap" style="float:left;height:30px;width:300px;text-align: left;margin-left:20px;margin-bottom:10px;">
                                    <div class="address_input_1_box" style="float:left;">
                                        <input class="address_input_1" name="memberaddr1" readonly="readonly" style="width:300px;height:33px;"placeholder="우편번호 검색">
                                    </div>
                                   
                                </div>
                                <div class="address_input_2_wrap" style="float:left;height:30px;width:300px;text-align: left;margin-left:20px;margin-bottom:10px;">
                                    <div class="address_input_2_box">
                                        <input class="address_input_2" name="memberaddr2" readonly="readonly" style="width:300px;height:33px;"placeholder="주소">
                                    </div>
                                </div>
                                <div class="address_input_3_wrap" style="float:left;height:30px;width:300px;text-align: left;margin-left:20px;">
                                    <div class="address_input_3_box" style="float:left;">
                                        <input class="address_input_3" name="memberaddr3" readonly="readonly" style="width:200px;height:33px;"placeholder="상세 주소 입력( 동, 호수)">
                                    </div>
                                     <div class="address_button" onclick="execution_daum_address()" style=" float:right;border:1px solid rgb(224, 224, 224);height:30px;border-radius: 5px;background-color: rgb(236, 236, 236);margin-left:10px;text-align: center;padding-top:6px;display:inline-block;float:left;">
                                        <span style="margin: 0 auto;font-size:14px	">주소 찾기</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="option_map" style="display:inline-block;padding-left:30px;">
                            <div style="height:30px;margin:20px;">
                                <h2 style="float:left;font-weight:600;font-size:18px;">서포터 정보 입력</h2>
                            </div>
                            <div class="address_wrap" style="">
                                <div class="address_name" style="float:left;height:20px;width:280px;text-align: left;margin-left:20px;margin-bottom:10px;"><p style="display:inline-block;font-size:14px">이름</p></div>
                                <div class="address_input_1_wrap" style="float:left;height:40px;width:280px;text-align: left;margin-right:20px;margin-left:20px; margin-bottom:10px;">
                                    <div class="address_input_1_box" style="float:left;">
                                        <input class="support_input" name="supporter1"style="width:280px;" placeholder="이름" >
                                    </div>
                                    <input type="hidden" name="amount" value="">
                                    <input type="hidden" name="order_no" value="">
                                    <input type="hidden" name="p_no" value="">
                                    <input type="hidden" name="total_price" value="">
                                    <div class="clearfix"></div>
                                </div>
                                <div class="address_name" style="float:left;height:20px;width:280px;text-align: left;margin-left:20px; margin-bottom:10px;"><p style="display:inline-block;font-size:14px">휴대폰 번호</p></div>
                                <div class="address_input_2_wrap" style="float:left;height:40px;width:280px;text-align: left;margin-left:20px;margin-bottom:10px;">
                                    <div class="address_input_2_box">
                                        <input class="support_input" name="supporter2" style="width:280px;"name="cellPhone" id="cellPhone" placeholder="핸드폰번호 입력" maxlength="13">
                                    </div>
                                </div>
                                <div class="address_name" style="float:left;height:20px;width:280px;text-align: left;margin-left:20px; margin-bottom:10px;"><p style="display:inline-block;font-size:14px">이메일</p></div>
                                <div class="address_input_3_wrap" style="float:left;height:40px;width:280px;text-align: left;margin-left:20px;margin-bottom:10px;">
                                    <div class="address_input_3_box">
                                        <input class="support_input" name="supporter3" readonly="readonly" style="width:280px;" value="${order.email}" placeholder="${order.email}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="total_wrap">
                        <div class="price_wrap">
                            <p style="color:#9bbfd9;display:inline-block">${pay.p_name}</p><br><br><p>총 결제금액 : "${order.total_price}"원 </p>
                        </div>
                        <div class="button_wrap">
                            <button type="button" id="button_next" onclick="payment()">
                                결제하기                            
</button>
                        </div>
                        <div style="width:100%;height:10px;margin-bottom:100px;display:block;">
                            <div>
                                
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    
      
      <jsp:include page="../footer.jsp"/>
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
 $(function(){
const element = document.getElementById("comma");
	const n1 = element.innerText;
	n1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 });
    function pay() {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp04215728'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'html5_inicis', // version 1.1.0부터 지원.
            /* 
                'kakao':카카오페이, 
                html5_inicis':이니시스(웹표준결제)
                    'nice':나이스페이
                    'jtnet':제이티넷
                    'uplus':LG유플러스
                    'danal':다날
                    'payco':페이코
                    'syrup':시럽페이
                    'paypal':페이팔
                */
            pay_method: 'card',
            /* 
                'samsung':삼성페이, 
                'card':신용카드, 
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제 
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
            /* 
                merchant_uid에 경우 
                https://docs.iamport.kr/implementation/payment
                위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
                참고하세요. 
                나중에 포스팅 해볼게요.
             */
            name: '주문명:결제테스트',
            //결제창에서 보여질 이름
            amount: 1000, 
            //가격 
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
      
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    };
 
    
    
</script>
<script>
    function payment(){
        const data={
            pay_no : $("input[name='order_no']").val(),
            order_no: $("input[name='order_no']").val(),
            p_no : $("input[name='p_no']").val(),
            email : $("input[name='supporter3']").val(),
            order_name: $("input[name='supporter1']").val(),
            order_phone : $("input[name='supporter2']").val(),
            order_address : $("input[name='memberaddr2']").val() + $("input[name='memberaddr3']").val(),
            total_sum : $("input[name='total_price']").val(),
            payment_method : 'card',
        }
        if(!data.order_address){
            swal("배송지를 입력해주세요");
            return;
        }
        if(!data.order_phone){
            swal("전화번호를 입력해주세요");
            return;
        }
        paymentCard(data)
    }

        
		//가맹점 식별코드
        function paymentCard(data){
            
            IMP.init('imp04215728');
            IMP.request_pay({
                pg : 'html5_inicis',
                pay_method : 'card',
                merchant_uid : data.pay_no,
                name : $("input[name='p_name']").val(), //결제창에서 보여질 이름
                amount : data.total_sum, //실제 결제되는 가격
                buyer_email : data.email,
                buyer_name : $("input[name='supporter1']").val(),
                buyer_tel : data.phone,
                buyer_addr : data.order_address,
                buyer_postcode : $("input[name='memberaddr1']").val(),
            }, function(rsp) {
                console.log(rsp);
                if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.';
                    data.impUid = rsp.imp_uid;
                    data.merchant_uid = rsp.merchant_uid;
                    paymentComplete(data);
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                
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
            	alert("결제완료!");
                location.replace("<%=request.getContextPath()%>/");
            })
        })
        .fail(function(){
            alert("에러");
            location.replace("<%=request.getContextPath()%>/");
        })
    };
    </script>
    <script>
    function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }

var cellPhone = document.getElementById('cellPhone');
cellPhone.onkeyup = function(event){
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenPhone(_val) ;
}
</script>
</html>