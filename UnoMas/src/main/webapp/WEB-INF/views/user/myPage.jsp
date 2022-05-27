<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/user_css/myPage.css">
<title>UnoMas 마이페이지</title>
</head>
<body>
  <jsp:include page="../inc/top.jsp"></jsp:include>
  <jsp:include page="../inc/header.jsp"></jsp:include>
  
  <div class="mypage_container">
  	<jsp:include page="myPageLeftBar.jsp"></jsp:include>
  	
  	<div class="middle-container">
  	  <div class="top_bar">
  		<div>
  			<img src="${path}/resources/img/user_img/mypage_point.png" class="top_bar_img">
  			<span>적립금</span><br>
  			<span>150p</span>
  		</div>
  		<div>
  			<img src="${path}/resources/img/user_img/mypage_deliv.png" class="top_bar_img">
  			<span>배송중</span><br>
  			<span>7개</span>
  		</div>
  		<div>
  			<img src="${path}/resources/img/user_img/mypage_together.png" class="top_bar_img">
  			<span>공동구매</span><br>
  			<span>10회</span>
  		</div>
  		<div>
  			<img src="${path}/resources/img/user_img/mypage_review.png" class="top_bar_img">
  			<span>후기</span><br>
  			<span>10개</span>
  		</div>
  	  </div>
  	
  	  <div class="middle-content">
  			<h3>장바구니 <span><a href="/product/shopping-cart?pageInfo=my">+</a></span></h3>
  			<table class="cart-table">
  				<colgroup>
          			<col width="20%"><col width="30%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
        		</colgroup>
		  		<tr height="40">
					<th scope="col">이미지</th>
					<th scope="col">상품 정보</th>
					<th scope="col">금액</th>
					<th scope="col">수량</th>
					<th scope="col">주문</th>
					<th scope="col">삭제</th>
		  		</tr>
		  		<tr>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  		</tr>
  			</table>
  			
  			<h3 style="margin-top:50px;">전체 주문 내역 <span><a href="/order/my_order">+</a></span></h3>
  			<table class="cart-table">
  				<colgroup>
          			<col width="20%"><col width="30%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
        		</colgroup>
		  		<tr height="40">
					<th scope="col">주문일</th>
					<th scope="col">주문 번호</th>
					<th scope="col">수령인</th>
					<th scope="col">상품 정보</th>
					<th scope="col">금액</th>
					<th scope="col">주문 상태</th>
		  		</tr>
		  		<tr>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  			<td>이미지</td>
		  		</tr>
  			</table>
  	  </div>
  	
  	
  	  <div class="bottom-container">
  		<img src="${path}/resources/img/user_img/orderInfoImg.png">
  	  </div>
  	</div>
  	
  	
  </div>
  <jsp:include page="../inc/bottom.jsp"></jsp:include>
  
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