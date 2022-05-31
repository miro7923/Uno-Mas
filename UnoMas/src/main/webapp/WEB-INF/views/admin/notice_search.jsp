<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/user_css/myInfo.css">
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
					- 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.
					<div class="line">
						<hr>
					</div>
					<div class="container">
						<form action="#" class="checkout-form" name="frmList" onsubmit="return chkFormList(this)">
						<input type="hidden" name="id" value="notice">
							<div class="row">
								<div class="row">
									<div class="col-lg-3" style="padding-right:0px; border-right: none;">
										<select class="selectBox" name="searchType">
											<option value="title">제목</option>
										</select>
										</div>
										<div class="col-lg-9" style="padding-left:0px;">
											<div class="input-search">
												<input type="text" id="keyword" name="keyword" value="" placeholder="검색어를 입력해주세요.">
												<button type="button" id="search_btn" onclick="search_admin_notice()">
													<i class="ti-search"></i>
												</button>
											</div><br>
										</div>
										<div class="col-lg-12">
											<table class="table_board">
												<thead>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일</th>
														<th>조회</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${noticeList }" var="vo">
														<tr>
															<td>${vo.notice_num }</td>
															<td><a href="/UnoMas/admin/notice_read?notice_num=${vo.notice_num }">
																	<span class="title">${vo.notice_title }</span>
																</a>
															</td>
															<td>UnoMás</td>
															<td>${vo.notice_regdate }</td>
															<td>${vo.notice_readcnt }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<!-- 페이징 처리 -->
											<div class="row justify-content-center">
												<div class="col-lg-12" style="text-align:center;">
													<ul class="pagination">
														<c:if test="${pagingVO.prev }">
															<li class="page-item"><a class="page-link text-dark"
																href='<c:url value="/UnoMas/admin/notice_board${pagingVO.makeQuery(pagingVO.startPage-1) }"/>'
																aria-label="Previous"> <span aria-hidden="true">&lt;</span>
															</a></li>
														</c:if>
														<c:forEach begin="${pagingVO.startPage }"
															end="${pagingVO.endPage }" var="pageNum">
															<li class="page-item"><a class="page-link text-dark"
																href='<c:url value="/UnoMas/admin/notice_board${pagingVO.makeQuery(pageNum) }"/>'>${pageNum }</a></li>
														</c:forEach>
														<c:if test="${pagingVO.next }">
															<li class="page-item"><a class="page-link text-dark"
																href='<c:url value="/UnoMas/admin/notice_board${pagingVO.makeQuery(pagingVO.endPage+1) }"/>'
																aria-label="Next"> <span aria-hidden="true">&gt;</span>
															</a></li>
														</c:if>
													</ul>
												</div>
											</div>
											<!-- 페이징 처리 끝 -->
											<div class="col-lg-12" style="padding:0px;">
												<div class="row" style="display: inline;">
		                                        	<button type="button" class="register-button" onclick="location.href='/UnoMas/admin/notice_write';">공지사항 등록</button>
												</div>
											</div>
										</div>
									</div>
								</div>
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