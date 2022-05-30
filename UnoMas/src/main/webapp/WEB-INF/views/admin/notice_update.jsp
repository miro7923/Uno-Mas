<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<jsp:include page="../inc/top.jsp"></jsp:include>
<%-- <link rel="stylesheet" href="${path}/resources/css/product_css/productAdmin.css?after3"> --%>
<link rel="stylesheet" href="${path}/resources/css/user_css/updateMyInfo.css">
<link rel="stylesheet" href="${path}/resources/css/admin_css/admin.css?after1">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UnoMas 관리자페이지</title>
</head>
<!-- Start Header -->

<body>
    <!-- Header Section Begin -->
    <jsp:include page="../inc/adminHeader2.jsp"></jsp:include>
    <!-- Header End -->
    
    <!-- Product Register Section End -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">

				<!-- 관리자 카테고리 -->
				<div class="col-lg-3 produts-sidebar-filter">
					<div class="filter-widget">
						<jsp:include page="../inc/adminLeftBar.jsp"></jsp:include>
					</div>
				</div>

				<div class="col-lg-9">
					<h2>공지사항</h2>
					- ${vo.notice_num }번 글 수정
					<div class="line">
						<hr>
					</div>
					<div class="container">
						<form method="post" action="/admin/notice_update"
							class="checkout-form">
							<br>
							<table class="table_board">
								<tr>
									<th>작성자</th>
									<td colspan="3"><input type="text" class="input_field"
										name="admin_num" value="UnoMás" readonly></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="text" class="input_field"
										name="notice_title" value="${vo.notice_title }"></td>
								</tr>
							</table>
							<table class="table_board">
								<tr>
									<th>내용</th>
								</tr>
								<tr>
									<td>
										<div class="textarea">
											<textarea inputmode="text" name="notice_content"
												class="textarea-text" placeholder="내용을 입력하세요">${vo.notice_content }</textarea>
										</div>
									</td>
								</tr>
							</table>
							<button type="submit" class="count-button">등록</button>
							<br><br>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Partner Logo Section End -->
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
    <script src="${path}/resources/js/product_js/productAdmin.js"></script>
</body>

</html>