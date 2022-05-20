<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="stylesheet" href="${path}/resources/css/admin_css/adminLogin.css">
<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- Header end -->

<body>
    <!-- Header Section Begin -->
    <jsp:include page="../inc/header.jsp"></jsp:include>
    <!-- Header End -->

	<!-- 본문내용 -->
    <div id="container">
		<article>
			<h3 class="login_name">관리자 로그인</h3>
			<hr>
			<form id="join" method="post">
				<div class="input_box">
				<input type="text" id="id" name="admin_id" placeholder="아이디를 입력하세요.">
				<input type="password" id="pass" name="admin_pass" placeholder="비밀번호를 입력하세요.">
				<p id="cir_text"></p>
				</div>
				
				<div id="buttons">
					<input type="button" value="로그인" id="loginus" onclick="adminCk()">
<!-- 					<input type="button" value="회원가입" id="joinus" onclick=" "> -->
				</div>
			</form>

		</article>
	</div>
		<!-- 본문내용 -->
    
    
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
    <script src="${path}/resources/js/admin_js/adminLogin.js"></script>
</body>

</html>