<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<link rel="stylesheet" href="${path}/resources/css/user_css/myPageleftBar.css">


<div class="left-bar">
	<div class="page_name">마이페이지</div>
	
	<div class="mypage-cate">
		<h4>My 쇼핑</h4>
		<p>주문목록/배송조회</p>
		<p>취소/교환/환불</p>
		<p>찜한 상품</p>
		<p>장바구니</p>
		<br>
		<h4>My 공동구매</h4>
		<p>참여내역</p>
		<br>
		<h4>My 활동</h4>
		<p>리뷰관리</p>
		<p>상품 문의 내역</p>
		<p>1:1 문의</p>
		<br>
		<h4>My 정보</h4>
		<p>개인정보확인/수정</p>
		<p>배송지 관리</p>

	</div>
	<div class="mypage-cate-info">취소/환불 안내</div>
	<div class="mypage-cate-info">공동구매 안내</div>
</div>
</html>