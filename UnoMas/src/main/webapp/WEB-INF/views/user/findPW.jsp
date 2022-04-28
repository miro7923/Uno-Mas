<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="member_sub.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function memberCk() {
		if ($("#name").val() == "") {
			$("#cir_text").text("이름을 입력하세요.");
			$("#name").focus();
			return false;
		};
		
		if ($("#id").val() == "") {
			$("#cir_text").text("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		};

		if ($("#email2").val() == "") {
			$("#cir_text").text("이메일을 입력하세요.");
			$("#email2").focus();
			return false;
		};
		
		if ($("#num").val() == "") {
			$("#cir_text").text("인증번호(6자리)를 입력하세요.");
			$("#num").focus();
			return false;
		};

	}
</script>
</head>

<body>
	<div id="container">
		<!-- 헤더 들어가는 곳 -->

		<!-- 헤더 들어가는 곳 -->

		<!-- 본문내용 -->
		<article>
			<h3 class="find_pw">비밀번호 찾기</h3>
			<hr>
			<form action="" id="fn_pw" method="post" onsubmit="return memberCk();">
				<div class="input_box">
				<input type="text" id="name" name="name" placeholder="이름을 입력하세요."><br>
				<input type="text" id="id" name="id" placeholder="아이디를 입력하세요."><br>
				<input type="email" id="email2" name="email2" placeholder="이메일을 입력하세요.">
				<input type="submit" value="인증요청" id="check_req">
				<input type="text" id="num" name="number" placeholder="인증번호 6자리 숫자 입력">
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