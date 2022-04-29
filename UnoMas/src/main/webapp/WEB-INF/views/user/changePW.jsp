<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경하기</title>
<link rel="stylesheet" href="${path}/resources/css/user_css/user_sub.css">
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript" src="change_pw.js"></script>
</head>
<body>
	<div id="container">
		<!-- 헤더 들어가는 곳 -->

		<!-- 헤더 들어가는 곳 -->

		<!-- 본문내용 -->
		<article>
			<h3 class="change_pw">새로운 비밀번호로 변경</h3>
			<hr>
			<form action="" id="ch_pw" method="post" onsubmit="return memberCk();">
				<div class="input_box">
					<input type="password" id="ch_pass" name="ch_pass" placeholder="새로운 비밀번호를 입력하세요.">
					<input type="password" id="ch_pass2" name="ch_pass2" placeholder="새로운 비밀번호를 한번 더 입력하세요.">
					<p id="cir_text"></p>
				</div>

				<div id="buttons">
					<input type="submit" value="확인" id="find_ok">
				</div>
			</form>
		</article>
		<!-- 본문내용 -->

		<!-- 푸터 들어가는 곳 -->

		<!-- 푸터 들어가는 곳 -->

	</div>
</body>
</html>