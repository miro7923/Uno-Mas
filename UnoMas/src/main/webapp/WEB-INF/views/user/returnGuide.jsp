<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>취소/반품 안내페이지</title>
<link rel="stylesheet" href="${path}/resources/css/user_css/returnGuide.css">
</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/header.jsp"></jsp:include>


	<div class="reguide_container">

		<!-- 마이페이지 카테고리 -->
		<jsp:include page="myPageLeftBar.jsp"></jsp:include>
		<!-- 마이페이지 카테고리 -->

		<div class="reguide_content">
			<div class="guide_title">취소/반품 안내</div>
			<div class="content_all">
				<div class="content1">
					<h4>
						<a name="content1">반품방법</a>
					</h4>
					<p>
						1. 마이페이지 <strong>반품신청</strong> 클릭<br> 2. 택배기사 방문수거<br> 3. 상품
						확인 후, 환불<br>
					</p>

					<strong>✔ 반품 기한을 확인해 주세요.</strong>
					<ul>
						<li>단순 변심인 경우 : <strong>상품 수령 후 7일 이내</strong> 신청
						</li>
						<li>상품 불량/오배송인 경우 : <strong>상품 수령 후 3개월 이내, 혹은 그 사실을
								알게 된 이후 30일 이내 </strong> 반품 신청 가능
						</li>
					</ul>
					<br>
					<strong>✔ 취소/반품 요청에도 상품이 배송 되었다면?</strong>
					<ul>
						<li>상품을 이미 받으셨다면, 택배 기사가 추후 방문해 수거하도록 하겠습니다.</li>
					</ul>
					<br>
					<strong>✔ 택배회사에 직접 전화해야 하나요? 아닙니다!!</strong>
					<ul>
						<li>우노마스에서 반품 신청서를 작성하면 택배 기사에게 <strong>해당 내용이 자동 전달</strong>되어
							빠른 시간 안에 방문, 상품을 수령합니다.
						</li>
					</ul>
					<br>
				</div>
				<hr>
				<div class="content2">
					<h4>
						<a name="content2">배송비 부담 여부</a>
					</h4>
					<strong>반품 배송비는 누가 내나요?</strong>

					<table>
						<thead>
							<tr>
								<th>반품사유</th>
								<th>반품 배송비 부담자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>단순변심</th>
								<td>고객 부담<br> 최초 배송비를 포함해 왕복 배송비가 발생합니다. 또, 도서/산간지역이거나
									설치 상품을 반품하는 경우에는 배송비가 추가될 수 있습니다.
								</td>
							</tr>
							<tr>
								<th>상품의 불량 또는 오배송</th>
								<td>고객 부담 아님</td>
							</tr>
						</tbody>
					</table>
					<br>
				</div>
				<hr>
				<div class="content3">
					<h4>
						<a name="content3">배송상태 별 환불과정</a>
					</h4>
					<strong>배송상품 환불 과정이 궁금해요.</strong><br>

					<table>
						<tbody>
							<tr>
								<th>진행상태</th>

								<th>결제완료</th>
								<th>상품준비중</th>
								<th>배송지시</th>
								<th>배송중</th>
								<th>배송완료</th>
							</tr>
							<tr>
								<th>상품주문</th>

								<td>주문 내역을 확인 전</td>
								<td>상품 발송을 준비 중</td>
								<td colspan="3">상품이 택배사로 이미 발송 됨</td>
							</tr>
							<tr>
								<th>환불</th>

								<td>즉시환불</td>
								<td>구매취소 의사 전달 - 발송중지 - 환불</td>
								<td colspan="3">반품 회수 - 반품상품을 확인 - 환불</td>
							</tr>
						</tbody>
					</table>
					<br>
				</div>
				<hr>
				<div class="content4">
					<h4>
						<a name="content4">취소 방법</a>
					</h4>
					<strong>취소 어떻게 해야하나요?</strong><br>

					<table>
						<thead>
							<tr>
								<th>상품 종류</th>
								<th>진행 상태</th>
								<th>STEP</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>배송상품</td>
								<td>결제완료</td>
								<td>마이페이지내 취소/교환/환불에서 '취소신청'버튼 클릭 - 취소 신청서 작성 - 환불</td>
							</tr>
						</tbody>
					</table>
					<br>
				</div>
				<hr>
				<div class="content5">
					<h4>
						<a name="content5">환불시점</a>
					</h4>
					<strong>환불 확인은 언제 되나요?</strong><br>

					<table>
						<thead>
							<tr>
								<th>결제수단</th>
								<th>환불시점</th>
								<th>환불방법</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>신용카드</td>
								<td>취소완료 후,3~5일 내 카드사 승인취소(영업일 기준)</td>
								<td>신용카드 승인취소</td>
							</tr>
							<tr>
								<td>계좌이체(실시간 계좌이체/무통장 입금)</td>
								<td>취소완료 후, 입력하신 환불계좌로 1~2일 내 환불금액 입금(영업일 기준)</td>
								<td>계좌 입금</td>
							</tr>
							<tr>
								<td>휴대폰 결제</td>
								<td>당월 구매내역 취소 시 : 취소 완료 후, 6시간 이내 승인취소<br> 전월 구매내역 취소
									시 : 취소 완료 후, 1~2일 내 환불계좌로 입금(영업일 기준)
								</td>
								<td>당월취소 : 휴대폰 결제 승인취소<br> 익월취소 : 계좌 입금
								</td>
							</tr>
						</tbody>
					</table>
					<br>
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
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
</body>
</html>