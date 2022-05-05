<%@page import="org.springframework.ui.Model"%>
<%@page import="com.april.unomas.domain.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/productList.css?afte">
<!-- Start Header -->

<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 order-1 order-lg-2">
					<div class="categoryBox">
						<h3 class="title">${topcate }</h3>
						<ul class="categoryList">
						    <input type="hidden" id="dcateNum" value="${dcate_num }"> 
						    <li><a href="/product/product_list?cateStart=${cateStart }&cateEnd=${cateEnd}&topcate_num=${topcate_num}&pageNum=${pageNum}&dcate_num=0" 
						        class="category" id="category0" style="color: black;" 
						        onclick="changeSort(0, 0, ${fn:length(dcateList) });"> 전체보기</a>
							<c:forEach var="dcate" begin="0" end="${cateEnd-cateStart }" step="1" varStatus="it">
								<li><a href="/product/product_list?cateStart=${cateStart }&cateEnd=${cateEnd}&topcate_num=${topcate_num}&pageNum=${pageNum}&dcate_num=${cateStart+dcate}" 
								class="category" id="category${cateStart+dcate }" style="color: black;" 
									onclick="changeSort(${cateStart+dcate }, ${cateStart }, ${fn:length(dcateList) });"> ${dcateList[it.index] }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-12 col-md-12 text-right">
								<p>총 ${postCnt } 개</p>
							</div>
						</div>
					</div>
					<div class="product-list">
						<div class="row">
						    <input type="hidden" id="prodListLen" value="${fn:length(productList) }">
						    
						    <c:forEach var="vo" items="${productList }" varStatus="it">
								<div class="col-lg-4 col-sm-6">
									<div class="product-item" id="productItem">
										<div class="pi-pic">
											<a href="product_detail"> 
											<img
												src="${path}/resources/img/product-single/product_vegi01.jpeg"
												alt=""></a>
											<ul>
											<!-- 카트담기 버튼 -->
												<li class="w-icon active"><a href="#"><i
														class="icon_bag_alt"></i></a></li>
											</ul>
										</div>
										<div class="pi-text">
											<a href="#">
												<h5>${vo.prod_name }</h5>
											</a>
											<div class="product-price" id="prod${it.index }">
												${vo.prod_price }원
											</div>
											<!-- <div class="productSubTitle">
											    아삭하고 부드러운
											</div> -->
										</div>
									</div>
								</div>
							</c:forEach>
							
						</div>
					</div>
					<!-- @@ DB 연결하면 상세 작업하기 @@ -->
					<div class="row" id="pagediv">
						<div class="col-lg-12 text-center">
						<c:if test="${startBlock > pageBlockCnt }">
							<a href="#" class="arrow_carrot-2left_alt pagingBtn" id="toFirst"></a> 
							<a href="#" class="arrow_carrot-left_alt pagingBtn" id="prev"></a> 
						</c:if>
						
						<c:forEach var="block" varStatus="it" begin="${startBlock }" end="${endBlock }" step="1">
							<span>
								<!----> <a href="/product/product_list?cateStart=${cateStart }&cateEnd=${cateEnd }&topcate_num=${topcate_num }&pageNum=${it.index}&dcate_num=${dcate_num}" 
								class="pagingBtn" id="page${it.index }" style="color: black;"
								onclick="changePageNum(${it.index }, ${endBlock });">${it.index } <!----></a>
							</span> 
						</c:forEach>
						
						<c:if test="${endBlock > pageBlockCnt }">
							<a href="#" class="arrow_carrot-right_alt pagingBtn" id="next"></a> 
							<a href="#" class="arrow_carrot-2right_alt pagingBtn" id="toLast"></a>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Shop Section End -->

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
	<script src="${path}/resources/js/productList.js?123"></script>
</body>

</html>