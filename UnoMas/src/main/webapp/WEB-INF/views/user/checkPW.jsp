<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<meta charset=UTF-8>
<link rel="stylesheet" href="${path}/resources/css/user_css/checkPW.css">
<body>
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 -->

	<div class="checkPW_container">
		<!-- 마이페이지 카테고리 -->
		<jsp:include page="myPageLeftBar.jsp"></jsp:include>

		<form method="post">
			<div class="checkPW_content">
				<h2>비밀번호 재확인</h2>
				<hr>
				<input type="hidden" id="id" name="user_id"  value="${saveID }" >
				<input type="password" id="pass" name="user_pass" placeholder="비밀번호를 입력하세요">
				<input type="button" value="확인" id="reBtn" onclick="passCk()"><br>
				<p id="cir_text"></p>
			</div>
		</form>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 -->

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
	<script src="${path}/resources/js/user_js/checkPW.js"></script>
</body>
</html>