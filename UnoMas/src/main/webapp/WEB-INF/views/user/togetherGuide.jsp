<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>공동구매 안내페이지</title>
<link rel="stylesheet" href="${path}/resources/css/user_css/togetherGuide.css">
</head>

<body>
	<!-- 헤더 -->
	<div style="height: 80px; border-bottom: 1px solid black; background-color: green">헤더</div>
	<!-- 헤더 -->
	
	<div class="toguide_container">

		<!-- 마이페이지 카테고리 -->
		<jsp:include page="myPageLeftBar.jsp"></jsp:include>
		<!-- 마이페이지 카테고리 -->

		<div class="toguide_content">
			<div class="guide_title">공동구매 안내</div>
			<div class="content_all">
			
			</div>
		</div>
		
	</div>
	
	<!-- 푸터 -->
	<div style="border-top: 1px solid black; height: 200px; background-color: green; clear: left;">푸터</div>
</body>
</html>