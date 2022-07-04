<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/investor.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퐁당 - 좋아요</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <style>    
  a {
    text-decoration: none;
  }
  /* favorite */
  #title_wrap {     
    border-bottom: 1px solid #ccc;         
    height: 140px;      
  }
  #title {         
    /* border: 1px solid red; */
    box-sizing: border-box;
    width: 350px;
    height: 100px;
    margin-left: 18%;   
    /* margin-left: 350px; */
    padding-top: 40px; 
    font-family: SUIT-SemiBold;
    font-size: 36px;
  }          
  #page_body {            
    height: 900px;
    background-color: #f5f7fa;
  }  
  #favorite_product_wrap {
    /* border: 1px solid red; */
    display: flex;
    flex-wrap: wrap;
    margin: 0 auto;
    width: 1220px;
    height: 850px;
  }
  .prod_flex {
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 300px;
    height: 380px;
    margin: 20px;
  }
  .prod_img {        
    width: 100%;
    height: 240px;
  }
  .prod_info_wrap {    
    padding: 4px;
    background-color: white;
    height: 130px;
  }
  .prod_name {        
    width: 100%;
    height: 60px;
    font-family: SUIT-Regular;
    font-size: 17px;
    font-weight: bold;
    color: black;
  }
  .prod_maker_wrap {    
    height: 50px;
    font-family: SUIT-Light;
    font-size: 13px;
    color: #444c57;
  }
  .number_wrap {
    position: relative;
  }
  .achievement_rate {
  	font-family: SUIT-Regular;
    font-size: 15px;
    color: #9bbfd9;
  }
  .limit_date {
    position: absolute;
    right: 0;
    color: #444c57;
    font-family: SUIT-Light;
    font-size: 13px;
    font-weight: normal;
  }
</style>
</head>
<body>  
	<jsp:include page="../header.jsp"/>
	
  <div id="title_wrap">
    <p id="title">좋아요</p>        
  </div>
  <div id="page_body">  
    <div id="favorite_product_wrap">
      <a href="#">
        <div class="prod_flex">
          <img class="prod_img" src="">
          <div class="prod_info_wrap">
            <p class="prod_name">[5점앵콜]속각질 뽑아내고, 속보습 채우는 참마 비건클렌저</p>
            <p class="prod_maker_wrap">
              <span>카테고리</span>｜
              <span>메이커명</span>
            </p>
            <p class="number_wrap">
              <span class="achievement_rate">달성률%</span>
              <span class="limit_date">7일 남음</span>
            </p>
          </div>        
        </div>
      </a>
      <a href="#">
        <div class="prod_flex">
          <img class="prod_img" src="">
          <div class="prod_info_wrap">
            <p class="prod_name">[5점앵콜]속각질 뽑아내고, 속보습 채우는 참마 비건클렌저</p>
            <p class="prod_maker_wrap">
              <span>카테고리</span>｜
              <span>메이커명</span>
            </p>
            <p class="number_wrap">
              <span class="achievement_rate">달성률%</span>
              <span class="limit_date">7일 남음</span>
            </p>
          </div>        
        </div>
      </a>
      <a href="#">
        <div class="prod_flex">
          <img class="prod_img" src="">
          <div class="prod_info_wrap">
            <p class="prod_name">[5점앵콜]속각질 뽑아내고, 속보습 채우는 참마 비건클렌저</p>
            <p class="prod_maker_wrap">
              <span>카테고리</span>｜
              <span>메이커명</span>
            </p>
            <p class="number_wrap">
              <span class="achievement_rate">달성률%</span>
              <span class="limit_date">7일 남음</span>
            </p>
          </div>        
        </div>
      </a>
      <a href="#">
        <div class="prod_flex">
          <img class="prod_img" src="">
          <div class="prod_info_wrap">
            <p class="prod_name">[5점앵콜]속각질 뽑아내고, 속보습 채우는 참마 비건클렌저</p>
            <p class="prod_maker_wrap">
              <span>카테고리</span>｜
              <span>메이커명</span>
            </p>
            <p class="number_wrap">
              <span class="achievement_rate">달성률%</span>
              <span class="limit_date">7일 남음</span>
            </p>
          </div>        
        </div>
      </a>
      
    </div>
  </div>

  <jsp:include page="../footer.jsp"/>
</body>
</html>