<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<style>
    #modal_wrap {      
      	margin: 0 auto;
      	width: 400px;
      	height: 400px;      
	    background-color: white;
    }
    #modal_title_wrap {
    	background-color: #9bbfd9;
    	height: 60px;
    }
    #modal_title {
    	text-align: center;
    	font-family: SUIT-Regular;
      	font-size: 17px;
      	color: white;      
      	padding-top: 15px;
      	padding-bottom: 5px;
    }
    #modal_subcation {
    	font-family: SUIT-Regular;
    	text-align: center;
      	font-size: 15px;
    }
    #modal_content {
      border: 1px solid #9bbfd9;
      border-radius: 3px;
      margin: 30px 0;
      padding: 15px;
      height: 300px;            
      color: #444c57;
      font-family: SUIT-Regular;
      font-size: 15px;
      line-height: 1.7em;
    }
    #answer_wrap {      
      margin: 0 auto;
      width: 125px;
      height: 45px;
    }
    #answer_btn {            
      width: 120px;
      height: 40px;
      
      font-family: SUIT-Regular;
      font-size: 14px;
      
      background-color: #b6e0d6;
      border: 1px solid #b6e0d6;
      border-radius: 3px;
      color: white;
      
      cursor: pointer;
    }
  </style>
</head>
<body>
	<div id="modal_title_wrap">
		<p id="modal_title">메시지</p>
		<p id="modal_subcation">퐁당</p>
	</div>              
  	<div id="modal_wrap">
    	<div id="modal_content">
    		${message.m_content }
    	</div>
    	<div id="answer_wrap">
      		<button type="button" id="answer_btn">답장하기</button>
    	</div>  
  	</div> 

  <script>
    console.log("메시지번호: " + ${message.m_no});
    
    $("#answer_btn").click(function() {
    	console.log("답장하기 click()");
    });
  </script>


</body>
</html>