<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/reviewWritingForm.css?after2">
<!-- Header end -->

<%
// @@ 상품번호를 파라메터로 받아와서 상단에 해당 상품명 노출하기 @@
%>
<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

	<section class="product-shop spad page-details">
		<div class="container">
			<div class="customer-review-option">
				<div class="comment-option">
					<div class="leave-comment">
						<h4>후기쓰기</h4>
						<form action="#" class="comment-form">
							<div class="row">
								<div class="col-lg-2">제목</div>
								<div class="col-lg-10">
									<input type="text" placeholder="제목을 입력해주세요." maxlength="40">
								</div>
							</div>
							<div class="row">
								<div class="col-lg-2">내용</div>
								<div class="col-lg-10">
									<textarea class="reviewTextarea"
										placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며, 일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성시 검토 후 비공개 조치될 수 있습니다.
반품/환불 문의는 1:1문의로 가능합니다."></textarea>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-lg-2">사진등록</div>
								<div class="col-lg-10">
								    <input class="uploadImgName" id="uploadImgName" value="이미지 선택" disabled="disabled">
								    <label class="site-btn" for="uploadImg" id="uploadBtn">업로드</label>
									<input type="file" id="uploadImg" oninput="checkFileName();">
									<button type="button" class="site-btn" onclick="removeImg();">삭제</button>
           							<p>구매한 상품이 아니거나 캡쳐 사진을 첨부할 경우, 통보없이 삭제 및 적립 혜택이 취소됩니다.</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<button type="submit" class="site-btn" id="writeBtn">후기쓰기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

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
	<script src="${path}/resources/js/reviewWritingForm.js"></script>
	

</body>
</html>