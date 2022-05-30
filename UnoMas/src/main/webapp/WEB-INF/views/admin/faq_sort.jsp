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
					<h2>자주하는 질문</h2>
					- 고객님들께서 가장 자주하시는 질문을 모두 모았습니다.
					<div class="line">
						<hr>
					</div>
					<div class="container">
						<form action="?" class="checkout-form" id="form" method="get">
							<input type="hidden" name="id" value="notice">
							<div class="row">
								<div class="col-lg-12" style="padding: 0px;">
									<select class="selectBox" id="qni_category">
										<option>카테고리 선택</option>
										<option value="1">배송/포장</option>
										<option value="2">취소/교환/환불</option>
										<option value="3">이벤트/적립금</option>
										<option value="4">상품</option>
										<option value="5">주문/결제</option>
										<option value="6">회원</option>
										<option value="7">서비스 이용</option>
									</select>
								</div>
								<div class="row">
									<div class="col-lg-3"
										style="padding-right: 0px; border-right: none;">
										<select class="selectBox" id="search_type" name="search_type">
											<option value="">검색조건</option>
											<option value="title">제목</option>
											<option value="cate">카테고리</option>
											<option value="content">내용</option>
										</select>
									</div>
									<div class="col-lg-9" style="padding-left: 0px;">
										<div class="input-search">
											<input type="text" id="keyword" name="keyword" value=""
												placeholder="검색어를 입력해주세요.">
											<button type="button" id="search_btn"
												onclick="search_admin_faq()">
												<i class="ti-search"></i>
											</button>
										</div>
										<br>
									</div>
									<div class="col-lg-12">
					                    <table class="table_board" style="margin-bottom: 0px;">
					                        <tbody>
					                            <tr>
					                                <th style="width: 70px; text-align: center;" class="input_txt">번호</th>
					                                <th style="width: 135px; text-align: center;" class="input_txt">카테고리</th>
					                                <th style="width: 500px; text-align: center;" class="input_txt">제목</th>
					                                <th style="width: 100px; text-align: center;" class="input_txt">작성자</th>
					                            </tr>
					                        </tbody>
					                    </table> <!-- table header -->
					                 </div>
                                <c:forEach items="${pList }" var="vo">
                                
                                <div class="col-lg-12">
		                        	<div class="col-lg-12" style="padding: 0px;">
				                        <div>
				                            <table class="table_board" onclick="view_content(this)" id="faq_7" style="margin-bottom:0px;">
				                                <tbody>
				    
				                                    <tr>
				                                        <td style="width: 70px; text-align: center;">${vo.faq_num }</td>
				                                        <td style="width: 135px; text-align: center;">${vo.qnaCateVO.qnacate_name }</td>
				                                        <td style="width: 500px; cursor:pointer">${vo.faq_title }</td>
				                                        <td style="width: 100px; cursor:pointer">UnoMás</td>
<%-- 				                                        <td style="width: 100px; cursor:pointer">${vo.adminVO.admin_id }</td> --%>
				                                    </tr>
				                                </tbody>
				                            </table> 
				                                
				                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
				                                <table class="table_board">
				                                    <tbody>
				                                        <tr valign="top">
				                                            <td>
				                                            
				                                            <div class="fnq-textarea">
				                                            	<span class="answer">답변 ></span> 
										                    	<textarea inputmode="text" name="notice_content" class="textarea-text" placeholder="내용을 입력하세요" readonly>${fn:replace(vo.faq_content,cn,br)}</textarea>
										                    </div>
				                                            
				                                            
<%-- 				                                            <span class="answer">답변 ></span> ${fn:replace(vo.faq_content,cn,br)} --%>
				                                            <br>
				                                            <input type="text" style="border:none; margin:0px;" readonly>
				                                            <input type="button" class="fnq-count-button" value="수정" onclick="location.href='/admin/faq_update?faq_num=${vo.faq_num}'">
				                                            <input type="button" class="fnq-del-button" value="삭제" onclick="location.href='/admin/faq_delete?faq_num=${vo.faq_num}'">
				                                            
				                                            </td>
				                                        </tr>
				                                    </tbody>
				                                    
				                                </table>
				                           	</div>
		                           		</div>
		                        	</div> <!-- table body -->
	                        	</div>
                            </c:forEach>
                                

									<!-- 페이징 처리 -->
									<div class="col-lg-12">
									<div class="row justify-content-center">
										<div class="col-lg-12" style="text-align: center;">
											<ul class="pagination">
												<c:if test="${pagingVO.prev }">
													<li class="page-item"><a class="page-link text-dark"
														href='<c:url value="/admin/faq_sort${pagingVO.makeQuery(pagingVO.startPage-1) }"/>'
														aria-label="Previous"> <span aria-hidden="true">&lt;</span>
													</a></li>
												</c:if>
												<c:forEach begin="${pagingVO.startPage }"
													end="${pagingVO.endPage }" var="pageNum">
													<li class="page-item"><a class="page-link text-dark"
														href='<c:url value="/admin/faq_sort${pagingVO.makeQuery(pageNum) }"/>'>${pageNum }</a></li>
												</c:forEach>
												<c:if test="${pagingVO.next }">
													<li class="page-item"><a class="page-link text-dark"
														href='<c:url value="/admin/faq_sort${pagingVO.makeQuery(pagingVO.endPage+1) }"/>'
														aria-label="Next"> <span aria-hidden="true">&gt;</span>
													</a></li>
												</c:if>
											</ul>
										</div>
									</div>
									</div>
									<!-- 페이징 처리 끝-->
									<div class="col-lg-12">
                                		<button type="button" class="register-button" onclick="location.href='/admin/faq_write';">자주하는 질문 등록</button>
									</div>
								</div>
							</div>
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
    <jsp:include page="../inc/adminScript.jsp"></jsp:include>
</body>

</html>