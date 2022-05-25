<%@page import="com.april.unomas.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="zxx">
<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/shopping-cart.css?after" type="text/css">
<!-- Start Header -->

<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text product-more">
						<span>장바구니</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">
						<c:choose>
							<c:when test="${fn:length(list) == 0}">
								<table>
									<thead>
										<tr>
											<th class="cartCheck"><input type="checkbox"
												name="selectall" value="selectall" onclick='selectAll(this)' /></th>
											<th>이미지</th>
											<th class="p-name">상품 정보</th>
											<th>가격</th>
											<th>수량</th>
											<th>합계</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="7" class="emptyCart">장바구니가 비었습니다.</td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:otherwise>
								<form id="cartForm" name="cartForm" method="post"
									action="/order/order">
									<table>
										<thead>
											<tr>
												<th class="cartCheck">
												<input type="checkbox" checked="checked"
													name="selectall" value="selectall"
													onclick='selectAll(this)' /></th>
												<th>이미지</th>
												<th class="p-name">상품 정보</th>
												<th>가격</th>
												<th>수량</th>
												<th>합계</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
										    <input type="hidden" value="${fn:length(list) }" id="listLen">
											<c:forEach var="row" items="${list}" varStatus="i">
												<tr>
													<td class="cartCheck">
													<input type="checkbox" id="checkbox${i.index }"
														name="cartCheck" value="1" onclick='checkSelectAll()'
														data-wishNum="${row.cart_num}" /> 
														<input type="hidden" id="cartNum${i.index }" value="${row.cart_num }">
													</td>
													<td class="cart-pic first-row"><img
														src='<spring:url value="/resources/upload/images/products/thumbnail/${row.prod_image3 }"></spring:url>' alt=""
														width="80" height="80"></td>
													<td class="cart-title first-row">${row.prod_name}</td>
													<td class="p-price first-row">
													<%-- <fmt:formatNumber value="${row.prod_price}" pattern="#,###,###" /> --%>
													<span id="prodPrice${i.index }">${row.prod_price }</span>
													<input type="hidden" id="prodOriginPrice${i.index }" value="${row.prod_price }">
													원</td>
													<td class="qua-col first-row">
														<div class="quantity">
															<div class="pro-qty-cart">
															    <span class="dec qtybtn" onclick="calcTotalPrice(${i.index}, 'dec');">-</span>
																<input type="text" name="amount" id="amount${i.count}"
																	value="${row.prod_amount}" min="1">
															    <span class="inc qtybtn" onclick="calcTotalPrice(${i.index}, 'inc');">+</span>
															</div>
														</div> 
														<input type="hidden" name="cartNum" value="${row.cart_num}"> 
														<input type="hidden" value="${row.prod_num }" id="prod_num${i.count }">
													</td>
													<td class="total-price first-row">
													<%-- <fmt:formatNumber
															value="${row.prod_price*row.prod_amount}"
															pattern="#,###,###" /> --%>
													<span id="prodTotalPrice${i.index }">${row.prod_price*row.prod_amount}</span>
													원</td>
													<td class="close-td first-row"><a
														href="${path}/product/cart/delete?cart_num=${row.cart_num}"><i
															class="ti-close"></i></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="row">
										<div class="col-lg-4">
											<div class="cart-buttons">
												<a href="/index" class="primary-btn continue-shop">쇼핑
													계속하기</a>
												<button type="button" id="btnDelete"
													class="primary-btn up-cart">장바구니 비우기</button>
											</div>
										</div>
										<div class="col-lg-4 offset-lg-4">
											<!--                         	<div class="cartUpdate"> -->
											<!--                                 <button type="submit" id="btnUpdate" class="primary-btn up-cart">장바구니 수정하기</button> -->
											<!--                         	</div> -->
											<div class="proceed-checkout">
												<ul>
													<li class="subtotal">총 상품가격 <span id="subTotal">
													<%-- <fmt:formatNumber
																value="${sumMoney}" pattern="#,###,###" /> --%>
													${sumMoney} 원</span>
													<input type="hidden" name="subTotal" id="inputSubTotal" value="${sumMoney }">
													</li>
													<li class="shipping">배송비 <span id="spanShippingFee">${fee} 원</span>
													<input type="hidden" value="${fee }" name="shippingFee" id="shippingFee">
													</li>
													<li class="cart-total">총 결제 예상금액 <span id="total">
													<%-- <fmt:formatNumber value="${sum}" pattern="#,###,###" /> --%>
													${sum} 원</span>
													<input type="hidden" value="${sum }" name="total" id="inputTotal">
													</li>
												</ul>
												<input type="hidden" name="selectedItems" id="selectedItems">
												<button type="button" class="proceed-btn" onclick="goOrder();">주문하기</button>
											</div>
										</div>
									</div>
								</form>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

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
	<script src="${path}/resources/js/product_js/shopping-cart.js"></script>
</body>

</html>