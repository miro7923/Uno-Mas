<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/product_css/reviewWritingForm.css?after22">
<!-- Header end -->

<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

	<section class="product-shop spad page-details">
		<div class="container">
			<div class="customer-review-option">
				<div class="comment-option">
					<div class="leave-comment">
						<h4>문의 답변하기</h4>
						<form action="/product/write_inq_comment" method="post" class="comment-form">
						    <div class="row">
						        <div class="col-lg-12">
						            <input type="hidden" value="${sessionScope.saveANUM }" name="admin_num">
						            <input type="hidden" value="${prod.prod_num }" name="prod_num">
  						            <p class="productName">상품명 : ${prod.prod_name }</p>
						        </div>
						    </div>
							<div class="row">
								<div class="col-lg-2">문의내용</div>
								<div class="col-lg-10">
									<textarea class="title" readonly>${inq.p_inquiry_content }</textarea>
									<input type="hidden" value="${inq.p_inquiry_num }" name="p_inquiry_num">
								</div>
							</div>
							<div class="row">
								<div class="col-lg-2">답변</div>
								<div class="col-lg-10">
									<textarea class="reviewTextarea" name="com_content"
										placeholder="문의글에 대한 답변을 작성해 주세요."></textarea>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-lg-12">
									<button type="button" class="site-btn" id="writeBtn" onclick="history.back();">취소</button> 
									<button type="submit" class="site-btn" id="writeBtn">등록</button>
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
	<script src="${path}/resources/js/product_js/reviewWritingForm.js"></script>
	

</body>
</html>