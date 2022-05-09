<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="${path}/resources/css/user_css/myPageLeftBar.css">


<div class="left-bar">
	<div class="page_name">마이페이지</div>
	
	<div class="mypage-cate">
		<h4>My 쇼핑</h4>
		<a href="">주문목록/배송조회</a>
		<a href="">취소/교환/환불</a>
		<a href="">찜한 상품</a>
		<a href="">장바구니</a>
		<br>
		
		<h4>My 공동구매</h4>
		<a href="">참여내역</a>
		<br>
		
		<h4>My 활동</h4>
		<a href="">리뷰관리</a>
		<a href="">상품 문의 내역</a>
		<a href="">1:1 문의</a>
		<br>
		
		<h4>My 정보</h4>
		<a href="myInfo">개인정보확인/수정</a>

	</div>
		<a href="return_guide"><div class="mypage-cate-info">취소/환불 안내</div></a>
		<div class="mypage-cate-info">공동구매 안내</div>
</div>
</html>