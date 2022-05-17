<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/product_css/productList.css?afte">
<!-- Start Header -->

<%
String category = "특가";

// @@ 로드시 현재 카테고리의 상품 총 개수 가져와서 저장 @@
int cnt = 10;

// @@ 원가와 세일비율 저장된 테이블이 필요할 듯... @@

// @@ DB 연결 후 페이지 정보 가져오기 @@
int pageCnt = 5;
int pageBlockCnt = 5;
int startBlock = 1;
int endBlock = 5;
%>

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
					<div class="product-show-option">
						<h3 class="title"><%=category%></h3>
						<div class="row">
							<div class="col-lg-12 col-md-12 text-right">
								<p>총 <%=cnt%>개</p>
							</div>
						</div>
					</div>
					<div class="product-list">
						<div class="row">
							<%
							for (int i = 0; i < 9; i++) {
							%>
							<div class="col-lg-4 col-sm-6">
								<div class="product-item" id="productItem">
									<div class="pi-pic">
										<a href="product_detail"> <img
											src="${path}/resources/img/product-single/product_vegi01.jpeg"
											alt=""></a>
										<!-- <div class="sale pp-sale">Sale</div> -->
										<!-- <div class="icon">
											<i class="icon_heart_alt"></i>
										</div> -->
										<ul>
										<!-- 카트담기 버튼 -->
											<li class="w-icon active"><a href="#"><i
													class="icon_bag_alt"></i></a></li>
											<!-- <li class="quick-view"><a href="#">+ Quick View</a></li>
											<li class="w-icon"><a href="#"><i
													class="fa fa-random"></i></a></li> -->
										</ul>
									</div>
									<div class="pi-text">
										<!-- <div class="catagory-name">Towel</div> -->
										<a href="#">
											<h5>청경채</h5>
										</a>
										<!-- @@ 디비에 저장된 할인율로 계산해서 출력하기 @@ -->
										<div class="product-price">
											<strong class="discountedRate">30%</strong> 1,530원 <br>
											<span class="originPrice">2,190원</span>
										</div>
									</div>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
					<!-- @@ DB 연결하면 상세 작업하기 @@ -->
					<div class="row" id="pagediv">
						<div class="col-lg-12 text-center">
						<%if (startBlock > pageBlockCnt) { %>
							<a href="#" class="arrow_carrot-2left_alt pagingBtn" id="toFirst"></a> 
							<a href="#" class="arrow_carrot-left_alt pagingBtn" id="prev"></a> 
						<% }
						
						for (int i = startBlock; i <= endBlock; i++) { %>
							<span>
								<!----> <a class="pagingBtn" id="page<%=i%>" 
								onclick="changePageNum(<%=i%>, <%=endBlock%>);"><%=i %> <!----></a>
							</span> 
						<% }
						
						if (endBlock < pageBlockCnt) { %> 
							<a href="#" class="arrow_carrot-right_alt pagingBtn" id="next"></a> 
							<a href="#" class="arrow_carrot-2right_alt pagingBtn" id="toLast"></a>
						<% } %>
						</div>
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
	<script src="${path}/resources/js/product_js/productList.js"></script>
</body>

</html>