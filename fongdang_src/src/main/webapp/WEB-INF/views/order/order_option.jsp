<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
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
        width:700px;
    }
    .wrap_container{
        text-align: center;
    }
    .step_wrap{
        margin:20px;
        width:660px;
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
   
    input{
    font-size:15px;
    text-align:center;
    }
    .step>span{
        display: inline-block;
        width:60px;
        height:30px;
        margin-top:38px;
        font-size:12px;
    }
    .wrap_container2{
        width: 100%;
        margin-top:30px;
       

    }
    
    .option_wrap{
        width:100%;
        position:relative;
        padding-bottom:30px;
        border-bottom:1px solid rgb(212,212,212);
        
    }
    .option_top{
        width:700px;
        height:80px;
        margin:0 auto;
        display:block;
        
        
        
        
        
    }

    .option_top>h2{
        font-size:20px;
        font-weight:500;
        margin-top:10px;
    }
    #step_one{
        background-color:#a9def5
        
    }
    #step_one>span{
        color:rgb(255, 255, 255);
    }
    .option{
        width:700px;
        margin:0 auto;
        height:200px;
    }
    .option>ul{
        width:700px;

    }
    .option>ul>li{
        float:left;
        border-radius: 5px;
        width:700px;
    }
    
        .agree .all_agree input[type="radio"] {display: none;}

        .agree .all_agree input[type="radio"] + label {
            display: inline-block; width:17px; height: 17px; background: #d6ecf5;
            cursor: pointer; border-radius: 3px;float: left;             
        }
        .agree .all_agree:after {
            display:block; clear:both; content:"";
        }
        .agree .all_agree input[type="radio"]:checked + label {
            background:url(<%=request.getContextPath()%>/resources/images/check.png) #d6ecf5 no-repeat center/20px 20px; float: left;display: inline-block;
        }
        .agree {
            position:relative;
        }
        .agree .all_agree input[type="radio"] + label span {
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
            width:800px;
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
            margin-top:20px;
            margin-left:20px;
            margin-right:20px;
            position: relative;
        }
    .option_price{
        
        
        
        font-weight: 500;
    }
    .option_name{
        text-align: left;
        font-size: 18px;
        font-weight: 500;
        margin-bottom: 10px;
    
    }
    .option_info{
        
        
    }
    .total_wrap{
    width:100%;
    padding-top:40px;
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
        width:670px;
        font-size: 14px;
        text-align:left;
        margin-left:8px;
        margin-bottom:3px;
        position:relative;
        display:inline-block;
        
        color:gray;

        
    }
    
    .option_limit{
		width:670px;
        font-size: 14px;
        margin-bottom:3px;
        display:inline-block;
        text-align:left;
        position:relative;
margin-left:8px;
     
        color:gray;
    }
    .option_price{
     width:670px;
        font-size: 15px;
        margin-bottom:3px;
        display:inline-block;
     margin-left:8px;
        text-align:left;
        position:relative;
       
    }
    .option_sum{
        width:700px;
        display:inline-block;
        text-align:left;
        margin-bottom:15px;
        position:relative;
    }
    
    #un{
        display: none;
    }
    .text{
        margin-top:10px;
        width:50px;
        height:30px;
        border-radius: 4px;
        border:1px solid #a9def5;
        
    }
    .color{
        background:  #d6ecf5;
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
                ${product.p_name}
                <input type="hidden" id="ppp" value="${product.p_no}">
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
                        <div class="for_border"></div>
                        <div class="option_top">
                            <h2 style="float:left;margin-bottom: 20px;">옵션 선택</h2>
                        </div>
                        <c:forEach items="${order}" var="order">
                        <div class="option">
                            <ul>
                                <li id="price">
                                    <div class="agree">
                                        <dl class="agree2">
                                            <dt class="all_agree">
                                                    <input type="radio" id="${order.option_no}" name="chb" value="${order.option_no}">
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
                                                <p class="option_limit">${order.option_limit}개 남음 <input type="hidden" id="limit" name="limit" value="${order.option_limit}"></p>
                                                <p class="option_price">${order.option_price} 원 펀딩</p>
                                                <input type="hidden" value="${order.option_price}" name="option_price">
                                                <input type="hidden" value="${order.option_no}" name="optionNo">
                                                <input type="hidden" value="${order.p_no}" name="p_no">
                                            </dd>
                                        </dl>   
                                        <p class="option_sum" id="amount_wrap"><button type="button" style=" margin-left:20px;width:30px;height:20px;"onclick="fnCalCount('m',${order.option_no});">-</button><input type="text" name="pop_out" id="amount" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"class="text"value="0" readonly="readonly"style="margin-left:10px;"><button type ="button" style=" margin-left:10px;width:30px;height:20px;"onclick="fnCalCount('p',${order.option_no});">+</button></p>
                                        <p id="result"></p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="total_wrap">
                        <div class="price_wrap">                            
                             <p style="font-size:15px;margin-bottom:3px;">[ ${product.p_name} ]에 펀딩합니다.</p>
                             <p style="font-size:15px;"> 배송 예정일은 ${product.delivery_date} 입니다.</p>
                        </div>
                        <div class="button_wrap">
                            <button type="button" id="button_next" onclick="order()" >
                                next step
                            </button>
                        </div>
                        <div style="width:100%;height:10px;margin-bottom:200px;display:block;">
                            <div>
                                
                            </div>
                        </div>
                    </div>
                    <div style="display:none">
                    <input type="hidden" name="p_no" value="">
                    <input type="hidden" name="option_no" value="">
                    <input type="hidden" name="total_price" value="">
                    
                    <input type="hidden" id="plan"name="payment_plan" value="${product.delivery_date}">
                    </div>
            </div>
        </div>
    </div>
    <form id="frm1">
    	<input type="hidden" name="order_no" id="hidden_order_no">
    	<input type="hidden" name="p_no" id="hidden_p_no">
    	<input type="hidden" name="option_no" id="hidden_option_no">
    	<input type="hidden" name="total_price" id="hidden_total_price">
    	<input type="hidden" name="amount" id="hidden_amount">
    	<input type="hidden" name="payment_plan" id="hidden_payment_plan">
    </form>
       <!-- Modal -->
   
                <jsp:include page="../footer.jsp"/>
</body>
<script>
 $('input:checkbox[name="checkbox_name"]').each(function() {     
	this.checked = true;
	   if(this.checked){
		return this.value;
		     }
}
출처: https://openlife.tistory.com/381 [물고기 많은 바다:티스토리]
function fnCalCount(type, no){

    var $input = $("input[name='pop_out']");
    var tCount = Number($input.val());
    var tEqCount = $("input[name='limit']").val();
    var ss = $("input[name='optionNo']").val();
    
    if(type=='p'){
        if(tCount < tEqCount){
        	$input.val(Number(tCount)+1);
        	}else{
        		alert("잔여 수량 내에서 선택하세요.")
        	}
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
        }
    }else{
    	console.log("failed")
    }
}

 

</script>
<script>
        
    $(".agree2").click(function(){
        var $thisCheckbox = $(this).find("[type=radio]");
        $thisCheckbox.prop("checked", function(){
           return !$(this).prop("checked");
        });  
    });
    
    
    


    const text = document.querySelector('.agree2');
    text.addEventListener('click',function(){
        document.querySelector('.agree').classList.toggle('color');
    });
    
   
</script>

<script>
$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
</script>
<script>
function createOrderNo(){
    const date = new Date();
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    
    let orderNum = year + month + day;
    for(let i=0;i<5;i++) {
        orderNum += Math.floor(Math.random() * 8);	
    }
    return orderNum;
}
const genreArray = new Array();
const data={
    	order_no :createOrderNo(),
       p_no : $("input[name='p_no']").val(),
       option_no : '3',//$('input:radio[id="chb"]').val(),
       total_price : $("input[name='option_price']").val()*5,//$("#amount").val(),//$("").val(),
       amount : '5',//$("#amount").val(),
       payment_plan :$("#plan").val()
    }
function order(){
    
    if(!data.option_no){
        swal("옵션을 선택해주세요.");
        return;
    }
    if(!data.amount){
        swal("수량은 0 이상이여야 합니다.");
        return;
    }
    orderNext(data)
}
function orderNext(data) {    
    	
    	$.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/order/insert",
            data: data,
            success: function (result) {
                console.log(result);
                if(result == 0){
                	alert("로그인을 한 후에 주문이 가능합니다. 로그인 페이지로 이동합니다.");
					location.href = "<%=request.getContextPath()%>/member/login";
                }else if(result == -1){
                alert("주문실패")
                }else if(result == 1){
                	alert("결제 페이지로 이동합니다.");
                	pay(data);
                }
            },
   			error : function (result) {
   				alert("에러 발생.");
   				console.log(result);
    		}
    	});
    
};
function pay(data){
	$.ajax({
		type : "POST",
		url :"<%=request.getContextPath()%>/pay/pay",
		data : data,
		success: function (result){
			console.log(result);
            if(result == 0){
            	alert("로그인을 한 후에 주문이 가능합니다. 로그인 페이지로 이동합니다.");
				location.href = "<%=request.getContextPath()%>/member/login";
            }else {
            	alert("결제 페이지");
        		console.log(result);
            	//location.replace("<%=request.getContextPath()%>/pay/payment?price="+data.order_no);
            	$("#frm1 #hidden_order_no").val(data.order_no);
            	$("#frm1 #hidden_p_no").val(data.p_no);
            	$("#frm1 #hidden_option_no").val(data.option_no);
            	$("#frm1 #hidden_total_price").val(data.total_price);
            	$("#frm1 #hidden_amount").val(data.amount);
            	$("#frm1 #hidden_payment_plan").val(data.payment_plan);
            	frm1.action = "<%=request.getContextPath()%>/pay/payment";
            	frm1.method="post";
            	frm1.submit();
            }
        },
			error : function (result) {
				alert("에러 발생.");
				console.log(result);
		}
		
	});
};

</script>
</html>