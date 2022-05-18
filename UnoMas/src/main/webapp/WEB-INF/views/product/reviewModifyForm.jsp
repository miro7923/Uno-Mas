<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/product_css/reviewWritingForm.css?pafet">
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
						<h4>후기수정</h4>
						<form action="/product/modify_review" method="post" class="comment-form" enctype="multipart/form-data">
							<div class="row">
								<div class="col-lg-12">
									<!-- @@ DB 전송시 파라미터로 넘겨줘서 해당 번호 상품에 등록되도록 하기 -->
									<input type="hidden" value="${vo.review_num }" name="review_num">
									<input type="hidden" value="${vo.prod_num }" name="prod_num">
									<input type="hidden" value="${sessionScope.saveID.user_num }" name="user_num">
									<p class="productName">
										상품명 : ${prod_name } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										평가 : 
										<input type="hidden" id="reviewRating" value="${vo.review_rating }">
										<select class="rating" name="review_rating" id="review_rating">
										    <option>5.0</option>
										    <option>4.5</option>
										    <option>4.0</option>
										    <option>3.5</option>
										    <option>3.0</option>
										    <option>2.5</option>
										    <option>2.0</option>
										    <option>1.5</option>
										    <option>1.0</option>
										    <option>0.5</option>
										</select>
								    </p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-2">제목</div>
								<div class="col-lg-10">
									<input type="text" class="title" value="${vo.review_title }" 
									    placeholder="제목을 입력해주세요." maxlength="40" name="review_title">
								</div>
							</div>
							<div class="row">
								<div class="col-lg-2">내용</div>
								<div class="col-lg-10">
									<textarea class="reviewTextarea" name="review_content"
										placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며, 일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성시 검토 후 비공개 조치될 수 있습니다.
반품/환불 문의는 1:1문의로 가능합니다.">${vo.review_content }</textarea>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-lg-2">사진등록</div>
								<div class="col-lg-10">
								    <c:choose>
									    <c:when test="${vo.review_image == null }">
											<input type="text" class="uploadImgName" id="uploadImgName" value="이미지 선택"
												readonly name="uploadImgName"> 
									    </c:when>
									    <c:otherwise>
									    	<input type="text" class="uploadImgName" id="uploadImgName" value="${vo.review_image }"
												readonly name="uploadImgName">
									    </c:otherwise>
								    </c:choose>
									<label class="site-btn" for="uploadImg" id="uploadBtn">업로드</label>
									<button type="button" class="site-btn" onclick="removeImg();">삭제</button>
									<input type="file" id="uploadImg" name="review_image" oninput="checkFileName();">
									<p>구매한 상품이 아니거나 캡쳐 사진을 첨부할 경우, 통보없이 삭제 및 적립 혜택이 취소됩니다.</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<input type="button" class="site-btn" id="writeBtn"
										onclick="history.back();" value="취소">
									<input type="submit" class="site-btn" id="writeBtn" value="수정">
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