<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/order_css/order.css?after22">
<!-- Header end -->

<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

    <!-- 상품 주문 영역 -->
    <section class="checkout-section spad">
        <div class="container">
            <div class="checkout-form">
                <input type="hidden" value="${order_code }" id="orderCode">
                <input type="hidden" value="${sessionScope.saveNUM }" id="userNum">
                <input type="hidden" value="${fn:length(orderList) }" id="prodCnt">
                <div class="row">
                    <div class="col-lg-6">
                        <h4>주문자 정보</h4>
                        <div class="row">
                            <div class="col-lg-12">
                                <label for="fir" id="userName">${userVO.user_name }</label>
                            </div>
                            <div class="col-lg-12">
                                <label for="cun-name">${fn:substring(userVO.user_phone, 0, 3) } 
                                - ${fn:substring(userVO.user_phone, 3, 7) } 
                                - ${fn:substring(userVO.user_phone, 7, 11) }</label>
                            </div>
                            <div class="col-lg-12">
                                <label for="cun" id="userEmail">${userVO.user_email }</label>
                            </div>
                        </div>
                        <br><hr><br>
                        <h4>배송지 정보</h4>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-3">
		                                <label>배송지 선택</label>
                                    </div>
                                    <div class="col-lg-9">
                                        <input type="radio" value="1" name="deliverSpot" checked="checked">기본배송지 
                                        <input type="radio" value="2" name="deliverSpot">신규배송지
                                        <!-- @@ 주소북 목록 불러오기 @@ -->
                                        <button type="button" class="site-btn deliverListBtn"
                                         onclick="window.open('/addrBook');">배송지 목록</button>
                                    </div>
                                </div>
                            </div>
                            <br><br>
                            <div id="normalAddr">
                                <div class="row normalAddrInfo">
		                            <div class="col-lg-12">
		                                <!-- 수령인 이름 -->
		                                <label>${primaryAddr.addr_recipient }</label>
		                                <input type="hidden" id="name" name="addr_recipient" value="${primaryAddr.addr_recipient }">
		                            </div>
		                            <div class="col-lg-12">
		                                <label>${fn:substring(primaryAddr.addr_phone, 0, 3) } - ${fn:substring(primaryAddr.addr_phone, 3, 7) } - ${fn:substring(primaryAddr.addr_phone, 7, 11) }</label>
		                                <input type="hidden" id="phone" name="user_phone" value="${primaryAddr.addr_phone }">
		                            </div>
		                            <div class="col-lg-12">
		                                <label>${primaryAddr.addr_postalcode }</label>
		                                <input type="hidden" id="postalcode" name="addr_postalcode" value="${primaryAddr.addr_postalcode }">
		                            </div>
		                            <div class="col-lg-12">
		                                <label>${primaryAddr.addr_roadaddr } ${primaryAddr.addr_detailaddr }</label>
		                                <input type="hidden" id="roadAddr" name="addr_roadaddr" value="${primaryAddr.addr_roadaddr }">
		                                <input type="hidden" id="detailAddr" name="addr_detailaddr" value="${primaryAddr.addr_detailaddr }">
		                            </div>
		                            <div class="col-lg-12">
		                                <!-- <label for="ask">요청사항</label> -->
		                                <input type="text" id="ask" name="ask" placeholder="요청사항을 입력해 주세요." maxlength="20">
		                            </div>
                                </div>
                            </div>
                            <div id="newAddr">
	                            <div class="col-lg-12">
	                                <div class="row">
	                                    <div class="col-lg-3">
			                                <label>수령인</label><span class="emph"> *</span>
	                                    </div>
	                                    <div class="col-lg-5">
				                            <input type="text" id="name" name="name">
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-lg-12">
	                                <div class="row">
	                                    <div class="col-lg-3">
			                                <label>연락처</label><span class="emph"> *</span>
	                                    </div>
	                                    <div class="col-lg-9">
	                                        <div class="row">
	                                            <div class="col-lg-3">
							                        <input type="tel" class="phone" id="phone" name="phone" maxlength="3">
	                                            </div>
	                                            -
	                                            <div class="col-lg-3">
							                        <input type="tel" class="phone" id="phone" name="phone" maxlength="4">
	                                            </div>
	                                            -
	                                            <div class="col-lg-3">
							                        <input type="tel" class="phone" id="phone" name="phone" maxlength="4">
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-lg-12">
	                                <div class="row">
	                                    <div class="col-lg-3">
			                                <label>배송지 주소</label><span class="emph"> *</span>
	                                    </div>
	                                    <div class="col-lg-9">
	                                        <div class="row">
			                                    <div class="col-lg-4">
						                            <input type="text" id="postalcode" name="postalcode">
			                                    </div>
			                                    <div class="col-lg-3" style="padding: 0;">
			                                        <button type="button" class="site-btn deliverListBtn postalBtn"
			                                         onclick="daumPostcode();">우편번호</button>
			                                    </div>
	                                        </div>
	                                        <div class="row">
	                                            <div class="col-lg-6" style="padding-right: 3px;">
	                                                <input type="text" id="roadAddress">
	                                            </div>
	                                            <div class="col-lg-6" style="padding-left: 3px;">
	                                                <input type="text" id="detailAddress">
	                                            </div>
	                                            <span id="guide" style="color:#999;display:none"></span>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-lg-12">
	                                <!-- <label for="ask">요청사항</label> -->
	                                <input type="text" id="ask" name="ask" placeholder="요청사항을 입력해 주세요." maxlength="20">
	                            </div>
                            </div>
                        </div>
                        <br><hr><br>
                        <h4>할인</h4>
                        <div class="row">
                            <div class="col-lg-12">
                                <p class="pointTitle">적립금 사용</p>
                                <div class="pl-3 row">
                                    <div class="col-lg-2">
	                                    <label style="margin-top: 29px;">보유</label>
                                    </div>
                                    <div class="col-lg-10">
                                        <div class="row">
                                            <div class="col-lg-5 px-0">
			                                    <input type="text" value="${userVO.user_point }" id="curPoint" readonly>
                                            </div>
                                            <div class="col-lg-1">원</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="pl-3 row">
                                    <div class="col-lg-2">
	                                    <label style="margin-top: 30px;">사용</label>
                                    </div>
                                    <div class="col-lg-10">
                                        <div class="row">
                                            <div class="col-lg-5 px-0">
			                                    <input type="text" value="0" id="usingPoint">
                                            </div>
                                            <div class="col-lg-1">원</div>
                                            <div class="col-lg-6 px-0">
                                                <!-- @@ 체크시 전액사용하면서 회원 상태 true로 변경
                                                	체크 해제시 사용량은 그대로 두는데 회원 상태만 false로 변경 -->
                                                	<button type="button" class="site-btn deliverListBtn postalBtn"
                                                 onclick="useAllPoints();">전액사용</button>
                                                <input type="checkbox" name="useAllCheckBox">항상 전액사용
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br><hr><br>
                        <h4>결제수단</h4>
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="radio" name="purchaseMethod" value="1" checked><label>신용카드</label>
                                <input type="radio" name="purchaseMethod" value="2"><label>무통장입금</label>
                            </div>
                        </div>
                        <div class="row" id="method_creditCard">
	                        <div class="col-lg-12">
	                            <div class="row pl-4 pt-3">
	                                <div class="col-lg-3 pb-2">
	                                    <label>카드구분</label>
	                                </div>
	                                <div class="col-lg-9">
	                                    <input type="radio" name="creditCard" value="1" checked><label>개인카드</label>
	                                    <input type="radio" name="creditCard" value="2"><label>법인카드</label>
	                                </div>
	                                <div class="col-lg-3 pb-2">
	                                    <label>카드선택</label>
	                                </div>
	                                <div class="col-lg-9">
	                                    <select class="selectBox" name="cardSelect">
	                                        <option>선택해주세요.</option>
	                                        <option>KB Pay (국민)</option>
	                                        <option>비씨</option>
	                                        <option>신한</option>
	                                        <option>현대</option>
	                                        <option>삼성</option>
	                                        <option>롯데</option>
	                                        <option>외환</option>
	                                        <option>NH</option>
	                                        <option>하나</option>
	                                        <option>씨티</option>
	                                    </select>
	                                </div>
	                                <div class="col-lg-3 pb-2">
	                                    <label>할부기간</label>
	                                </div>
	                                <div class="col-lg-9">
	                                    <select class="selectBox" id="divMonth">
	                                        <option>일시불</option>
	                                        <%for (int i = 2; i <= 12; i++) { %>
	                                            <option><%=i %> 개월</option>	                                            
	                                        <% } %>
	                                    </select>
	                                </div>
	                            </div>
	                        </div>
                        </div>
                        <div class="row" id="method_bankAccount">
                            <div class="col-lg-12">
	                            <div class="row pl-4 pt-3">
	                                <div class="col-lg-3 pb-2">
	                                    <label>은행</label>
	                                </div>
	                                <div class="col-lg-9">
	                                    <select class="selectBox">
	                                        <option>선택해주세요.</option>
	                                        <option>국민</option>
	                                        <option>비씨</option>
	                                        <option>신한</option>
	                                        <option>현대</option>
	                                        <option>삼성</option>
	                                        <option>롯데</option>
	                                        <option>외환</option>
	                                        <option>NH</option>
	                                        <option>하나</option>
	                                        <option>씨티</option>
	                                    </select>
	                                </div>
	                                <div class="col-lg-3 pb-2">
	                                    <label>계좌번호</label>
	                                </div>
	                                <div class="col-lg-9">
	                                    <input type="text" id="account" placeholder="'-' 제외한 숫자만 입력해 주세요.">
	                                </div>
	                                <div class="row pl-3" id="cashReciptNormal">
		                                <div class="col-lg-3 pb-2">
		                                    <label>현금영수증</label>
		                                </div>
		                                <div class="col-lg-9">
		                                    <label>개인소득공제 
		                                    (휴대폰번호 : ${fn:substring(userVO.user_phone, 0, 3) } - ${fn:substring(userVO.user_phone, 3, 7) } - ${fn:substring(userVO.user_phone, 7, 11) })</label>
		                                    <button type="button" class="site-btn deliverListBtn postalBtn" 
		                                    onclick="changeCashReciptInfo();">
		                                    현금영수증정보 변경</button> 
		                                </div>
	                                </div>
	                                <div class="row pl-3" id="cashReciptChange" style="display: none;">
		                                <div class="col-lg-3 pb-2">
		                                    <label>현금영수증</label>
		                                </div>
		                                <div class="col-lg-9 pl-1">
		                                    <input type="radio" name="cashRecipt" value="1" checked><label>신청하기</label>
		                                    <input type="radio" name="cashRecipt" value="2"><label>신청안함</label>
		                                </div>
		                                <div class="row" id="cashReciptApply">
			                                <div class="col-lg-3 pb-2">
			                                    <label> </label>
			                                </div>
			                                <div class="col-lg-9 pl-1">
			                                    <input type="radio" name="cashReciptType" value="1" checked><label>개인소득공제용</label>
			                                    <input type="radio" name="cashReciptType" value="2"><label>사업자증빙용(세금계산서용)</label>
			                                </div>
			                                <div class="row pl-3" id="cash_individual">
				                                <div class="col-lg-3 pb-2">
				                                    <label></label>
				                                </div>
				                                <div class="col-lg-9 pl-1">
			                                        <div class="row pb-2">
			                                            <div class="col-lg-12">
						                                    <select class="selectBox" name="individualCashReciptType">
						                                        <option value="1">휴대폰번호</option>
						                                        <option value="2">주민등록번호</option>
						                                        <option value="3">현금영수증카드번호</option>
						                                    </select>
			                                            </div>
			                                        </div>
			                                        <!-- 현금영수증 - 폰번호 입력 -->
			                                        <div class="row" id="select_phone">
				                                        <div class="col-lg-3">
										                    <input type="tel" class="phone" id="phone1" name="phone1" 
										                    maxlength="3" value="${fn:substring(userVO.user_phone, 0, 3) }">
				                                        </div>
				                                        -
				                                        <div class="col-lg-3">
										                    <input type="tel" class="phone" id="phone2" name="phone2" 
										                    maxlength="4" value="${fn:substring(userVO.user_phone, 3, 7) }">
				                                        </div>
				                                        -
				                                        <div class="col-lg-3">
						  		                            <input type="tel" class="phone" id="phone3" name="phone3" 
						  		                            maxlength="4" value="${fn:substring(userVO.user_phone, 7, 11) }">
				                                        </div>
				                                    </div>
				                                    <!-- 현금영수증 - 주민번호 -->
			                                        <div class="row" id="select_citizenNum" style="display: none;">
				                                        <div class="col-lg-5">
										                    <input type="text" class="phone" id="citizenNum1" name="citizenNum1" 
										                    maxlength="6">
				                                        </div>
				                                        -
				                                        <div class="col-lg-5">
										                    <input type="text" class="phone" id="citizenNum2" name="citizenNum2" 
										                    maxlength="7">
				                                        </div>
				                                    </div>
				                                    <!-- 현금영수증 - 현금영수증 카드번호 -->
			                                        <div class="row" id="select_cashReciptCard" style="display: none;">
				                                        <div class="col-lg-2 pr-0">
										                    <input type="text" class="phone" id="cashCard1" name="cashCard1" 
										                    maxlength="4">
				                                        </div>
				                                        &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
				                                        <div class="col-lg-2 px-0">
										                    <input type="text" class="phone" id="cashCard2" name="cashCard2" 
										                    maxlength="4">
				                                        </div>
				                                        &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
				                                        <div class="col-lg-2 px-0">
										                    <input type="text" class="phone" id="cashCard3" name="cashCard3" 
										                    maxlength="4">
				                                        </div>
				                                        &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
				                                        <div class="col-lg-3 pl-0">
										                    <input type="text" class="phone" id="cashCard4" name="cashCard4" 
										                    maxlength="7">
				                                        </div>
				                                    </div>
				                                </div>
			                                </div>
			                                <!-- 사업자 현금영수증 -->
			                                <div class="row pl-3" id="cash_company" style="display: none;">
				                                <div class="col-lg-3 pb-2">
				                                    <label>사업자 등록번호</label>
				                                </div>
				                                <div class="col-lg-9 px-0 pl-3">
			                                        <div class="row" id="">
				                                        <div class="col-lg-3">
										                    <input type="tel" class="phone" id="phone1" name="phone1" 
										                    maxlength="3">
				                                        </div>
				                                        -
				                                        <div class="col-lg-3">
										                    <input type="tel" class="phone" id="phone2" name="phone2" 
										                    maxlength="2">
				                                        </div>
				                                        -
				                                        <div class="col-lg-3">
						  		                            <input type="tel" class="phone" id="phone3" name="phone3" 
						  		                            maxlength="4">
				                                        </div>
				                                    </div>
				                                </div>
			                                </div>
		                                </div>
		                                <div class="col-lg-3 pb-2">
		                                    <label></label>
		                                </div>
		                                <div class="col-lg-9 px-0">
		                                    <input type="checkbox" class="saveCashReciptStat" name="saveCashReciptStat" 
		                                    value="1"><label>현재 현금영수증 신청정보를 저장합니다.</label>
		                                </div>
	                                </div>
	                            </div>
	                        </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="place-order">
                            <h4>상품 정보</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>상품 <span>상품금액</span></li>
                                    <!-- @@ 장바구니 목록 배열 사이즈만큼 출력하기 @@ -->
                                    <!-- @@ 장바구니 목록 로드시 model에 배열 길이 정보 저장해서 자바스크립트에서 읽어오기 @@ -->
                                    <c:forEach var="prod" items="${orderList }" varStatus="i">
	                                    <li class="fw-normal">${prod.prod_name } X ${prod.prod_amount }
	                                        <span id="prodPrice${i.index }">
	                                        <c:set var="prodPrice" value="${prod.prod_price * prod.prod_amount }"/>
	                                        <fmt:formatNumber value="${prodPrice }" type="number"/>원</span>
	                                        <input type="hidden" value="${prod.prod_name }" id="prodName${i.index }">
	                                        <input type="hidden" value="${prod.prod_num }" id="prodNum${i.index }">
	                                        <input type="hidden" value="${prod.prod_amount }" id="prodQunatity${i.index }">
	                                        <input type="hidden" value="${prodPrice }" name="order_total" id="orderTotal${i.index }">
	                                        <input type="hidden" value="${prod.cart_num }" name="cart_num" id="cartNum${i.index }">
	                                    </li>
                                    </c:forEach>
                                    <li class="total-price">배송비 <span id="deliveryFee">${shippingFee }원</span>
                                        <input type="hidden" value="${shippingFee }" name="shippingFee" id="shippingFee">
                                    </li>
                                    <li class="total-price">합계 <span id="totalPrice"><fmt:formatNumber value="${total }" type="number"/>원</span>
                                        <input type="hidden" value="${total }" name="total" id="total">
                                    </li>
                                    <li class="total-price">적립혜택 <span id="point">
                                        <c:set var="userPoint" value="${total * 0.05 }"/>
                                        <fmt:formatNumber value="${total * 0.05 }" maxFractionDigits="0" type="number"/>원</span>
                                        <input type="hidden" value="${userPoint }" id="userPoint">    
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row text-center">
                    <div class="col-lg-12">
                        <div class="order-btn mt-5">
                            <button type="submit" class="site-btn place-btn" onclick="requestPay();">결제하기</button>
                        </div>
                    </div>
                </div>
            </div>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${path}/resources/js/order_js/order.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</body>
</html>