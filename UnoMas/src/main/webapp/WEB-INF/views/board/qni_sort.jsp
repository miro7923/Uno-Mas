<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Uno más 자주하는 질문</title>
</head>
<!-- Head start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/board_css/inquiry_list.css?after22" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/board_css/inquiry_form.css?after22" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/board_css/board_main.css?after22" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/board_css/board_sub_menu.css?after22" type="text/css">

<!-- Head end -->

<body>
    <!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Faq Section Begin -->
    <div class="faq-section spad">
    
    
        <div class="container">
            <div class="row">
            
                <div class="col-lg-12">
                
                    <div class="faq-accordin">
                        
                        <div class="page_aticle">
    <jsp:include page="../inc/board_sub_menu.jsp"></jsp:include>
            <div class="page_section">
    <div class="head_aticle">
                    <h2 class="tit">자주하는 질문 <span class="tit_sub">고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span></h2>
                </div>
	<div class="select">
	<select id="search_type_qni" name="search_type">
    	<option value="" disabled selected>검색조건</option>
    	<option value="title">제목</option>
    	<option value="cate">카테고리</option>
    	<option value="content">내용</option>
    </select>
    </div>
    <input type="text" id="keyword_qni" name="keyword" value="" placeholder="검색어 입력" class="search_input" >
<%--     <button onclick="location.href='/qni_paging?page=1&perPageNum=${pList.perPageNum}&search_type=$search_type.val()&keyword=encodeURIComponent($keyword.val())'">검색</button> --%>
    <button id="search_btn" onclick="search_qni()">검색</button>

        <form name="frmList" id="form" method="get" action="?">
                
                <div class="search_date">
                    <select class="btn_layer" id="qni_category">
                       			<option disabled selected>카테고리 선택</option>
                       			<option value="1">배송/포장</option>
                            	<option value="2">취소/교환/환불</option>
                            	<option value="3">이벤트/적립금</option>
                            	<option value="4">상품</option>
                            	<option value="5">주문/결제</option>
                            	<option value="6">회원</option>
                            	<option value="7">서비스 이용</option>
                    </select>
                </div>
                
                <div class="xans-element- xans-myshop xans-myshop-couponserial ">
                    <table class="xans-board-listheader">
                        <tbody>
                            <tr>
                                <th class="input_txt_qni_sort_num">번호</th>
                                <th class="input_txt_qni_sort_cate">카테고리</th>
                                <th class="input_txt_qni_sort_title">제목</th>
                                <th class="input_txt_qni_sort_writer">작성자</th>
                            </tr>
                        </tbody>
                    </table>
                                <c:forEach items="${pList }" var="vo" varStatus="i">
                    <div>
                        <div>
                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_7">
                                <tbody>
    
                                    <tr>
                                        <td class="input_txt_qni_sort_num">${fn:length(pList)-i.index }</td>
                                        <td class="input_txt_qni_sort_cate">${vo.qnaCateVO.qnacate_name }</td>
                                        <td class="input_txt_qni_sort_title">${vo.faq_title }</td>
                                        <td class="input_txt_qni_sort_writer">${vo.adminVO.admin_id }</td>
                                    </tr>
                                </tbody>
                            </table>
                                
                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                <table>
                                    <tbody>
                                        <tr valign="top">
                                            <th style="color:#0000bf;width:40px; padding-top:1px;"></th>
                                            <td>
                                            ${fn:replace(vo.faq_content,cn,br)}<br>
                                            </td>
                                        </tr>
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div>

                    </div>
                                </c:forEach>
                    <div style="padding:1px; border-top:1px solid #e6e6e6"></div>
                    <div class="layout-pagination">
                        <div class="pagediv">
<div class="row justify-content-center">
                <ul class="pagination">
                <c:if test="${pagingVO.prev }">
                <li class="page-item">
                	<a class="page-link text-dark" href='<c:url value="/board/qni_sort${pagingVO.makeQuery(pagingVO.firstPage) }"/>' >
                		<span>&lt;&lt;</span>
                	</a>
                </li>
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/board/qni_sort${pagingVO.makeQuery(pagingVO.startPage-1) }&qnacate_num=${qnacate_num }"/>' aria-label="Previous">
                      <span aria-hidden="true">&lt;</span>
                    </a>
                  </li>
                  </c:if>
                  <c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="pageNum">
                  <li class="page-item"><a class="page-link text-dark" href='<c:url value="/board/qni_sort${pagingVO.makeQuery(pageNum) }&qnacate_num=${qnacate_num }"/>'>${pageNum }</a></li>
                  </c:forEach>
                  <c:if test="${pagingVO.next }">
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/board/qni_sort${pagingVO.makeQuery(pagingVO.endPage+1) }&qnacate_num=${qnacate_num }"/>' aria-label="Next">
                      <span aria-hidden="true">&gt;</span>
                    </a>
                  </li>
                  <li class="page-item">
                	<a class="page-link text-dark" href='<c:url value="/board/qni_sort${pagingVO.makeQuery(pagingVO.lastPage) }"/>' >
                		<span>&gt;&gt;</span>
                	</a>
                </li>
                  </c:if>
                </ul>
            </div>
						
                        </div>
                    </div>
                    <table class="xans-board-search xans-board-search2">
                        <tbody>
                            <tr>
                                <td class="input_txt">&nbsp;</td>
                                
                            </tr>
                        </tbody>
                    </table>
                </div>

        </form>   
            </div><!-- page_section -->
</div>
                            
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Faq Section End -->

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
   <script src="${path}/resources/js/board_js/boardMain.js"></script>
    <script src="${path}/resources/js/board_js/boardSearch.js"></script>
</body>

</html>
