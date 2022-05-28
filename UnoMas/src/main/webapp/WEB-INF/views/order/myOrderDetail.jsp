<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/order_css/myOrderDetail.css">
<title>UnoMas 주문내역 상세페이지</title>
</head>
<body>
  <jsp:include page="../inc/top.jsp"></jsp:include>
  <jsp:include page="../inc/header.jsp"></jsp:include>
  
	<div class="mypage_container">
		<jsp:include page="../user/myPageLeftBar.jsp"></jsp:include>
	  	
		<div class="middle-container">
			<div class="middle-content">
				<h3>주문 상세 내역</h3>
				<table class="product-info">
					<colgroup>
						<col width="15%"><col width="55%"><col width="15%"><col width="15%">
					</colgroup>
					<tr height="40">
						<th scope="col" colspan="2">상품정보</th>
						<th scope="col">배송비</th>
						<th scope="col">주문/배송상태</th>
					</tr>
					<tr>
						<td id="product-info-img">상품사진자리</td>
						<td class="product-name">상품1</td>
						<td rowspan="2" class="delivery-fee">무료</td>
						<td rowspan="2">배송중</td>
					</tr>
					<tr>
						<td>상품사진자리</td>
						<td class="product-name">상품2</td>
					</tr>
				</table>
			
				<h3 style="margin-top:50px;">배송지 정보</h3>
				<table class="shipping-address">
					<colgroup>
						<col width="20%"><col width="80%">
					</colgroup>
					<tr height="40" class="sa-tr">
						<th scope="col" class="sa-th">받는사람 이름</th>
						<td></td>
					</tr>
					<tr class="sa-tr">
						<th scope="col" class="sa-th">연락처</th>
						<td></td>
					</tr>
					<tr class="sa-tr">
						<th scope="col" class="sa-th">주소</th>
						<td></td>
					</tr>
					<tr class="sa-tr">
						<th scope="col" class="sa-th">배송시 요청사항</th>
						<td></td>
					</tr>
				</table>
				
				<h3 style="margin-top:50px;">결제 금액 정보</h3>
				<table class="payment-info">
					<colgroup>
						<col width="11%"><col width="11%"><col width="3%"><col width="11%"><col width="11%"><col width="3%">
						<col width="10%"><col width="10%"><col width="5%"><col width="12%"><col width="13%">
					</colgroup>
					<tr id="paymentFirstLine">
						<th scope="col" colspan="2">주문 금액</th>
						<th scope="col"></th>
						<th scope="col" colspan="2">할인 금액</th>
						<th scope="col"></th>
						<th scope="col" colspan="2">포인트 결제액</th>
						<th scope="col"></th>
						<th scope="col" colspan="2">결제 금액</th>
					</tr>
					<tr id="paymentSecondLine">
						<td colspan="2" class="nonblank">21,800원</td>
						<td></td>
						<td colspan="2" class="nonblank">0원</td>
						<td></td>
						<td colspan="2" class="nonblank">10P</td>
						<td></td>
						<td colspan="2" class="nonblank">21,790원</td>
					</tr>
					<tr id="paymentThirdLine">
						<td class="name"><br>상품금액<br>배송비</td>
						<td class="money"><br>21,800원<br>0원</td>
						<td></td>
						<td class="name"><br>상품할인<br>배송비할인<br>장바구니할인</td>
						<td class="money"><br>0원<br>0원<br>0원</td>
						<td></td>
						<td class="name"><br>포인트</td>
						<td class="money"><br>10P</td>
						<td></td>
						<td class="name"><br>주문금액<br>할인금액<br>포인트</td>
						<td class="money"><br>21,800원<br>0원<br>(-) 10P</td>
					</tr>
					<tr id="paymentFourthLine">
						<th>결제수단</th>
						<td colspan="8">신용카드 (KB국민카드)</td>
						<td colspan="2"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
  	
  	
  	  <div class="bottom-container">
  	  </div>
  	
  	
  <jsp:include page="../inc/bottom.jsp"></jsp:include>
  
  <script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
  <script src="${path}/resources/js/main.js"></script> 
  
</body>
</html>