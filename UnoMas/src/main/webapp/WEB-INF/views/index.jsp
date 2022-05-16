<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<!-- Start header -->
<jsp:include page="inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/index.css?after" type="text/css">
<!-- Start header -->

<body>
    <!-- Header Section Begin -->
	<jsp:include page="inc/header.jsp"></jsp:include>
    <!-- Header End -->

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg firstHero" data-setbg="${path}/resources/img/hero-1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <h1>가정의 달</h1>
                            <p>어린이날, 어버이날까지 가정의 달 선물 최대 30% 할인</p>
                            <a href="#" class="primary-btn">자세히 보기</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>Sale <span>30%</span></h2>
                    </div>
                </div>
            </div>
            <div class="single-hero-items set-bg secondHero" data-setbg="${path}/resources/img/hero-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <h1>제철 음식</h1>
                            <p>5월에 꼭 먹어야 할 제철 음식 7가지를 확인해보세요.</p>
                            <a href="#" class="primary-btn">자세히 보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
	<!-- 지금 Hot한 상품 Begin -->
	<div class="hotList">
		<h3>지금 Hot한 상품</h3>
		<p class="sub-title">지금 많이 찾으시는 상품들을 만나보세요</p>
		<div class="hotItemWrap">
			<ul class="item-cont">
				<dl class="itemList">
					<dt class="thumb">
						<a href="">
							<img class="hot1" src="https://m.gogiazzi.com/web/product/big/202201/4f7b0f7841bbf29b5a79ea8185ace935.jpg"
								style="width:200px;">
						</a>
					</dt>
					<dd class="prdInfo">
						<p class="prdName">
							<a href="">프리미엄 숙성육 소고기 600g, 900g, 1200g 선물세트</a>
						</p>
						<p class="prdPrice">
							<del>60,000원</del>
							<br>
							47,900원
						</p>
					</dd>
				</dl>
				<dl class="itemList">
					<dt class="thumb">
						<a href="">
							<img class="hot1" src="https://m.gogiazzi.com/web/product/big/202201/4f7b0f7841bbf29b5a79ea8185ace935.jpg"
								style="width:200px;">
						</a>
					</dt>
					<dd class="prdInfo">
						<p class="prdName">
							<a href="">프리미엄 숙성육 소고기 600g, 900g, 1200g 선물세트</a>
						</p>
						<p class="prdPrice">
							<del>60,000원</del>
							<br>
							47,900원
						</p>
					</dd>
				</dl>
				<dl class="itemList">
					<dt class="thumb">
						<a href="">
							<img class="hot1" src="https://m.gogiazzi.com/web/product/big/202201/4f7b0f7841bbf29b5a79ea8185ace935.jpg"
								style="width:200px;">
						</a>
					</dt>
					<dd class="prdInfo">
						<p class="prdName">
							<a href="">프리미엄 숙성육 소고기 600g, 900g, 1200g 선물세트</a>
						</p>
						<p class="prdPrice">
							<del>60,000원</del>
							<br>
							47,900원
						</p>
					</dd>
				</dl>
				<dl class="itemList">
					<dt class="thumb">
						<a href="">
							<img class="hot1" src="https://m.gogiazzi.com/web/product/big/202201/4f7b0f7841bbf29b5a79ea8185ace935.jpg"
								style="width:200px;">
						</a>
					</dt>
					<dd class="prdInfo">
						<p class="prdName">
							<a href="">프리미엄 숙성육 소고기 600g, 900g, 1200g 선물세트</a>
						</p>
						<p class="prdPrice">
							<del>60,000원</del>
							<br>
							47,900원
						</p>
					</dd>
				</dl>
			</ul>
		</div>
    </div>
    <!-- 지금 Hot한 상품 End -->

    <!-- 조회수 높은 상품 Section Begin -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg" id="highView" data-setbg="${path}/resources/img/products/women-large.jpg">
                        <h2>조회수 높은 상품</h2>
                        <a href="#">Discover More</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="product-slider owl-carousel">
                    	<c:forEach items="${readcntList}" var="rl">
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${path}/resources/img/products/women-1.jpg" alt="">
                                <div class="sale">Sale</div>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${rl.prod_category}</div>
                                <a href="/product/product_detail?prod_num=${rl.prod_num}">
                                    <h5>${rl.prod_name}</h5>
                                </a>
                                <!-- 정상가 -->
                                <div class="product-price">
                                    <fmt:formatNumber value="${rl.prod_price}" type="number"/>원
                                </div>
                                <!-- 할인가 -->
