<%@page import="com.april.unomas.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="zxx">
<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/shopping-cart.css?after" type="text/css">
<!-- Start Header -->

<body>
	<%
	UserVO vo = (UserVO)session.getAttribute("saveID");
	%>
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
					    	<c:when test="${map.count == 0}">
					    		<table>
		                        	<thead>
		                            	<tr>
		                                	<th class="cartCheck"><input type="checkbox" name="selectall" value="selectall" onclick='selectAll(this)'/></th>
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
					    		<form id="cartForm" name="cartForm" method="post" action="${path}/product/cart/updateCart">
							    	<table>
			                            <thead>
			                                <tr>
			                                	<th class="cartCheck"><input type="checkbox" name="selectall" value="selectall" onclick='selectAll(this)'/></th>
			                                    <th>이미지</th>
			                                    <th class="p-name">상품 정보</th>
			                                    <th>가격</th>
			                                    <th>수량</th>
			                                    <th>합계</th>
			                                    <th>삭제</th>
			                                </tr>
			                            </thead>
			                            <tbody>
			                                <c:forEach var="row" items="${map.list}" varStatus="i">
			                                <tr>
			                                	<td class="cartCheck"><input type="checkbox" name="cartCheck" value="check"  onclick='checkSelectAll()'
                                					data-wishNum="${row.cart_num}"/></td>
			                                    <td class="cart-pic first-row"><img src="img/cart-page/product-1.jpg" alt=""></td>
			                                    <td class="cart-title first-row">${row.prod_name}</td>
			                                    <td class="p-price first-row"><fmt:formatNumber value="${row.prod_price}" pattern="#,###,###" />원</td>
			                                    <td class="qua-col first-row">
			                                        <div class="quantity">
			                                            <div class="pro-qty">
			                                                <input type="text" name="amount" value="${row.prod_amount}" min="1">
			                                            </div>
			                                        </div>
			                                        <input type="hidden" name="cartNum" value="${row.cart_num}">
			                                    </td>
			                                    <td class="total-price first-row"><fmt:formatNumber value="${row.prod_price*row.prod_amount}" pattern="#,###,###" />원</td>
			                                    <td class="close-td first-row"><a href="${path}/product/cart/delete?cart_num=${row.cart_num}"><i class="ti-close"></i></a></td>
			                                </tr>
			                                </c:forEach>
			                            </tbody>
			                        </table>
					    		</form>
					    	</c:otherwise>
					    </c:choose>
					</div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <a href="/index" class="primary-btn continue-shop">쇼핑 계속하기</a>
                                <button type="button" id="btnDelete" class="primary-btn up-cart">장바구니 비우기</button>
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
<!--                         	<div class="cartUpdate"> -->
<!--                                 <button type="submit" id="btnUpdate" class="primary-btn up-cart">장바구니 수정하기</button> -->
<!--                         	</div> -->
                            <div class="proceed-checkout">
                                <ul>
                                    <li class="subtotal">총 상품가격 <span><fmt:formatNumber value="${map.sumMoney}" pattern="#,###,###" />원</span></li>
                                    <li class="shipping">배송비 <span>${map.fee}원</span></li>
                                    <li class="cart-total">총 결제 예상금액 <span><fmt:formatNumber value="${map.sum}" pattern="#,###,###" />원</span></li>
                                </ul>
                                <a href="check-out" class="proceed-btn">구매하기</a>
                            </div>
                        </div>
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
    <script src="${path}/resources/js/product_js/shopping-cart.js"></script>
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