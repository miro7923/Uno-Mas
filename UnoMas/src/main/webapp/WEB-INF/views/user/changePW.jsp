<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>비밀번호 변경하기</title>
<link rel="stylesheet" href="${path}/resources/css/user_css/user_sub.css">

</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/header.jsp"></jsp:include>

	<div id="container">
		<article>
			<h3 class="change_pw">새로운 비밀번호로 변경</h3>
			<hr style="margin-bottom: 0px;">
			<form role="form" id="ch_pw" method="post">
				<div class="input_box">
					<input type="text" name="id" value="${id }" hidden="true">
					
					<p id="cir_text"></p>
					<input type="password" id="ch_pass" name="newPW" placeholder="비밀번호">
					<input type="password" id="ch_pass2" name="newPW_ck" placeholder="비밀번호 확인">
					<p class="find_result_text"></p>
				</div>

			</form>
			<div class="button_box">
					<input type="button" value="확인" onclick="changePWFunc()">
				</div>
			
			
		</article>


	</div>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
    <!-- Footer S
    ection End -->

    <!-- Js Plugins -->
    <script src="${path}/resources/js/user_js/changePW.js"></script>
    
	<script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
	<script src="${path}/resources/js/main.js"></script> 
	
</body>
</html>