<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/css/header.css"></script>
<script src="${path}/resources/css/button.css"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

    <style>
        .container_content {
            margin-top: 20px;
            display: flex;
            flex-wrap: wrap;
        }

        .productHeader {
            margin: 0 0 15px;
        }

        .product_name {
            font-size: 15px;
            line-height: 19px;
            font-weight: 600;
            width: 200px;
            display: block;
            text-overflow: ellipsis;
            cursor: pointer;
        }

        .product_name_intro {
            width: 200px;
            display: flex;
            overflow: hidden;
        }

        .product_image {
            width: 100%;
        }

        .product_title {
            display: flex;
            font-size: 13px
        }

        .wrap_product_thumbnail {
            padding-bottom: 100%;
            border-radius: 6px;
            position: relative;
            overflow: hidden;
        }

        .product_thumbnail {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%;
            transform: translate(-50%, -50%);
            transform-origin: 300% 300%;
            transition: transform .5s;
        }

        .wrap_product_thumbnail:hover img {
            transform: scale(1.2);
        }

        .rankingWrap h5:hover {
            color: #9bbfd9;
            transition:ease-in .1s;
        }

        .product_name_color:hover {
            color: #9bbfd9;
            transition:ease-in .1s;
        }
    </style>
</head>

<body>
    <div id="bannerWrap">
        <div class="slidebox">
            <input type="radio" name="slide" id="slide01" checked>
            <input type="radio" name="slide" id="slide02">
            <input type="radio" name="slide" id="slide03">
            <input type="radio" name="slide" id="slide04">
            <ul class="slidelist">
                <li class="slideitem">
                    <div>
                        <label for="slide04" class="left"></label>
                        <label for="slide02" class="right"></label>
                        <a href="#"><img src="./image/anigif.gif" /></a>
                    </div>
                </li>
                <li class="slideitem">
                    <div>
                        <label for="slide01" class="left"></label>
                        <label for="slide03" class="right"></label>
                        <a><img src="./image/anigif.gif" /></a>
                    </div>
                </li>
                <li class="slideitem">
                    <div>
                        <label for="slide02" class="left"></label>
                        <label for="slide04" class="right"></label>
                        <a><img src="./image/anigif.gif" /></a>
                    </div>
                </li>
                <li class="slideitem">
                    <div>
                        <label for="slide03" class="left"></label>
                        <label for="slide01" class="right"></label>
                        <a><img src="./image/anigif.gif" /></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="section">
        <div id="beforeFunding">
            <p>
            <h2>주목하세요! 오픈 예정 프로젝트</h2>
            <h5 style="margin-left:150px;">-먼저 참여하는 분들께 드리는 얼리버드 혜택-</h5>
            </p>
            <div class="wrap_content">
                <section>
                    <div class="container_content">
                        <c:forEach items="" var="vo">
                            <div>
                                <div class="product_image">
                                    <div class="wrap_product_thumbnail">
                                        <a class="product_link" href="">
                                            <img class="product_thumbnail" src="./image/optimize.jpg">
                                        </a>
                                    </div>
                                </div>
                                <div class="product_name">
                                    <!-- ${vo.product } -->
                                    <p class="product_name_color">[평점5.0]줄서서 먹는 남대문 맛집,금성관 나주곰탕!</p>
                                </div>
                                <div class="product_name_intro">
                                    <!-- ${vo.product } -->
                                    <p style="color:black;">00일 오픈예정! </span></p>
                                </div>
                                <div class="product_title">
                                    <!-- ${vo.product } -->
                                    <h4>
                                        <p style="color: #9bbfd9;">54,000<span style="color:black;">
                                                <h4>원</h4><span style="color:black;margin-left: 3px;">
                                                    <h4>잡화</h4>
                                                </span></p>
                                    </h4>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </section>
            </div>
        </div>
        <div id="ranking01">
            <p>
            <h2>실시간 랭킹!</h2>

            </p>
            <div style="display:flex;">
                <ul>
                    <li>
                        <h3 class="rankNum fistNum">1</h3>
                    </li>
                    <li>
                        <h3 class="rankNum">2</h3>
                    </li>
                    <li>
                        <h3 class="rankNum">3</h3>
                    </li>
                    <li>
                        <h3 class="rankNum">4</h3>
                    </li>
                    <li>

                        <h3 class="rankNum">5</h3>

                    </li>
                </ul>
                <div id="rankingWrap">
                    <ul class="rankingWrap">
                        <li class="ranking02"">
                    
                    <p>
                    <h5 class=" productName" style="width:180px;">[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br>
                            <span class="productPer">102%<span class="productCate">화장품</span></span>
                            </h5>
                            </p>
                            <a href="#"><img src="./image/optimize.jpg" class="rankgImg">
                            </a>
                        </li>
                        <li class="ranking02"">
                    
                    <p>
                    <h5 class=" productName" style="width:180px;">[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br>
                            <span class="productPer">102%<span class="productCate">화장품</span></span>
                            </h5>
                            </p>
                            <a href="#"><img src="./image/optimize.jpg" class="rankgImg">
                            </a>
                        </li>
                        <li class="ranking02"">
                    
                    <p>
                    <h5 class=" productName" style="width:180px;">[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br>
                            <span class="productPer">102%<span class="productCate">화장품</span></span>
                            </h5>
                            </p>
                            <a href="#"><img src="./image/optimize.jpg" class="rankgImg">
                            </a>
                        </li>
                        <li class="ranking02"">
                    
                    <p>
                    <h5 class=" productName" style="width:180px;">[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br>
                            <span class="productPer">102%<span class="productCate">화장품</span></span>
                            </h5>
                            </p>
                            <a href="#"><img src="./image/optimize.jpg" class="rankgImg">
                            </a>
                        </li>
                        <li class="ranking02"">
                    
                    <p>
                    <h5 class=" productName" style="width:180px;">[롯데월드] 로티로리슬라임 l 슬라임으로 갓벽한 하루 마무리 #퇴근힐링템<br>
                            <span class="productPer">102%<span class="productCate">화장품</span></span>
                            </h5>
                            </p>
                            <a href="#"><img src="./image/optimize.jpg" class="rankgImg">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <hr style="border-color:rgba(135, 132, 132, 0.253)">
    <div class="section02">

        <div class="top3">

        </div>
        <div class="top3 margin">

        </div>
        <div class="top3 margin">

        </div>
    </div>
    <hr style="border-color:rgba(135, 132, 132, 0.253)">
    <div class="section03">
        <div class="apply01">
            <p>퐁당에서 프로젝트 오픈하기</p>
            <p>당신의 이야기를 소개하고 투자자와 서포터를 만나보세요.</p>
        </div>
        <div class="apply02">
            <button class="btn btn-fill-fcolor">신청하기</button>
        </div>
    </div>

</body>

</html>