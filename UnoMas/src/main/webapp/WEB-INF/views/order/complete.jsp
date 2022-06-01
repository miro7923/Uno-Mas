<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<title>결제 완료</title>
<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order_css/order.css?after22">
<!-- Header end -->

<%
    if (session.getAttribute("saveID") == null) {
    	response.sendRedirect("/UnoMas/index");
    }
%>
<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

	<!-- 상품 주문 영역 -->
	<section class="checkout-section spad">
		<div class="container">
			<form action="/UnoMas/order/purchase" class="checkout-form">
				<div class="row">
					<div class="col-lg-12">
						<h4>${userVO.user_name }님의 결제가 완료되었습니다!</h4>
						<div class="row pl-3">
							<div class="col-lg-1">
								<label for="fir">주문일자</label>
							</div>
							<div class="col-lg-11 text-left">
								<label><strong><fmt:formatDate value="${orderList[0].order_date }" type="date"/></strong></label>
							</div>
						</div>
						<div class="row pl-3">
							<div class="col-lg-1">
								<label for="cun-name">주문번호</label>
							</div>
							<div class="col-lg-11 text-left">
								<label><strong>${payVO.pay_num }</strong></label>
							</div>
						</div>
						<br><hr><br>
					    <h4>주문내역</h4>
						<div class="row">
							<div class="col-lg-12">
								<table cellspacing="0" border="1" class="orderTable mgt">
									<colgroup>
										<col width="">
										<col width="150">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">상품정보</th>
											<th scope="col">상품금액(수량)</th>
										</tr>
									</thead>
									<tbody>
									    <c:forEach var="order" items="${orderList }" varStatus="i">
											<tr class="group">
												<td class="product">
													<div class="row">
														<div class="col-lg-2 text-center">
															<div class="img_center">
															    <a href="/UnoMas/product/product_detail?prod_num=${order.prod_num }" target="_blank">
															    <img src="<spring:url value="/resources/upload/images/products/thumbnail/${prodThumbList[i.index] }"></spring:url>" width="80" height="80"></a>
																<!--N=a:odd.product-->
															</div>
														</div>
														<div class="col-lg-10 align-self-center">
															<a href="/UnoMas/product/product_detail?prod_num=${order.prod_num }"
																target="_blank">${order.prod_name }</a>
															<!--N=a:odd.product-->
														</div>
													</div>
												</td>
												<td class="money"><strong><fmt:formatNumber value="${order.order_total }" type="number"/></strong>원<br>
													<span>(${order.order_quantity }개)</span></td>
											</tr>
									    </c:forEach>
									</tbody>
								</table>
								<br><br>
								<h4>배송지</h4>
								<div class="row">
									<div class="col-lg-12">
									    <div class="row pl-3">
									        <div class="col-lg-1">
									            <strong>수령인</strong>
									        </div>
									        <div class="col-lg-3 text-left">
												<!-- 수령인 이름 -->
												<label>${orderList[0].order_recipient }</label> 
												<input type="hidden" id="name" name="name" value="${orderList[0].order_recipient }">
									        </div>
									    </div>
									</div>
									<div class="col-lg-12">
									    <div class="row pl-3">
									        <div class="col-lg-1">
									            <strong>연락처</strong>
									        </div>
									        <div class="col-lg-3 text-left">
												<label>${fn:substring(userVO.user_phone, 0, 3) } - 
												${fn:substring(userVO.user_phone, 3, 7) } - 
												${fn:substring(userVO.user_phone, 7, 11) }</label> 
												<input type="hidden" id="phone" name="phone" value="${userVO.user_phone }">
									        </div>
									    </div>
									</div>
									<div class="col-lg-12">
									    <div class="row pl-3">
									        <div class="col-lg-1">
									            <strong>배송지</strong>
									        </div>
									        <div class="col-lg-11 text-left">
												<label>${orderList[0].order_roadaddr } ${orderList[0].order_detailaddr }</label> 
												<input type="hidden" id="roadAddr" name="roadAddr" value="${orderList[0].order_roadaddr }">
												<input type="hidden" id="detailAddr" name="detailAddr" value="${orderList[0].order_roadaddr }">
									        </div>
									    </div>
									</div>
									<div class="col-lg-12">
									    <div class="row pl-3">
									        <div class="col-lg-1">
										        <strong>배송메모</strong>
									        </div>
										    <div class="col-lg-11">
												<label>${orderList[0].order_memo }</label> 
												<input type="hidden" id="addr" name="addr" value="${orderList[0].order_memo }">
										    </div>
									    </div>
									</div>
								</div>
							</div>
							<br>
							<br>
						</div>
						<br>
						<hr>
						<br>
						<h4>주문/결제 금액 정보</h4>
						<div class="row">
						    <div class="col-lg-6">
						        <div class="row">
									<div class="col-lg-12">
										<div class="pl-3 row">
											<div class="col-lg-3">
												<label>상품금액</label>
											</div>
											<div class="col-lg-5 text-right">
											    <strong id="total"><fmt:formatNumber value="${payVO.pay_total_price + payVO.pay_point - payVO.pay_shippingfee }" type="number"/></strong> 원
											</div>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="pl-3 row">
											<div class="col-lg-3">
												<label>배송비</label>
											</div>
											<div class="col-lg-5 text-right">
											    <strong id="deliveryFee">+<fmt:formatNumber value="${payVO.pay_shippingfee }" type="number"/></strong> 원
											</div>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="pl-3 row">
											<div class="col-lg-3">
												<label>적립금 사용</label>
											</div>
											<div class="col-lg-5 text-right">
											    <strong id="point">-<fmt:formatNumber value="${payVO.pay_point }" type="number"/></strong> 원
											</div>
										</div>
									</div>
						        </div>
						    </div>
						    <div class="col-lg-6">
						        <div class="row">
						            <div class="col-lg-3">
						                <label>결제정보</label>
						            </div>
						            <div class="col-lg-5 text-right">
						                <strong>카드결제</strong>
						            </div>
						        </div>
						        <div class="row">
						            <div class="col-lg-8 text-right">
						                <label>${payVO.pay_card_num } - 
						                <c:if test="${payVO.pay_installment == 0 }">일시불</c:if>
						                <c:if test="${payVO.pay_installment > 0 }">${payVO.pay_installment }개월</c:if>    
						            </label>
						            </div>
						        </div>
						        <div class="row">
						            <div class="col-lg-3">
						                <label>결제금액</label>
						            </div>
						            <div class="col-lg-5 text-right">
						                <strong id="orderTotal"><fmt:formatNumber value="${payVO.pay_total_price }" type="number"/></strong> 원
						            </div>
						        </div>
						    </div>
						</div>
						<br>
						<hr>
						<br>
					</div>
				</div>
				<br>
				<div class="row text-center">
					<div class="col-lg-12 mt-5">
					    <button type="button" class="site-btn" onclick="location.href='/UnoMas';">홈</button>
						<button type="button" class="site-btn" onclick="location.href='/UnoMas/user/mypage';">마이페이지</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- 상품 주문 영역 -->

	<!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
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
	<script src="${path}/resources/js/order_js/complete.js"></script>


</body>
</html>