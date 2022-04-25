<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/productList.css?after32">
<!-- Start Header -->

<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<!-- <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<!-- <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <h4 class="fw-title">Categories</h4>
                        <ul class="filter-catagories">
                            <li><a href="#">Men</a></li>
                            <li><a href="#">Women</a></li>
                            <li><a href="#">Kids</a></li>
                        </ul>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">Brand</h4>
                        <div class="fw-brand-check">
                            <div class="bc-item">
                                <label for="bc-calvin">
                                    Calvin Klein
                                    <input type="checkbox" id="bc-calvin">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="bc-item">
                                <label for="bc-diesel">
                                    Diesel
                                    <input type="checkbox" id="bc-diesel">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="bc-item">
                                <label for="bc-polo">
                                    Polo
                                    <input type="checkbox" id="bc-polo">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="bc-item">
                                <label for="bc-tommy">
                                    Tommy Hilfiger
                                    <input type="checkbox" id="bc-tommy">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">Price</h4>
                        <div class="filter-range-wrap">
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                data-min="33" data-max="98">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                        </div>
                        <a href="#" class="filter-btn">Filter</a>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">Color</h4>
                        <div class="fw-color-choose">
                            <div class="cs-item">
                                <input type="radio" id="cs-black">
                                <label class="cs-black" for="cs-black">Black</label>
                            </div>
                            <div class="cs-item">
                                <input type="radio" id="cs-violet">
                                <label class="cs-violet" for="cs-violet">Violet</label>
                            </div>
                            <div class="cs-item">
                                <input type="radio" id="cs-blue">
                                <label class="cs-blue" for="cs-blue">Blue</label>
                            </div>
                            <div class="cs-item">
                                <input type="radio" id="cs-yellow">
                                <label class="cs-yellow" for="cs-yellow">Yellow</label>
                            </div>
                            <div class="cs-item">
                                <input type="radio" id="cs-red">
                                <label class="cs-red" for="cs-red">Red</label>
                            </div>
                            <div class="cs-item">
                                <input type="radio" id="cs-green">
                                <label class="cs-green" for="cs-green">Green</label>
                            </div>
                        </div>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">Size</h4>
                        <div class="fw-size-choose">
                            <div class="sc-item">
                                <input type="radio" id="s-size">
                                <label for="s-size">s</label>
                            </div>
                            <div class="sc-item">
                                <input type="radio" id="m-size">
                                <label for="m-size">m</label>
                            </div>
                            <div class="sc-item">
                                <input type="radio" id="l-size">
                                <label for="l-size">l</label>
                            </div>
                            <div class="sc-item">
                                <input type="radio" id="xs-size">
                                <label for="xs-size">xs</label>
                            </div>
                        </div>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">Tags</h4>
                        <div class="fw-tags">
                            <a href="#">Towel</a>
                            <a href="#">Shoes</a>
                            <a href="#">Coat</a>
                            <a href="#">Dresses</a>
                            <a href="#">Trousers</a>
                            <a href="#">Men's hats</a>
                            <a href="#">Backpack</a>
                        </div>
                    </div>
                </div> -->
				<div class="col-lg-12 order-1 order-lg-2">
					<div class="categoryBox">
						<h3 class="title">채소</h3>
						<ul class="categoryList on">
							<li data-start="124" data-end="188">
							    <a class="category" id="category0" onclick="changeSort(0, 4);">전체보기</a>
							</li>
							<!-- <li data-start="316" data-end="368"><a class="">친환경</a></li> -->
							<li data-start="435" data-end="548">
							    <a class="category" id="category1" onclick="changeSort(1, 4);">고구마·감자·당근</a>
							</li>
							<!-- <li data-start="603" data-end="728"><a class="">시금치·쌈채소·나물</a></li>
							<li data-start="747" data-end="908"><a class="">브로콜리·파프리카·양배추</a></li> -->
							<li data-start="956" data-end="1088">
							    <a class="category" id="category2" onclick="changeSort(2, 4);">양파·대파·마늘·배추</a>
							</li>
							<!-- <li data-start="1167" data-end="1268"><a class="">오이·호박·고추</a></li> -->
							<li data-start="1323" data-end="1448">
							    <a class="category" id="category3" onclick="changeSort(3, 4);">냉동·이색·간편채소</a>
							</li>
							<!-- <li data-start="1545" data-end="1628"><a class="">콩나물·버섯</a></li> -->
							<li class="bg"></li>
						</ul>
					</div>
					<div class="product-show-option">
						<div class="row">
							<!-- <div class="col-lg-7 col-md-7">
								<div class="select-option">
									<select class="sorting">
										<option value="">Default Sorting</option>
									</select> <select class="p-show">
										<option value="">Show:</option>
									</select>
								</div>
							</div> -->
							<div class="col-lg-12 col-md-12 text-right">
								<p>
									총 <span>000</span>개
								</p>
							</div>
						</div>
					</div>
					<div class="product-list">
						<div class="row">
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<a href="product_detail"> <img
											src="${path}/resources/img/products/product-1.jpg" alt=""></a>
										<div class="sale pp-sale">Sale</div>
										<div class="icon">
											<i class="icon_heart_alt"></i>
										</div>
										<ul>
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">Towel</div>
										<a href="#">
											<h5>Pure Pineapple</h5>
										</a>
										<div class="product-price">
											$14.00 <span>$35.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<img src="${path}/resources/img/products/product-2.jpg" alt="">
										<div class="icon">
											<i class="icon_heart_alt"></i>
										</div>
										<ul>
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">Coat</div>
										<a href="#">
											<h5>Guangzhou sweater</h5>
										</a>
										<div class="product-price">
											$13.00 <span>$35.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<img src="${path}/resources/img/products/product-3.jpg" alt="">
										<div class="icon">
											<i class="icon_heart_alt"></i>
										</div>
										<ul>
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">Shoes</div>
										<a href="#">
											<h5>Guangzhou sweater</h5>
										</a>
										<div class="product-price">
											$34.00 <span>$35.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<img src="${path}/resources/img/products/product-4.jpg" alt="">
										<div class="icon">
											<i class="icon_heart_alt"></i>
										</div>
										<ul>
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">Coat</div>
										<a href="#">
											<h5>Microfiber Wool Scarf</h5>
										</a>
										<div class="product-price">
											$64.00 <span>$35.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<img src="${path}/resources/img/products/product-5.jpg" alt="">
										<div class="icon">
											<i class="icon_heart_alt"></i>
										</div>
										<ul>
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">Shoes</div>
										<a href="#">
											<h5>Men's Painted Hat</h5>
										</a>
										<div class="product-price">
											$44.00 <span>$35.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<img src="${path}/resources/img/products/product-6.jpg" alt="">
										<div class="icon">
											<i class="icon_heart_alt"></i>
										</div>
										<ul>
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">Shoes</div>
										<a href="#">
											<h5>Converse Shoes</h5>
										</a>
										<div class="product-price">
											$34.00 <span>$35.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<img src="${path}/resources/img/products/product-7.jpg" alt="">
										<div class="sale pp-sale">Sale</div>
										<div class="icon">
											<i class="icon_heart_alt"></i>
										</div>
										<ul>
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">Towel</div>
										<a href="#">
											<h5>Pure Pineapple</h5>
										</a>
										<div class="product-price">
											$64.00 <span>$35.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<img src="${path}/resources/img/products/product-8.jpg" alt="">
										<div class="icon">
											<i class="icon_heart_alt"></i>
										</div>
										<ul>
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">Coat</div>
										<a href="#">
											<h5>2 Layer Windbreaker</h5>
										</a>
										<div class="product-price">
											$44.00 <span>$35.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<img src="${path}/resources/img/products/product-9.jpg" alt="">
										<div class="icon">
											<i class="icon_heart_alt"></i>
										</div>
										<ul>
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">Shoes</div>
										<a href="#">
											<h5>Converse Shoes</h5>
										</a>
										<div class="product-price">
											$34.00 <span>$35.00</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="loading-more">
						<i class="icon_loading"></i> <a href="#"> Loading More </a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Shop Section End -->


	<!-- Partner Logo Section End -->
	<!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
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
	<script src="${path}/resources/js/productList.js"></script>
</body>

</html>