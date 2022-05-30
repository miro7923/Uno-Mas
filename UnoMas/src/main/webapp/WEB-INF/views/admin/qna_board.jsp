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
					- 1:1 문의 답변 현황
					<div class="line">
						<hr>
					</div>
					<div class="container">
						<form action="?" class="checkout-form" id="form" method="get">
							<input type="hidden" name="id" value="notice">
							<div class="row">
								<div class="row">
									<div class="col-lg-12">
					                    <table class="table_board" style="margin-bottom: 0px;">
					                        <tbody>
					                            <tr>
					                                <th style="width: 70px; text-align: center;" class="input_txt">번호</th>
					                                <th style="width: 400px; text-align: center;" class="input_txt">제목</th>
					                                <th style="width: 120px; text-align: center;" class="input_txt">작성일</th>
					                                <th style="width: 70px; text-align: center;" class="input_txt">답변상태</th>
					                                <th style="width: 70px; text-align: center;" class="input_txt">삭제</th>
<!-- 					                                <th style="width: 70px; text-align: center;" class="input_txt">삭제</th> -->
					                            </tr>
					                        </tbody>
					                    </table> <!-- table header -->
					                 </div>
                                <c:forEach items="${pList }" var="vo">
                                
                                <div class="col-lg-12">
		                        	<div class="col-lg-12" style="padding: 0px;">
				                        <div>
				                            <table class="table_qna" onclick="view_content(this)" id="faq_7" style="margin-bottom:0px;">
				                                <tbody>
				    
				                                    <tr>
				                                        <td style="width: 70px; text-align: center;">${vo.qna_num }</td>
				                                        <td style="width: 400px; text-align: center;">${vo.qna_title }</td>
				                                        <td style="width: 120px; text-align: center;">${vo.qna_regdate }</td>
				                                        <c:choose>
					                                        <c:when test="${vo.qna_process eq '0'}">
					                                        	<td style="width: 70px; text-align: center; cursor:pointer"><a href="/admin/qna_comment?qna_num=${vo.qna_num }"><span class="answer_b">답변대기</span></a> </td>
					                                        </c:when>
					                                        <c:otherwise>
					                                        	<td style="width: 70px; text-align: center; cursor:pointer"><a href="/admin/qna_commentView?qna_num=${vo.qna_num }"><span class="answer_f">답변완료</span></a></td>
															</c:otherwise>
                        								</c:choose>				                                        
				                                        <td style="width: 70px; text-align: center; cursor: pointer">
				                                        <button type="button" class="answer-button" value="삭제" onclick="deleteAction(${vo.qna_num})">삭제</button></td>
				                                    </tr>
				                                </tbody>
				                            </table> 
				                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
				                                <table class="table_qna">
				                                    <tbody>
				                                        <tr valign="top">
				                                            <td>
				                                            
				                                            <div class="qna-textarea">
				                                            	<span class="answer">1차 카테고리 ${vo.qnaCateVO.qnacate_name } > 2차 카테고리 ${vo.qnacate2 }</span> 
										                    	<textarea inputmode="text" name="notice_content" class="textarea-text" placeholder="내용을 입력하세요" readonly>${fn:replace(vo.qna_content,cn,br)}</textarea>
										                   		첨부 이미지(1) <a href="/admin/image1Down?qna_image1=${vo.qna_image1 }">
										                   					<img name="qna_image1" alt="img1" src="/resources/upload/images/board/qna/${vo.qna_image1 }">
										                   				</a>
										                   				<input type="hidden" value="${vo.qna_image1 }" name="qna_image1"><br>
			            										첨부 이미지(2) <a href="/admin/image2Down?qna_image2=${vo.qna_image2 }">
			            													<img name="qna_image2" alt="img2" src="/resources/upload/images/board/qna/${vo.qna_image2 }">
			            												</a>
			            												<input type="hidden" value="${vo.qna_image2 }" name="qna_image2">
										                    </div>
				                                            <br>
				                                            <input type="text" style="border:none; margin:0px;" readonly>
				                                            </td>
				                                        </tr>
				                                    </tbody>
				                                    
				                                </table>
				                           	</div>
		                           		</div>
		                        	</div> <!-- table body -->
	                        	</div>
                            </c:forEach>
                                <jsp:include page="../inc/adminScript.jsp"></jsp:include>

									<!-- 페이징 처리 -->
									<div class="col-lg-12">
									<div class="row justify-content-center">
										<div class="col-lg-12" style="text-align: center;">
											<ul class="pagination">
												<c:if test="${pagingVO.prev }">
													<li class="page-item"><a class="page-link text-dark"
														href='<c:url value="/admin/faq_board${pagingVO.makeQuery(pagingVO.startPage-1) }"/>'
														aria-label="Previous"> <span aria-hidden="true">&lt;</span>
													</a></li>
												</c:if>
												<c:forEach begin="${pagingVO.startPage }"
													end="${pagingVO.endPage }" var="pageNum">
													<li class="page-item"><a class="page-link text-dark"
														href='<c:url value="/admin/faq_board${pagingVO.makeQuery(pageNum) }"/>'>${pageNum }</a></li>
												</c:forEach>
												<c:if test="${pagingVO.next }">
													<li class="page-item"><a class="page-link text-dark"
														href='<c:url value="/admin/faq_board${pagingVO.makeQuery(pagingVO.endPage+1) }"/>'
														aria-label="Next"> <span aria-hidden="true">&gt;</span>
													</a></li>
												</c:if>
											</ul>
										</div>
									</div>
									</div>
									<!-- 페이징 처리 끝-->
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
</body>

</html>