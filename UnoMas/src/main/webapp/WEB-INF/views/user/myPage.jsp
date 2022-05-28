<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/user_css/myPage.css">
<link rel="stylesheet" href="${path}/resources/css/order_css/myOrderList.css">
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
  			<h3>장바구니 <span><a href="/product/cart/list?pageInfo=my">+</a></span></h3>
  			<table class="cart-table">
  			  <colgroup>
          		<col width="10%"><col width="30%"><col width="10%"><col width="10%"><col width="10%">
        	  </colgroup>
        	  <thead>
		  		<tr class="table_top_tr">
					<th scope="col">이미지</th>
					<th scope="col">상품 정보</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">합계</th>
		  		</tr>
		  	  </thead>
		  	  
		  	  <tbody style="min-height: 300px">
		  	  	<c:forEach var="row" items="${list}" varStatus="i">
		  		 	<tr>
			  			<td class="cart-pic first-row">
			  				<img src='<spring:url value="/resources/upload/images/products/thumbnail/${row.prod_image3 }"></spring:url>' 
			  				alt="" style="width: 90px; height: 90px;">
						</td>
						<td class="cart-title first-row">${row.prod_name}</td>
						<td class="p-price first-row">
							<span id="prodPrice${i.index }">${row.prod_price }</span>원
						</td>
			  			<td>${row.prod_amount}개</td>
			  			<td>${row.prod_price*row.prod_amount} 원</td>
		  			</tr>
		  		</c:forEach>
		  	  </tbody>
  			</table>
  			
  			
  			
  			<h3 style="margin-top:50px;">주문 내역 <span><a href="/order/my_order">+</a></span></h3>
  			<table class="point_table">
				<colgroup>
				  <col style="width: 15%"><col style="width: 55%;"><col style="width: 15%"><col style="width: 15%">
				</colgroup>
				<tr class="table_top_tr">
					<th>주문일/주문번호</th><th>상품정보</th><th>상태</th><th>신청</th>
				</tr>
					
				<tbody>	
				<c:choose> 
					<c:when test="${empty orderMap }">
						<td colspan="4" class="null_text">상품 문의 내역이 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach var="map" items="${orderMap }" varStatus="it">
						  <fmt:formatDate var="regdate" value="${map.value[0].order_date}" pattern="yyyy-MM-dd" />
							<tr>
								<td rowspan="${fn:length(map.value) }" class="order_num_td">${regdate }<br>
										( ${map.key } )<br> 
										<a href="/order/order_detail" class="table_btn">주문 상세보기</a>
								</td>
								<c:forEach var="val" items="${map.value }" varStatus="itt">
									<td class="order_info_td">
										<img src='<spring:url value="/resources/upload/images/products/top/${val.prod_image1 }"></spring:url>' alt="이미지">
										<div>
											<a href="/product/product_detail?prod_num=${val.prod_num }" target="_blank"> ${val.prod_name } </a>
											<hr>
											<span>${val.prod_price }원</span> / <span>${val.order_quantity }개</span>
										 </div>
									</td>
								</c:forEach>
										
								<td rowspan="${fn:length(map.value) }">
								  <c:choose>
								  	<c:when test="${map.value[0].order_status eq '결제완료'}">
								  		<strong style="color: red;">${map.value[0].order_status }<strong><br>
								  	</c:when>
								  	<c:when test="${map.value[0].order_status eq '배송완료'}">
								  		<strong style="color: blue;">${map.value[0].order_status }<strong><br>
								  	</c:when>
								  	<c:otherwise>
								  		<strong>${map.value[0].order_status }<strong><br>
								  	</c:otherwise>
								  </c:choose>
									
								  <a href="" class="table_btn">배송조회</a>
								</td>
								<td><a href="" class="table_btn">반품신청</a><br> 
									<a href="" class="table_btn">교환신청</a>
								</td>
							</tr>
						</c:forEach>
			  		</c:otherwise>
			  	  </c:choose>
			  	</tbody>
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