<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="zxx">
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/user_css/myInfo.css">
<link rel="stylesheet" href="${path}/resources/css/admin_css/admin.css?after1">

<%
	pageContext.setAttribute("br", " ");
	pageContext.setAttribute("cn", "\n");
%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

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
					<h2>1:1 문의</h2>
					- 1:1 문의 답변 작성
					<div class="line">
						<hr>
					</div>
					<div class="container">
						<form class="checkout-form" method="post">
							<table class="table_info" style="margin: 40px 0px 30px 0px;">
								<tr>
									<th>작성자</th>
									<td><input type="text" style="margin-bottom: 0px;" class="notice_field " name="admin_name" placeholder="UnoMás" readonly>
										<input type="hidden" name="admin_num" value="1">
									</td>
								</tr>
							</table>
							<table class="table_info">
								<tr>
									<th>내용</th>
								</tr>
								<tr>
									<td>
				                        <div class="textarea">
				                      		<span class="answer" style="text-align: left;">문의 내용 > </span>
				                      		<span class="qna_content">${fn:replace(qnaVO.qna_content,cn,br) }<hr></span>
				                      		
				                      		<textarea inputmode="text" name="qnacom_content" class="textarea-text" placeholder="내용을 입력하세요"></textarea>
				                        </div>
			                       	</td>
								</tr>
							</table>
							<button type="submit" class="count-button">등록</button>
						</form>
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