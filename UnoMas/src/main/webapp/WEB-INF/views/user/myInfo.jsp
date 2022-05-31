<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<link rel="stylesheet" href="${path}/resources/css/user_css/myInfo.css">
<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/header.jsp"></jsp:include>
<!-- Start Header -->

<body>
    <div class="myinfo_container">

		<!-- 마이페이지 카테고리 -->
		<jsp:include page="myPageLeftBar.jsp"></jsp:include>


		<div class="myinfo-content">
			<h2>개인 정보 확인</h2>
			<hr>
			
			<h3 class="myinfo_h3">기본 정보</h3>
			<div class="table_div">
				<table class="table_info"
					style="margin-bottom: 60px; height: 330px;">
					<tr>
						<th>아이디</th>
						<td>${userInfoVO.user_id }</td>
					</tr>

					<tr>
						<th>이름</th>
						<td>${userInfoVO.user_name }</td>
					</tr>

					<tr>
						<th>이메일</th>
						<td>${userInfoVO.user_email }</td>
					</tr>

					<tr>
						<th>생년월일</th>
						<td>${userInfoVO.user_birth }</td>
					</tr>

					<tr>
						<th>휴대폰 번호</th>
						<td>${userInfoVO.user_phone }</td>
					</tr>
				</table>



				<h3 class="myinfo_h3">배송지 정보</h3>
				<table class="table_info">
					<tr>
						<th>기본 배송지</th>
						<td style="line-height: 25px;">
							<p style="font-weight: bold;">${userInfoVO.user_name }</p>
							<p>[${userInfoVO.user_postalcode }] ${userInfoVO.user_roadaddr }</p>
							<p>
								${userInfoVO.user_name } <span>${userInfoVO.user_phone }</span>
							</p>
						</td>
					</tr>
				</table>



				<h3 class="myinfo_h3">환불 정보</h3>
				<table class="table_info">
					<colgroup>
						<col style="width: 165px;"><col style="width: 140px;">
					</colgroup>
					<tr>
						<th rowspan="4">환불계좌</th>
					</tr>

					<tr>
						<td scope="col">은행명</td>
						<td scope="col">${userInfoVO.user_bank }</td>

					</tr>
					<tr>
						<td>계좌번호</td>
						<td>${userInfoVO.user_account }</td>
					</tr>
					<tr>
						<td>예금주</td>
						<td>${userInfoVO.user_account_holder }</td>
					</tr>
				</table>

				<h3 class="myinfo_h3">(선택) 개인정보 수집 및 이용안내</h3>
				<hr>
				<c:choose>
				<c:when test="${userInfoVO.user_emailagree eq 0 }">
				  <input type="checkbox" id="checkbox_text" disabled="disabled">(선택) 이메일 이벤트등 마케팅 수신 동의
				</c:when>
				<c:otherwise>
				  <input type="checkbox" id="checkbox_text" checked disabled="disabled">(선택) 이메일 이벤트등 마케팅 수신 동의
				</c:otherwise>
				</c:choose>
				
				<div id="agree_listbox">
				<ul class="agree-list">
					<li>개인정보 수집 및 이용동의 미동의 시 성별정보는 저장되지 않습니다.</li>
					<li>이메일, SMS 동의 여부 변경시 24시간 이후부터 적용됩니다.</li>
					<li>이메일, SMS 수신 동의 시 우노마스의 특가상품, 할인쿠폰, 이벤트 소식을 받을 수 있습니다.</li>
					<li>회원정보, 구매, 배송 정보 및 중요 공지사항은 수신 동의 여부에 관계없이 발송됩니다.</li>
				</ul>
				</div>
			</div>
			
			
			<div style="text-align: right;">
				<a href="/UnoMas/user/delete_user" class="deleteBtn">회원 탈퇴</a>
			</div>

			<div style="text-align: center;" >
				<a href="check_pw" class="updateBtn">수정</a>
			</div>
			
		</div>
	</div>


    <!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
  	<script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
  	<script src="${path}/resources/js/main.js"></script> 
</body>

</html>