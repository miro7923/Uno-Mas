<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="${path}/resources/css/user_css/myPageLeftBar.css">


<div class="left-bar">
	<div class="page_name"><a href="/UnoMas/user/mypage">마이페이지</a></div>
	
	<div class="mypage-cate">
		<h4>My 쇼핑</h4>
			<a href="/UnoMas/order/my_order">주문목록/배송조회</a>
			<a href="">취소/교환/환불</a>
			<a href="/UnoMas/product/wishlist/list?pageInfo=my">찜한 상품</a>
			<a href="/UnoMas/product/cart/list?pageInfo=my">장바구니</a>
		<br>
<!-- 		<h4>My 공동구매</h4> -->
<!-- 			<a href="">참여내역</a> -->
<!-- 		<br> -->

		
		<h4>My 활동</h4>
			<a href="/UnoMas/user/my_review">리뷰관리</a>
			<a href="/UnoMas/user/my_prod_qa">상품 문의 내역</a>
			<a href="/UnoMas/user/my_quesiton">1:1 문의</a>
		<br>
		
		<h4>My 정보</h4>
			<a href="/UnoMas/user/myInfo">개인정보확인/수정</a>
			<a href="/UnoMas/user/mypoint">포인트 내역</a>
		<br>
		
	</div>
	
	<a href="/UnoMas/user/return_guide"><div class="mypage-cate-info">취소/환불 안내</div></a>
</div>

<script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
<script src="${path}/resources/js/user_js/myPageLeftBar.js"></script>
</html>