<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<meta charset=UTF-8>
<link rel="stylesheet" href="${path}/resources/css/user_css/updateMyInfo.css">

<body>
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 -->

	<div class="myinfo_container">

		<!-- 마이페이지 카테고리 -->
		<jsp:include page="myPageLeftBar.jsp"></jsp:include>
		<!-- 마이페이지 카테고리 -->

		<div class="myinfo_content">
			<h2>개인 정보 수정</h2>
			<hr>

			<h3>기본 정보</h3>
			<form action="update_myInfo" method="post">
			<div class="table_div">
				<table class="table_info"
					style="margin-bottom: 60px; height: 330px;">
					<tr>
						<th>아이디</th>
						<td><input type="text" class="input_field" name="user_id" value="${userInfoVO.user_id }" readonly></td>
					</tr>

					<tr>
						<th>이름</th>
						<td><input type="text" class="input_field" name="user_name" value="${userInfoVO.user_name }" required></td>
					</tr>

					<tr>
						<th>이메일</th>
						<td><input type="email" class="input_field" name="user_email" value="${userInfoVO.user_email }"required></td>
					</tr>
					
					<tr>
						<th>생년월일</th>
						<td>
						<span id="birth"></span><br>
	          			<select class="input-birth" name="birth-year" oninput="birthCheck()">
	              			<option value="">연도</option>
			               <%
			                 for(int i=1950; i<=2022; i++) {
			                    %><option value="<%=i%>"><%=i %>년</option><%
			                 }
			               %>
			               <c:set var="birth" value=""></c:set>
			            </select>
			            <select name="birth-month" class="input-birth" oninput="birthCheck()" disabled="disabled">
			               <option value="">월</option>
			               <%
			                 for(int i=1; i<=12; i++) {
			                    %><option value="<%=i%>"><%=i %>월</option><%
			                 }
			               %>
			            </select>
	               
			            <select name="birth-day" class="input-birth" disabled="disabled" oninput="combineBirth()">
			               <option value="">일</option>
			            </select><br>
			            <input name="user_birth" hidden value="">
				        </td>   
					</tr>

					<tr>
						<th>휴대폰 번호</th>
						<td><input type="text" class="input_field" name="user_phone" value="${userInfoVO.user_phone }" placeholder=" -없이 숫자만 입력" required><span id="phone"></span>
						<input type="button" class="check-button" name="phoneCheck" value="인증하기" onclick="phoneCheckFunc()">
						<div name="phoneCheckDiv"></div></td>
					</tr>
				</table>

				<div style="text-align: right;">
				<h3 style="float: left;">배송지 정보</h3>
					<input type="button" name="user_postalcode" value="우편번호 찾기" id="postal_btn" onclick="execDaumPostcode('0')">
				</div>
				<table class="table_info">
					<tr>
						<th>기본 배송지</th>
						<td style="line-height: 25px;">
							<input type="text" id="postalcode" name="user_postalcode" value="${userInfoVO.user_postalcode }" placeholder="우편번호">
							<input type="text" id="roadaddr" name="user_roadaddr" value="${userInfoVO.user_roadaddr }" placeholder="도로명주소">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailaddr" name="user_detailaddr" value="${userInfoVO.user_detailaddr }" placeholder="상세주소">
						</td>
					</tr>
				</table>
				<table class="table_info">
					<tr>
						<th>추가 배송지</th>
						<td style="line-height: 25px;">
							<input type="text" id="addr_num" name="addr_num" value="${addAddrVO.addr_name }" placeholder="배송지 별명"><br>
							<input type="text" id="postalcode1" name="addr_postalcode" value="${addAddrVO.addr_postalcode }" placeholder="우편번호">
							<input type="text" id="roadaddr1" name="addr_roadaddr" value="${addAddrVO.addr_roadaddr }" placeholder="도로명주소">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailaddr" name="addr_detailaddr" value="${addAddrVO.addr_detailaddr }" placeholder="상세주소">
							<input type="button" name="postalcode" value="우편번호 찾기" id="postal_btn2" onclick="execDaumPostcode('1')">
							<br><br>
							<input type="text" id="addr_num" name="addr_num" value="${addAddrVO.addr_name }" placeholder="배송지 별명"><br>
							<input type="text" id="postalcode2" name="addr_postalcode" value="${addAddrVO.addr_postalcode }" placeholder="우편번호">
							<input type="text" id="roadaddr2" name="addr_roadaddr" value="${addAddrVO.addr_roadaddr }" placeholder="도로명주소">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailaddr" name="addr_detailaddr" value="${addAddrVO.addr_detailaddr }" placeholder="상세주소">
							<input type="button" name="postalcode" value="우편번호 찾기" id="postal_btn2" onclick="execDaumPostcode('2')">
						</td>
					</tr>
				</table>
				
				<h3>환불 정보</h3>
				<table class="table_info">
					<colgroup>
						<col style="width: 165px;">
						<col style="width: 140px;">
					</colgroup>
					<tr>
						<th id="refund_top" rowspan="4" style="width:25%;">환불계좌</th>
						<td id="refund_account">
							<div class="my_tbl_con">
								<div class="rebate_account">
									<dl>
										<dt>은행명</dt>
										<dd>
											<select class="form-select form-select-sm" name="user_bank" aria-label=".form-select-sm example" 
											style="box-sizing: border-box;display: inline-block;width: 40%;
											height: 38px;margin:10px;padding: 0 10px;border: 1px solid #ddd	;color: #666;font-size: 11px;">
											  <option value="${userInfoVO.user_bank }">${userInfoVO.user_bank }</option>
											  <option value="기업은행">기업은행</option>
											  <option value="국민은행">국민은행</option>
											  <option value="농협은행">농협은행</option>
											  <option value="우리은행">우리은행</option>
											  <option value="신한은행">신한은행</option>
											  <option value="부산은행">부산은행</option>
											  <option value="하나은행">하나은행</option>
											</select>
										</dd>
										<dt>계좌번호</dt>
										<dd>
											<span class="input_area"> 
											<input type="text" id="account" name="user_account" value="${userInfoVO.user_account }" title="계좌번호 입력" style="width: 250px">
											</span>
										</dd>
										<dt>예금주</dt>
										<dd>
											<span class="input_area">
											<input type="text" id="account_holder" name="user_account_holder" value="${userInfoVO.user_account_holder }" title="예금주 입력"  style="width: 250px">
											</span> 
										</dd>
									</dl>
								</div>
							</div>
						</td>
					</tr>
				</table>

				<h3>(선택) 개인정보 수집 및 이용안내</h3>
				<hr>
				<input type="checkbox"  name="user_emailagree" value="${userInfoVO.user_emailagree }" id="checkbox_text" >(선택) 이메일 이벤트등 마케팅 수신 동의
				<div id="agree_listbox">
				<ul class="agree-list">
					<li>개인정보 수집 및 이용동의 미동의 시 성별정보는 저장되지 않습니다.</li>
					<li>이메일, SMS 동의 여부 변경시 24시간 이후부터 적용됩니다.</li>
					<li>이메일, SMS 수신 동의 시 우노마스의 특가상품, 할인쿠폰, 이벤트 소식을 받을 수 있습니다.</li>
					<li>회원정보, 구매, 배송 정보 및 중요 공지사항은 수신 동의 여부에 관계없이 발송됩니다.</li>
				</ul>
				</div>
			</div>

			<div style="text-align: center;">
				<input type="submit" class="updateBtn" value="수정">
			</div>
			</form>

		</div>
	</div>


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
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
    <script src="${path}/resources/js/user_js/updateMyInfo.js"></script>
</body>
</html>