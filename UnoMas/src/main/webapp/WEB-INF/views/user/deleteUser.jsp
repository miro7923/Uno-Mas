<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/user_css/deleteUser.css">
<title>회원 탈퇴 페이지</title>
</head>

<body>
  <jsp:include page="../inc/top.jsp"></jsp:include>
  <jsp:include page="../inc/header.jsp"></jsp:include>

  <div class="delUser_container">
	<jsp:include page="myPageLeftBar.jsp"></jsp:include>

	<div class="delUser_right_container">
	
		<h3 class="delUser_h3">회원탈퇴</h3>
	
		<div class="myinfo_box">
			<ul>
				<li>
					<strong>잔여포인트</strong> 
					<a href="">자세히 보기</a>
					<br>
					<p class="pdct_num">10</p>P
				</li>
				<li>
					<strong>진행중인 배송상품</strong> 
					<a href="">자세히 보기</a>
					<br>
					<p class="pdct_num">0</p>개
				</li>
				<li>
					<strong>총 구매 횟수</strong> 
					<a href="">자세히 보기</a>
					<br>
					<p class="pdct_num">30</p>회
				</li>			
			</ul>
		</div>			
						
						
					
		<div class="leave_list_bold">
			<ul>
				<li>- 탈퇴를 하실 경우 회원님의 모든 정보가 삭제 되오니 신중하게 결정하셔서 신청해 주세요.</li>
				<li>- 탈퇴하신 계정의 아이디는 5일동안 동일한 ID로 가입이 불가능 합니다.</li>
				<li>- 잔여 우노마스 포인트는 탈퇴와 함께 삭제되며, 환불되지 않습니다.</li>
				<li>- 사용하지 않은 쿠폰/지역티켓이 있는 경우, 사용하신 후 탈퇴해 주세요.</li>
			</ul>
		</div>
					
					
		<div class="leave_list">
			<ol>
				<li><span>1.</span>회원 탈퇴 완료 후 잔여 포인트는 모두 삭제되며 환불되지 않습니다. 단,
								환급 가능 유료포인트가 남아있는 경우 먼저 환불 받으셔야 탈퇴가 가능합니다.</li>
								
				<li><span>2.</span>회원탈퇴 신청 즉시 회원전용 서비스의 이용이 불가능합니다.</li>
				
				<li><span>3.</span>회원탈퇴 이후에는 게시물 편집, 삭제가 불가능하므로, 게시물을 편집하거나
								삭제하기 바라시는 경우 게시물 편집/삭제 후 회원탈퇴를 해주시기 바랍니다.</li>
								
				<li><span>4.</span>회원탈퇴 신청 후 신청 취소를 원하시면 5일 이내에
								고객센터(1588-4763)로 요청해주시기 바랍니다. 5일 이후에는 회원탈퇴가 완료되어 해당 계정에 대한 모든
								정보는 삭제되며 복원이 불가능 합니다. 또한 기존의 계정정보 보호를 위해 탈퇴 신청 후 5일 동안은 재가입이
								제한됩니다.</li>
								
				<li><span>5.</span>단 [전자상거래 등에서의 소비자보호에 관한 법률], [통신비밀보호법],
								[개인정보 보호법] 등 법률에 근거하여 거래 관련 권리의무관계의 확인 등을 이유로 일정기간 그 정보를 보유하여야 할
								필요가 있을 경우에는 일정기간 동안 그 정보를 보유합니다.</li>
								
				<li><span>6.</span>우노마스 회원 탈퇴 시 우노마스페이의 등록 정보는 삭제됩니다.</li>
			</ol>
			
			<span name="warn_text1" class="warn_text"></span><br>
			<label class="del_check"><input type="checkbox" name="check_box"> 탈퇴시 삭제내용을 확인했습니다.</label>
		</div>
					
					
					
					
		<h3>회원 정보 확인 <span name="warn_text2" class="warn_text"></span></h3>
		<form>
		<table class="table_info">
			<colgroup><col style="width: 164px;"><col style="width: *;"></colgroup>
			<tbody>
				<tr>
					<th>아이디(이메일)</th>
					<td><input type="text" name="id" value="${saveID }" readonly></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" placeholder="비밀번호 입력"></td>
				</tr>
			</tbody>
		</table>
			
			
		<div class="btn_area">
			<input type="button" class="btn_submit" value="탈퇴" onclick="delFunc()">
			<a href="/UnoMas/user/myInfo" class="btn_cancle" style="color: black">취소</a>
		</div>
		</form>
				
			


	</div> <!-- 우측 컨테이너 -->
  </div> <!-- 전체 컨테이너 -->

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
    
    <script src="${path}/resources/js/user_js/deleteUser.js"></script>
    
    

</body>
</html>