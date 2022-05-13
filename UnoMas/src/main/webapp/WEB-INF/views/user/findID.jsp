<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${path}/resources/css/user_css/user_sub.css">
</head>
<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/header.jsp"></jsp:include>
	<div id="container">
		<!-- 본문내용 -->
		<article>
			<h3 class="find_id">아이디 찾기</h3>
			<hr>
			<p id="find_result" class="find_result_text"></p>
			
			<form role="form" action="find_id" id="fn_id" method="post">
				<div class="input_box">
					<input type="text" id="name" name="user_name" placeholder="이름을 입력하세요.">
					<input type="email" id="name" name="user_email" placeholder="이메일을 입력하세요.">
					<p id="cir_text"></p>
				</div>	
			</form>
			
			<div id="buttons">
				<input type="submit" value="확인" id="find_ok" onclick="findIdFunc()">
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
    <script src="${path}/resources/js/user_js/findID.js"></script>
    
</body>
</html>