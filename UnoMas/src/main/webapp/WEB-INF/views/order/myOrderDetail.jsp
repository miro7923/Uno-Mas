<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/order_css/myOrderDetail.css">
<title>주문 상세 페이지</title>
</head>
<body>
  <jsp:include page="../inc/top.jsp"></jsp:include>
  <jsp:include page="../inc/header.jsp"></jsp:include>
  
	<div class="mypage_container">
		<jsp:include page="../user/myPageLeftBar.jsp"></jsp:include>
	  	
		<div class="middle-container">
			<div class="middle-content">
				<c:forEach var="map" items="${orderMap }">
				<h3>주문 상세 내역</h3>
				<table class="product-info">
					<colgroup>
						<col width="40%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
					</colgroup>
					<tr style="height: 40px;">
						<th scope="col">상품정보</th>
						<th scope="col">수량</th>
						<th scope="col">전체 가격</th>
						<th scope="col">배송비</th>
						<th scope="col">주문/배송상태</th>
					</tr>
					<c:set var="total_cost" value="0" />
					  <c:forEach var="val" items="${map.value }" varStatus="itt">
						<c:set var="total_cost" value="${total_cost + val.order_total }" />
						<c:set var="lenval" value="${map.value.size() }"/>
						  <tr>
							<td class="product-info-img">
								<img src='<spring:url value="/resources/upload/images/products/top/${val.prod_image1 }"></spring:url>' alt="이미지">
								<div>
								  <a href="/product/product_detail?prod_num=${val.prod_num }">${val.prod_name }</a>
								</div>
								
							</td>	
					  			
							<td>
								${val.order_quantity }개<br><fmt:formatNumber value="${val.order_total }" pattern="#,###" />
							</td>
							<c:if test="${itt.index eq '0' }">
								<td rowspan="${lenval }" class="delivery-fee">
									<fmt:formatNumber value="${payInfo.pay_total_price }" pattern="#,###" />
								</td>
								<td rowspan="${lenval }" class="delivery-fee">
									<fmt:formatNumber value="${payInfo.pay_shippingfee }" pattern="#,###" />
								</td>
								<td rowspan="${lenval }">${val.order_status }</td>
							</c:if>
						</tr>
						
						
					  </c:forEach>
	
				</table>
			
				<h3 style="margin-top:50px;">배송지 정보</h3>
				<table class="shipping-address">
					<colgroup>
						<col width="20%"><col width="80%">
					</colgroup>
					<tr height="40" class="sa-tr">
						<th scope="col" class="sa-th">받는사람 이름</th>
						<td>${map.value[0].order_recipient }</td>
					</tr>
					<tr class="sa-tr">
						<th scope="col" class="sa-th">연락처</th>
						<td>010-1111-2222</td>
					</tr>
					<tr class="sa-tr">
						<th scope="col" class="sa-th">주소</th>
						<td>[${map.value[0].order_postalcode }] ${map.value[0].order_roadaddr } ${map.value[0].order_detailaddr }</td>
					</tr>
					<tr class="sa-tr">
						<th scope="col" class="sa-th">배송시 요청사항</th>
						<td>
						  <c:choose>
							<c:when test="${map.value[0].order_memo eq ''}">-</c:when>
							<c:otherwise>${map.value[0].order_memo}</c:otherwise>
						  </c:choose>
						</td>
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
						<td colspan="2" class="nonblank"><fmt:formatNumber value="${total_cost + payInfo.pay_shippingfee }" pattern="#,###" />원<br></td>   
						<td></td>
						<td colspan="2" class="nonblank">0원</td>
						<td></td>
						<td colspan="2" class="nonblank">${payInfo.pay_point }P</td>
						<td></td>
						<td colspan="2" class="nonblank"><fmt:formatNumber value="${payInfo.pay_total_price }" pattern="#,###" />원</td>
					<tr id="paymentThirdLine">
						<td class="name"><br>상품금액<br>배송비</td>
						<td class="money"><br>
							<fmt:formatNumber value="${total_cost }" pattern="#,###" />원<br>
							<fmt:formatNumber value="${payInfo.pay_shippingfee }" pattern="#,###" />원
						</td>
						<td></td>
						<td class="name"><br>배송비할인<br>
						<td class="money"><br>0원<br>
						<td></td>
						<td class="name"><br>포인트</td>
						<td class="money"><br>${payInfo.pay_point }</td>
						<td></td>
						<td class="name"><br>주문금액<br>할인금액<br>포인트</td>
						<td class="money"><br>
							<fmt:formatNumber value="${total_cost + payInfo.pay_shippingfee }" pattern="#,###" />원<br>
							0원<br>
							(-) ${payInfo.pay_point }P
						</td>
					</tr>
					<tr id="paymentFourthLine">
						<th>결제수단</th>
						<td  colspan="7">${payInfo.pay_card_company }</td>
					</tr>
					<tr style="text-align: left">
						<th >카드번호</th>
						<td  colspan="7">${payInfo.pay_card_num }</td>
					</tr>
				</table>
				</c:forEach>
			</div>
			
			<div class="list_btn">
				<input type="button" value="목록" class="site-btn" style="background-color: #B9CE45; border:none"
					onclick="location.href='/order/my_order?pagingNum=${pagingNum }'">
			</div>
			
		</div>
		
		
	</div>
  	
  	
  <jsp:include page="../inc/bottom.jsp"></jsp:include>
  
  <script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
  <script src="${path}/resources/js/main.js"></script> 
  
</body>
</html>