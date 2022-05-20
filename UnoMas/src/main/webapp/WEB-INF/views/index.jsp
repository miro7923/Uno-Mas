<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
				<c:forEach items="${readcntList2}" var="rl2">
				<dl class="itemList">
					<dt class="thumb">
						<a href="/product/product_detail?prod_num=${rl2.prod_num}">
							<img class="hot1" src="<spring:url value="/resources/upload/images/products/thumbnail/${rl2.prod_image3 }"></spring:url>" alt="hot이미지1">
						</a>
					</dt>
					<dd class="prdInfo">
						<p class="prdName">
							<a href="/product/product_detail?prod_num=${rl2.prod_num}">${rl2.prod_name}</a>
						</p>
						<c:choose>
		                    <c:when test="${rl2.prod_discntrate eq 0}">
						        <div>
						        	<p class="prdPrice">
						        	<fmt:formatNumber value="${rl2.prod_price}" type="number"/>원
						        	</p>
						        </div>
		                    </c:when>
		                    <c:otherwise>
						        <div>
									<p class="prdPrice">
								    <del><fmt:formatNumber value="${rl2.prod_price}" type="number"/>원</del><br>
								    <fmt:formatNumber value="${rl2.prod_price*(100-rl2.prod_discntrate)/100}" type="number"/>원
								    </p>
						        </div>
		                    </c:otherwise>
                        </c:choose>
					</dd>
				</dl>
				</c:forEach>
				<c:forEach items="${sellcntList2}" var="sl2">
				<dl class="itemList">
					<dt class="thumb">
						<a href="/product/product_detail?prod_num=${sl2.prod_num}">
							<img class="hot1" src="<spring:url value="/resources/upload/images/products/thumbnail/${sl2.prod_image3 }"></spring:url>" alt="hot이미지2">
						</a>
					</dt>
					<dd class="prdInfo">
						<p class="prdName">
							<a href="/product/product_detail?prod_num=${sl2.prod_num}">${sl2.prod_name}</a>
						</p>
						<c:choose>
		                    <c:when test="${sl2.prod_discntrate eq 0}">
						        <div>
						        	<p class="prdPrice">
						        	<fmt:formatNumber value="${sl2.prod_price}" type="number"/>원
						        	</p>
						        </div>
		                    </c:when>
		                    <c:otherwise>
						        <div>
									<p class="prdPrice">
								    <del><fmt:formatNumber value="${sl2.prod_price}" type="number"/>원</del><br>
								    <fmt:formatNumber value="${sl2.prod_price*(100-sl2.prod_discntrate)/100}" type="number"/>원
								    </p>
						        </div>
		                    </c:otherwise>
                        </c:choose>
					</dd>
				</dl>
				</c:forEach>
				<c:forEach items="${brandnewList2}" var="bl2">
				<dl class="itemList">
					<dt class="thumb">
						<a href="/product/product_detail?prod_num=${bl2.prod_num}">
							<img class="hot1" src="<spring:url value="/resources/upload/images/products/thumbnail/${bl2.prod_image3 }"></spring:url>" alt="hot이미지3">
						</a>
					</dt>
					<dd class="prdInfo">
						<p class="prdName">
							<a href="/product/product_detail?prod_num=${bl2.prod_num}">${bl2.prod_name}</a>
						</p>
						<c:choose>
		                    <c:when test="${bl2.prod_discntrate eq 0}">
						        <div>
						        	<p class="prdPrice">
						        	<fmt:formatNumber value="${bl2.prod_price}" type="number"/>원
						        	</p>
						        </div>
		                    </c:when>
		                    <c:otherwise>
						        <div>
									<p class="prdPrice">
								    <del><fmt:formatNumber value="${bl2.prod_price}" type="number"/>원</del><br>
								    <fmt:formatNumber value="${bl2.prod_price*(100-bl2.prod_discntrate)/100}" type="number"/>원
								    </p>
						        </div>
		                    </c:otherwise>
                        </c:choose>
					</dd>
				</dl>
				</c:forEach>
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
<%--                    	<% 
                    		int ttn = 0;
                    		int cateStart = 0;
                    		int cateEnd = 0;
                    		ttn =Integer.parseInt(%>${rl.topcate_num}<%);
                    		switch(ttn){
                    			case 1: cateStart = 1; cateEnd = 3;
                    				break;
                    			case 2: cateStart = 4; cateEnd = 7;
                    				break;
                    			case 3: cateStart = 7; cateEnd = 10;
                    				break;
                    			case 4: cateStart = 11; cateEnd = 15;
                    				break;
                    			case 5:	cateStart = 16; cateEnd = 18;
                    				break;
                    		}
                    	%> --%>
                        <div class="product-item">
                            <div class="pi-pic">
                            	<a href="/product/product_detail?prod_num=${rl.prod_num}">
                                	<img src="<spring:url value="/resources/upload/images/products/thumbnail/${rl.prod_image3 }"></spring:url>" alt="hot이미지1">
                            	</a>
                            	<c:choose>
                            		<c:when test="${rl.prod_discntrate>0}">
		                                <div class="sale">Sale</div>
                            		</c:when>
                            	</c:choose>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href=""><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
