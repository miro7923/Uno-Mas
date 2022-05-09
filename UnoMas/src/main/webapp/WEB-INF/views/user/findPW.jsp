<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${path}/resources/css/user_css/user_sub.css">
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/header.jsp"></jsp:include>
	<div id="container">

		<!-- 본문내용 -->
		<article>
			<h3 class="find_pw">비밀번호 찾기</h3>
			<hr>
			<form action="" id="fn_pw" method="post">
				<div class="input_box">
				<input type="text" id="name" name="name" placeholder="이름을 입력하세요."><br>
				<input type="text" id="id" name="id" placeholder="아이디를 입력하세요."><br>
				<input type="email" id="email2" name="email2" placeholder="이메일을 입력하세요.">
				<input type="submit" value="인증요청" id="check_req">
				<input type="text" id="num" name="number" placeholder="인증번호 6자리 숫자 입력">
				<p id="cir_text"></p>
				</div>
			</form>
			
			<div id="buttons">
				<input type="submit" value="확인" id="find_ok" onclick="memberCk()">
				<input type="button" value="로그인" id="login" onclick=" location.href='/user/login';">
			</div>
		</article>
	<!-- 본문내용 -->

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
    <script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
    <script src="${path}/resources/js/user_js/findPW.js"></script>
</body>
</html>