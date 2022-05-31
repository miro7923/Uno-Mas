<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="${path}/resources/css/user_css/myPageLeftBar.css">


<div class="left-bar">
	<div class="page_name">관리자페이지</div>
	
	<div class="mypage-cate">
		<h4>상품관리</h4>
		<a href="/UnoMas/product/product_register">상품 등록</a>
		<a href="/UnoMas/product/product_lookup">상품 조회</a>
		<br>
		
		<h4>회원관리</h4>
		<a href="/UnoMas/admin/all_user">회원 조회</a>
		<br>
		
		<h4>공지사항</h4>
		<a href="/UnoMas/admin/notice_board">공지사항</a>
		<a href="/UnoMas/admin/notice_write">공지사항 등록</a>
		<br>
		
		<h4>자주하는 질문</h4>
		<a href="/UnoMas/admin/faq_board">자주하는 질문</a>
		<a href="/UnoMas/admin/faq_write">자주하는 질문 등록</a>
		<br>
		
		<h4>1:1문의</h4>
		<a href="/UnoMas/admin/qna_board">1:1문의</a>

	</div>
		<a href="/UnoMas/admin/main"><div class="mypage-cate-info">관리자 홈</div></a>
</div>
</html>