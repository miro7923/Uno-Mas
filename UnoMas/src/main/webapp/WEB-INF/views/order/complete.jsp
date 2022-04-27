<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order.css?after22">
<!-- Header end -->

<%
// @@ 세션값으로 회원정보 가져오기 @@
String name = "홍길동";
String phoneNum = "01012345678";
String email = "hong@hong.com";
String addr = "부산광역시 부산진구 동천로109 삼한골든게이트 7층";
int point = 100;

// @@ 주문 목록 가져오기 @@
int total = 10000;
int prodPrice = 10000;
int deliveryFee = 3000;
int cnt = 5;

String deliveryMemo = "문 앞에 놔주세요.";
%>
<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

	<!-- 상품 주문 영역 -->
	<section class="checkout-section spad">
		<div class="container">
			<form action="/order/purchase" class="checkout-form">
				<div class="row">
					<div class="col-lg-12">
						<h4>결제가 완료되었습니다!</h4>
						<div class="row pl-3">
							<div class="col-lg-1">
								<label for="fir">주문일자</label>
							</div>
							<div class="col-lg-11 text-left">
								<label><strong>2022.04.27</strong></label>
							</div>
						</div>
						<div class="row pl-3">
							<div class="col-lg-1">
								<label for="cun-name">주문번호</label>
							</div>
							<div class="col-lg-11 text-left">
								<label><strong>2022041378403721</strong></label>
							</div>
						</div>
						<br><hr><br>
					    <h4>주문내역</h4>
						<div class="row">
							<div class="col-lg-12">
								<table cellspacing="0" border="1" class="orderTable mgt">
									<colgroup>
										<col width="150">
										<col width="">
										<col width="98">
										<col width="100">
									</colgroup>
									<thead>
										<tr>
											<th scope="col"><strong>상품주문번호</strong></th>
											<th scope="col">상품정보</th>
											<th scope="col">상품금액(수량)</th>
											<th scope="col" class="bg_point">배송비</th>
										</tr>
									</thead>
									<tbody>
									    <%for (int i = 0; i < cnt; i++) { %>
										<tr class="group">
											<td><span class="orderNum">2022041339806841</span>
											</td>
											<td class="product">
												<div class="row">
													<div class="col-lg-2 text-center">
														<div class="img_center">
														    <a href="https://inflow.pay.naver.com/rd?no=500178344&amp;tr=ppc&amp;pType=P&amp;retUrl=https%3A%2F%2Fsmartstore.naver.com%2Fmain%2Fproducts%2F6208422401&amp;vcode=wXWXarK6i456HAThMhvV6umF0g3tI732njFSPgWUWcSpFxsxHa1RcRwHVJhfAV0ov7ilUSoYDzaPwlp%2Fa%2BrUNtf6lXq%2Fz5deZHFeLBKOsuGZ8z1aDk2GiETcZQyfM5aA" 
														    target="_blank">
														    <img src="https://order.pay.naver.com/proxy/phinf/shop1/20211202_83/1638412937678vfCse_JPEG/39548783398160637_897067987.jpg?type=m80" 
														    alt="바이오더마 아토덤 인텐시브 밤 500ml(병원전용제품 정품홀로그램부착)"></a>
															<!--N=a:odd.product-->
														</div>
													</div>
													<div class="col-lg-10 align-self-center">
														<dl>
															<!-- NV_MID:82456051288 -->
															<dt>
																<a
																	href="https://inflow.pay.naver.com/rd?no=510165385&amp;tr=ppc&amp;pType=P&amp;retUrl=https%3A%2F%2Fsmartstore.naver.com%2Fmain%2Fproducts%2F4911527594&amp;vcode=YLVraUvDafaTk2QRDImCNOmF0g3tI732njFSPgWUWcSpFxsxHa1RcRwHVJhfAV0ov7ilUSoYDzaPwlp%2Fa%2BrUNk2vEPszCbBWIe5mRxg%2F%2F0YHsReNIibwb5Ms85Xf2PKd"
																	target="_blank"> 바이오더마 아토덤 인텐시브 밤 500ml(병원전용제품 정품홀로그램부착) </a>
																<!--N=a:odd.product-->
															</dt>
															<!-- <dd>선택: 12_슈퍼 60P (-12,000원)</dd> -->
														</dl>
													</div>
												</div>
											</td>
											<td class="money"><strong>25,500</strong>원<br>
												<span>(1개)</span></td>
											<td class="seller bg_point" rowspan="1">
												<div class="send">
													<div class="sum">
														무료 
														<!--N=a:odd.deldetail-->
													</div>
												</div>
											</td>
									    <% } %>
										</tr>
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
												<label><%=name%></label> 
												<input type="hidden" id="name" name="name" value="<%=name%>">
									        </div>
									    </div>
									</div>
									<div class="col-lg-12">
									    <div class="row pl-3">
									        <div class="col-lg-1">
									            <strong>연락처</strong>
									        </div>
									        <div class="col-lg-3 text-left">
												<label><%=phoneNum.substring(0, 3)%> - 
												<%=phoneNum.substring(3, 7) %> - 
												<%=phoneNum.substring(7, 11) %></label> 
												<input type="hidden" id="phone" name="phone" value="<%=phoneNum%>">
									        </div>
									    </div>
									</div>
									<div class="col-lg-12">
									    <div class="row pl-3">
									        <div class="col-lg-1">
									            <strong>배송지</strong>
									        </div>
									        <div class="col-lg-11 text-left">
												<label><%=addr%></label> 
												<input type="hidden" id="addr" name="addr" value="<%=addr%>">
									        </div>
									    </div>
									</div>
									<div class="col-lg-12">
									    <div class="row pl-3">
									        <div class="col-lg-1">
										        <strong>배송메모</strong>
									        </div>
										    <div class="col-lg-11">
												<label><%=deliveryMemo%></label> 
												<input type="hidden" id="addr" name="addr" value="<%=addr%>">
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
											    <strong id="total"><%=total %></strong> 원
											</div>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="pl-3 row">
											<div class="col-lg-3">
												<label>배송비</label>
											</div>
											<div class="col-lg-5 text-right">
											    <strong id="deliveryFee">+<%=deliveryFee %></strong> 원
											</div>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="pl-3 row">
											<div class="col-lg-3">
												<label>적립금 사용</label>
											</div>
											<div class="col-lg-5 text-right">
											    <strong id="point">-<%=point %></strong> 원
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
						                <label>국민 (1234-****-****-****) - 일시불</label>
						            </div>
						        </div>
						        <div class="row">
						            <div class="col-lg-3">
						                <label>결제금액</label>
						            </div>
						            <div class="col-lg-5 text-right">
						                <strong id="orderTotal"><%=total + deliveryFee - point %></strong> 원
						            </div>
						        </div>
						    </div>
						</div>
						<br>
						<hr>
						<br>
						<h4>주문자 정보</h4>
						<div class="row pl-3">
							<div class="col-lg-12">
							    <%=name %>
							</div>
							<div class="col-lg-12">
							    <%=phoneNum.substring(0, 3) %> - <%=phoneNum.substring(3, 7) %> - 
							    <%=phoneNum.substring(7, 11) %>
							</div>
							<div class="col-lg-12">
							    <%=email %>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row text-center">
					<div class="col-lg-12 mt-5">
					    <button type="button" class="site-btn" onclick="location.href='/';">홈</button>
						<button type="button" class="site-btn" onclick="location.href='/mypage/order_list.my';">마이페이지</button>
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
	<script src="${path}/resources/js/complete.js"></script>


</body>
</html>