<%--                             	<a href="/product/product_list?cateStart=<%=cateStart%>&cateEnd=<%=cateEnd %>&topcate_num=${rl.topcate_num}&pageNum=1&dcate_num=0"></a> --%>
                                <div class="catagory-name">${rl.dcate_name}</div>
                                <a href="/product/product_detail?prod_num=${rl.prod_num}">
                                    <h5>${rl.prod_name}</h5>
                                </a>
                                <c:choose>
                                	<c:when test="${rl.prod_discntrate eq 0}">
		                                <div class="product-price">
		                                    <fmt:formatNumber value="${rl.prod_price}" type="number"/>원
		                                </div>
                                	</c:when>
                                	<c:otherwise>
		                                 <div class="product-price">
		                                    <fmt:formatNumber value="${rl.prod_price*(100-rl.prod_discntrate)/100}" type="number"/>원
		                                    <span><fmt:formatNumber value="${rl.prod_price}" type="number"/>원</span>
		                                </div>
                                	</c:otherwise>
                                </c:choose>
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
                    <div class="product-large set-bg" id="highSold" data-setbg="${path}/resources/img/products/women-large.jpg">
                        <h2>판매량 높은 상품</h2>
                        <a href="#">Discover More</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="product-slider owl-carousel">
                    	<c:forEach items="${sellcntList}" var="sl">
<%--                    	<% 
                    		int ttn = 0;
                    		int cateStart = 0;
                    		int cateEnd = 0;
                    		ttn =Integer.parseInt(%>${rl.topcate_num}<%);
                    		switch(ttn){
                    			case 1: cateStart = 1; cateEnd = 3;
                    				break;
                    			case 2: cateStart = 4; cateEnd = 7;
                    				break;
                    			case 3: cateStart = 7; cateEnd = 10;
                    				break;
                    			case 4: cateStart = 11; cateEnd = 15;
                    				break;
                    			case 5:	cateStart = 16; cateEnd = 18;
                    				break;
                    		}
                    	%> --%>
                        <div class="product-item">
                            <div class="pi-pic">
                            	<a href="/product/product_detail?prod_num=${sl.prod_num}">
                                	<img src="<spring:url value="/resources/upload/images/products/thumbnail/${sl.prod_image3 }"></spring:url>" alt="hot이미지1">
                            	</a>
                            	<c:choose>
                            		<c:when test="${sl.prod_discntrate>0}">
		                                <div class="sale">Sale</div>
                            		</c:when>
                            	</c:choose>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
<%--                             	<a href="/product/product_list?cateStart=<%=cateStart%>&cateEnd=<%=cateEnd %>&topcate_num=${rl.topcate_num}&pageNum=1&dcate_num=0"></a> --%>
                                <div class="catagory-name">${sl.dcate_name}</div>
                                <a href="/product/product_detail?prod_num=${sl.prod_num}">
                                    <h5>${sl.prod_name}</h5>
                                </a>
                                <c:choose>
                                	<c:when test="${sl.prod_discntrate eq 0}">
		                                <div class="product-price">
		                                    <fmt:formatNumber value="${sl.prod_price}" type="number"/>원
		                                </div>
                                	</c:when>
                                	<c:otherwise>
		                                 <div class="product-price">
		                                    <fmt:formatNumber value="${sl.prod_price*(100-sl.prod_discntrate)/100}" type="number"/>원
		                                    <span><fmt:formatNumber value="${sl.prod_price}" type="number"/>원</span>
		                                </div>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        </c:forEach>
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
                    <div class="product-large set-bg" id="highSold" data-setbg="${path}/resources/img/products/women-large.jpg">
                        <h2>신상품</h2>
                        <a href="/product/new_list">Discover More</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="product-slider owl-carousel">
                    	<c:forEach items="${brandnewList}" var="bl">
<%--                    	<% 
                    		int ttn = 0;
                    		int cateStart = 0;
                    		int cateEnd = 0;
                    		ttn =Integer.parseInt(%>${rl.topcate_num}<%);
                    		switch(ttn){
                    			case 1: cateStart = 1; cateEnd = 3;
                    				break;
                    			case 2: cateStart = 4; cateEnd = 7;
                    				break;
                    			case 3: cateStart = 7; cateEnd = 10;
                    				break;
                    			case 4: cateStart = 11; cateEnd = 15;
                    				break;
                    			case 5:	cateStart = 16; cateEnd = 18;
                    				break;
                    		}
                    	%> --%>
                        <div class="product-item">
                            <div class="pi-pic">
                            	<a href="/product/product_detail?prod_num=${bl.prod_num}">
                                	<img src="<spring:url value="/resources/upload/images/products/thumbnail/${bl.prod_image3 }"></spring:url>" alt="hot이미지1">
                            	</a>
                            	<c:choose>
                            		<c:when test="${bl.prod_discntrate>0}">
		                                <div class="sale">Sale</div>
                            		</c:when>
                            	</c:choose>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
<%--                             	<a href="/product/product_list?cateStart=<%=cateStart%>&cateEnd=<%=cateEnd %>&topcate_num=${rl.topcate_num}&pageNum=1&dcate_num=0"></a> --%>
                                <div class="catagory-name">${bl.dcate_name}</div>
                                <a href="/product/product_detail?prod_num=${bl.prod_num}">
                                    <h5>${bl.prod_name}</h5>
                                </a>
                                <c:choose>
                                	<c:when test="${bl.prod_discntrate eq 0}">
		                                <div class="product-price">
		                                    <fmt:formatNumber value="${bl.prod_price}" type="number"/>원
		                                </div>
                                	</c:when>
                                	<c:otherwise>
		                                 <div class="product-price">
		                                    <fmt:formatNumber value="${bl.prod_price*(100-bl.prod_discntrate)/100}" type="number"/>원
		                                    <span><fmt:formatNumber value="${bl.prod_price}" type="number"/>원</span>
		                                </div>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        </c:forEach>
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