<!--                                  <div class="product-price"> -->
<%--                                     ${rl.prod_price} --%>
<!--                                     <span>$35.00</span> -->
<!--                                 </div> -->
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 조회수 높은 상품 Section End -->

    <!-- 많이 팔리는 상품 Section Begin -->
   <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg" id="highView" data-setbg="${path}/resources/img/products/women-large.jpg">
                        <h2>많이 팔리는 상품</h2>
                        <a href="#">Discover More</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="product-slider owl-carousel">
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${path}/resources/img/products/women-1.jpg" alt="">
                                <div class="sale">Sale</div>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Coat</div>
                                <a href="#">
                                    <h5>Pure Pineapple</h5>
                                </a>
                                <div class="product-price">
                                    $14.00
                                    <span>$35.00</span>
                                </div>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${path}/resources/img/products/women-2.jpg" alt="">
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Shoes</div>
                                <a href="#">
                                    <h5>Guangzhou sweater</h5>
                                </a>
                                <div class="product-price">
                                    $13.00
                                </div>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${path}/resources/img/products/women-3.jpg" alt="">
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Towel</div>
                                <a href="#">
                                    <h5>Pure Pineapple</h5>
                                </a>
                                <div class="product-price">
                                    $34.00
                                </div>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${path}/resources/img/products/women-4.jpg" alt="">
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Towel</div>
                                <a href="#">
                                    <h5>Converse Shoes</h5>
                                </a>
                                <div class="product-price">
                                    $34.00
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 많이 팔리는 상품 Section End -->    

	<!-- 최신 상품 Section Begin -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg" id="highView" data-setbg="${path}/resources/img/products/women-large.jpg">
                        <h2>신상품</h2>
                        <a href="#">Discover More</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="product-slider owl-carousel">
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${path}/resources/img/products/women-1.jpg" alt="">
                                <div class="sale">Sale</div>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Coat</div>
                                <a href="#">
                                    <h5>Pure Pineapple</h5>
                                </a>
                                <div class="product-price">
                                    $14.00
                                    <span>$35.00</span>
                                </div>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${path}/resources/img/products/women-2.jpg" alt="">
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Shoes</div>
                                <a href="#">
                                    <h5>Guangzhou sweater</h5>
                                </a>
                                <div class="product-price">
                                    $13.00
                                </div>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${path}/resources/img/products/women-3.jpg" alt="">
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Towel</div>
                                <a href="#">
                                    <h5>Pure Pineapple</h5>
                                </a>
                                <div class="product-price">
                                    $34.00
                                </div>
                            </div>
                        </div>
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="${path}/resources/img/products/women-4.jpg" alt="">
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">Towel</div>
                                <a href="#">
                                    <h5>Converse Shoes</h5>
                                </a>
                                <div class="product-price">
                                    $34.00
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 최신 상품 Section End -->
    <!-- 혜택 Section Begin -->
    <section>
	<div class="benefit-items">
    	<div class="row">
        	<div class="col-lg-4">
            	<div class="single-benefit">
                	<div class="sb-icon">
                    	<img src="${path}/resources/img/icon-1.png" alt="">
                    </div>
                    <div class="sb-text">
                    	<h6>무료 배송</h6>
                        <p>5만원 이상의 모든 주문 해당</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
            	<div class="single-benefit">
                	<div class="sb-icon">
                    	<img src="${path}/resources/img/icon-2.png" alt="">
                    </div>
                    <div class="sb-text">
                     	<h6>예약 배송</h6>
                        <p>원하는 시간과 장소에 정확히 배송</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
            	<div class="single-benefit">
                	<div class="sb-icon">
                    	<img src="${path}/resources/img/icon-3.png" alt="">
                    </div>
                    <div class="sb-text">
                    	<h6>보안 결제</h6>
                        <p>안전한 결제를 보장</p>
                    </div>
                </div>
            </div>
		</div>
	</div>
	</section>
    <!-- 혜택 Section End -->

    <!-- Footer Section Begin -->
	<jsp:include page="inc/bottom.jsp"></jsp:include>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/js/bootstrap.min.js"></script>
    <script src="${path}/resources/js/jquery-ui.min.js"></script>
    <script src="${path}/resources/js/jquery.countdown.min.js"></script>
    <script src="${path}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${path}/resources/js/jquery.zoom.min.js"></script>
    <script src="${path}/resources/js/jquery.dd.min.js"></script>
    <script src="${path}/resources/js/jquery.slicknav.js"></script>
    <script src="${path}/resources/js/owl.carousel.min.js"></script>
    <script src="${path}/resources/js/main.js"></script>
</body>
</html>