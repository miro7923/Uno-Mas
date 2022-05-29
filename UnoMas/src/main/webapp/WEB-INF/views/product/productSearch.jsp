<%@page import="org.springframework.ui.Model"%>
<%@page import="com.april.unomas.domain.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/product_css/productList.css?afte">
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
<%-- 						<h3 class="title">${topcate }</h3> --%>
<%-- 						<c:if test="${topcate_num <= 5 }"> --%>
							<ul class="categoryList">
<%-- 							    <input type="hidden" id="dcateNum" value="${dcate_num }">  --%>
							    <li><span class="category" id="category0" style="color: black;">${pm.cri.keyword }</span>
								<c:forEach var="dcate" items="${dcateNumList }" varStatus="it">
									<li><a href="/product/product_list?topcate_num=${topcate_num}&pageNum=1&dcate_num=${dcate}" 
									class="category" id="category${dcate }" style="color: black;" 
										onclick="changeSort(${dcate }, ${fn:length(dcateList) });"> ${dcateList[it.index] }</a></li>
								</c:forEach>
							</ul>
<%-- 						</c:if> --%>
					</div>
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-12 col-md-12 text-right">
								<p>총 ${pm.totalCount } 개</p>
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
											<a href="/product/product_detail?prod_num=${vo.prod_num }"> 
											<c:choose>
												<c:when test="${vo.prod_stock == 0 }">
													<img src='<spring:url value="/resources/upload/images/products/soldout/${vo.prod_image4 }"></spring:url>' alt="" class="soldOut">
												</c:when>
												<c:otherwise>
													<img src="<spring:url value="/resources/upload/images/products/thumbnail/${vo.prod_image3 }"></spring:url>" alt="">
												</c:otherwise>
											</c:choose>
											</a>
											<ul>
											<!-- 카트담기 버튼 -->
											    <c:if test="${vo.prod_stock > 0 }">
												    <c:choose>
												        <c:when test="${sessionScope.saveID != null }">
															<li class="w-icon active"><a href="javascript:void(0);" onclick="insertCart(${sessionScope.saveNUM}, ${vo.prod_num });">
															<i class="icon_bag_alt"></i></a></li>
												        </c:when>
												        <c:otherwise>
												        	<li class="w-icon active"><a href="javascript:void(0);" onclick="askLogin();">
												        	<i class="icon_bag_alt"></i></a></li>
												        </c:otherwise>
												    </c:choose>
											    </c:if>
											</ul>
										</div>
										<div class="pi-text">
											<a href="/product/product_detail?prod_num=${vo.prod_num }">
											    <c:choose>
											        <c:when test="${vo.prod_stock == 0 }">
														<h5>${vo.prod_name } (품절)</h5>
											        </c:when>
											        <c:otherwise>
											        	<h5>${vo.prod_name }</h5>
											        </c:otherwise>
											    </c:choose>
											</a>
											    <c:choose>
												    <c:when test="${vo.prod_discntrate eq 0}">
														<div class="product-price">
															<fmt:formatNumber value="${vo.prod_price}"/>원
														</div>
												    </c:when>
												    <c:otherwise>
												        <span class="product-price discountedRate">${vo.prod_discntrate}%</span>
												        <span class="product-price">
													        <c:set var="discnted" value="${vo.prod_price*(100-vo.prod_discntrate)/100}"/>
													        <fmt:formatNumber value="${discnted+((discnted%10>5)?(10-(discnted%10))%10:-(discnted%10))}" type="number"/>원<br>
												        </span>
												        <div class="product-price">
													        <span><fmt:formatNumber value="${vo.prod_price}" type="number"/>원</span>
												        </div>
												    </c:otherwise>
											    </c:choose>
										</div>
									</div>
								</div>
							</c:forEach>
							
						</div>
					</div>
					<div class="row" id="pagediv">
						<div class="col-lg-12 text-center">
						<c:if test="${pm.prev }">
						        
						            <a href="/product/sale_list?pageNum=${pm.startPage - 1}" class="arrow_carrot-left_alt pagingBtn" id="prev"></a>
						</c:if>
						
						<c:forEach var="block" varStatus="it" begin="${pm.startPage }" end="${pm.endPage }" step="1">
							<span>
								        <!----> <a href="/product/sale_list?pageNum=${it.index}" 
										class="pagingBtn" id="page${it.index }" style="color: black;"
										onclick="changePageNum(${it.index }, ${pm.endPage - pm.startPage + 1 });">${block } <!----></a>
							</span> 
						</c:forEach>
						
						<c:if test="${pm.next && pm.endPage > 0 }">
						            <a href="/product/sale_list?pageNum=${pm.endPage + 1}" class="arrow_carrot-right_alt pagingBtn" id="next"></a>
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
	<script src="${path}/resources/js/product_js/productList.js?1"></script>
</body>

</html>