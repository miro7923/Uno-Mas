<%@page import="com.april.unomas.domain.UserVO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/product_css/wishlist.css?after" type="text/css">
<title>위시리스트</title>
<!-- Start Header -->

<body>
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
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
                    <div class="breadcrumb-text product-more wishName">
                        <span>위시리스트</span>
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
                    <form action="/product/wishlist/insert_cart">
                        <table>
                            <thead>
                                <tr>
                                	<th class="wishCheck"><input type="checkbox" name="selectall" value="selectall" onclick='selectAll(this)'/></th>
                                    <th>이미지</th>
                                    <th class="p-name">상품정보</th>
                                    <th>가격</th>
                                    <th></th>
                                    <th>삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${map.list}" var="list" varStatus="i">
                                <tr>
                                	<td class="wishCheck"><input type="checkbox" name="wishCheck" value="check" class="chBox" onclick='checkSelectAll()'
                                		data-wishNum="${list.wish_num}" data-prodNum="${list.prod_num}"/></td>
                                	<td class="cart-pic first-row wishImg">
                                		<a href="/product/product_detail?prod_num=${list.prod_num}">
                                		<img class="wishImg" src='<spring:url value="/resources/upload/images/products/thumbnail/thumbnail_${list.prod_num}.png"></spring:url>' alt="">
                                		</a></td>
                                    <td class="cart-title first-row">
                                    	<a href="/product/product_detail?prod_num=${list.prod_num}">
                                        <h5>${list.prod_name}</h5>
                                        </a></td>
                                    <c:choose>
                                    	<c:when test="${list.prod_discntrate != 0}">
                                    		<td class="p-price first-row"><fmt:formatNumber value="${list.prod_price*(100-list.prod_discntrate)/100}" type="number"/>원</td>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<td class="p-price first-row"><fmt:formatNumber value="${list.prod_price}" type="number"/>원</td>
                                    	</c:otherwise>
                                    </c:choose>
                                    <td class="cartInFirst">
                                        <div class="cartIn">
                                        	<input type="hidden" id="user_num" value="${sessionScope.saveID.user_num}">
                                        	<input type="hidden" id="prod_num${i.index}" value="${list.prod_num}">
                                        	<input type="hidden" id="prod_amount" value="1">
		                                    <button type="button" class="btn btn-outline-secondary btn-lg px-4 cartBtn" onclick="wishToCart(${i.index});">장바구니 담기</button>
                                        </div></td>
                                    <td class="close-td first-row"><a href="/product/wishlist/deleteWish?wish_num=${list.wish_num}"><i class="ti-close" ></i></a></td>
                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                        </form>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <button type="button" id="selectDelete_btn" class="primary-btn deleteSelect">선택삭제</button>
                                <button type="button" id="btnDelete" class="primary-btn deleteAll">전체삭제</button>
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
                                <button type="button" id="selectInsertWish_btn" class="green-btn">장바구니 선택 담기</button>
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
    <script src="${path}/resources/js/product_js/wishlist.js"></script>
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