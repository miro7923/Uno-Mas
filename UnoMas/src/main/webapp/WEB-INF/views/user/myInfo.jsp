<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<link rel="stylesheet" href="${path}/resources/css/user_css/myInfo.css">
	<title>개인정보확인 페이지</title>
</head>


<body>
    <!-- 헤더 -->
    <div style="height: 80px; border-bottom: 1px solid black; background-color: green">헤더</div>
    <!-- 헤더 -->
      
    
    <div class="myinfo_container">

		<!-- 마이페이지 카테고리 -->
		<jsp:include page="myPageLeftBar.jsp"></jsp:include>


		<div class="myinfo-content">
			<h2>개인 정보 확인</h2>
			<hr>
			
			<h3>기본 정보</h3>
			<div class="table_div">
				<table class="table_info"
					style="margin-bottom: 60px; height: 330px;">
					<tr>
						<th>아이디</th>
						<td>아이디</td>
					</tr>

					<tr>
						<th>이름</th>
						<td>김땡땡</td>
					</tr>

					<tr>
						<th>이메일</th>
						<td>abc****@naver.com</td>
					</tr>

					<tr>
						<th>생년월일</th>
						<td>1900-00-00</td>
					</tr>

					<tr>
						<th>휴대폰 번호</th>
						<td>010-1234-1234</td>
					</tr>
				</table>



				<h3>배송지 정보</h3>
				<table class="table_info">
					<tr>
						<th>기본 배송지</th>
						<td style="line-height: 25px;">
							<p style="font-weight: bold;">김땡땡</p>
							<p>[000000] 부산광역시 어쩌고 저쩌고 ***** ****</p>
							<p>
								김땡땡 <span>010-****-****</span>
							</p>
						</td>
					</tr>
				</table>



				<h3>환불 정보</h3>
				<table class="table_info">
					<colgroup>
						<col style="width: 165px;"><col style="width: 140px;">
					</colgroup>
					<tr>
						<th rowspan="4">환불계좌</th>
					</tr>

					<tr>
						<td scope="col">은행명</td>
						<td scope="col">국민은행</td>

					</tr>
					<tr>
						<td>계좌번호</td>
						<td>0000-000-0000-00000</td>
					</tr>
					<tr>
						<td>예금주</td>
						<td>김땡땡</td>
					</tr>
				</table>

				<h3>(선택) 개인정보 수집 및 이용안내</h3>
				<hr>
				<input type="checkbox" id="checkbox_text">(선택) 이메일 이벤트등 마케팅 수신 동의
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
				<a href="" class="deleteBtn">회원 탈퇴</a>
			</div>

			<div style="text-align: center;" >
				<a href="" class="updateBtn">수정</a>
			</div>
			
		</div>
	</div>
				
	
	<!-- 푸터 -->
    <div style="border-top: 1px solid black; height: 200px; background-color: green; clear:left;"> 푸터 </div>


  </body>
</html>