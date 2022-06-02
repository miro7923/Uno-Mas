<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Uno más 공지사항</title>
</head>
<!-- Head start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/board_css/inquiry_list.css?after22" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/board_css/inquiry_form.css?after22" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/board_css/board_main.css?after22" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/board_css/board_sub_menu.css?after22" type="text/css">
<!-- Head End -->

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
        <h2 class="tit">공지사항 <span class="tit_sub">새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span></h2>
    </div>
    
<!--     <select id="search_type" name="search_type"> -->
<!--     	<option value="">검색조건</option> -->
<!--     	<option value="title">제목</option> -->
<!--     	<option value="cate">카테고리</option> -->
<!--     	<option value="content">내용</option> -->
<!--     </select> -->
	<input type="hidden" value="title" name="search_type" id="search_type_faq">
    <input type="text" id="keyword_faq" name="keyword" value="" placeholder="검색어 입력" >
<%--     <button onclick="location.href='/qni_paging?page=1&perPageNum=${pList.perPageNum}&search_type=$search_type.val()&keyword=encodeURIComponent($keyword.val())'">검색</button> --%>
    <button class="" id="search_btn" onclick="search_faq()">검색</button>
    
    <form name="frmList" onsubmit="return chkFormList(this)">
        <input type="hidden" name="id" value="notice">
        


        <table class="xans-board-listheader jh" >
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th></th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회</th>
                </tr>
            </thead>
            <tbody>
            <c:set var="num" value="${pagingVO.totalCount - ((pagingVO.cri.page-1) * 10) }"></c:set>
            <c:forEach items="${pList }" var="vo" varStatus="i">
                <tr>
                    <td width="50" nowrap="" align="center" >${num }</td>
                    <td style="padding-left:10px; text-align:left; color:#999">
                        <a href="/UnoMas/board/faq_detail?notice_num=${vo.notice_num }"><b>${vo.notice_title }</b></a>
                    </td>
                    <td>
                    <c:choose>
                    <c:when test="${vo.notice_file eq null }">
                    
                    </c:when>
                    <c:otherwise>
                    <img alt="" src="../resources/img/board/fileIcon.png" style="width: 15px;">
                    </c:otherwise> 
                    </c:choose> 
                    </td>
                    <td width="100" nowrap="" align="center">
                        ${vo.adminVO.admin_id } </td>
                    <td width="100" nowrap="" align="center" class="eng2">${vo.notice_regdate }</td>
                    <td width="30" nowrap="" align="center" class="eng2">${vo.notice_readcnt }</td>
                </tr>
                <c:set var="num" value="${num-1 }"></c:set>
            </c:forEach>

            </tbody>
        </table>
        
        <div class="layout-pagination">
        <div class="pagediv">

 <div class="row justify-content-center" style="justify-content: center!important;">
                <ul class="pagination">
                <c:if test="${pagingVO.prev }">
                <li class="page-item">
                	<a class="page-link text-dark" href='<c:url value="/board/faq_search${pagingVO.makeQuery(pagingVO.firstPage) }"/>' >
                		<span>&lt;&lt;</span>
                	</a>
                </li>
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/board/faq_search${pagingVO.makeQuery(pagingVO.startPage-1) }"/>' aria-label="Previous">
                      <span aria-hidden="true">&lt;</span>
                    </a>
                  </li>
                  </c:if>
                  <c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="pageNum">
                  <li class="page-item"><a class="page-link text-dark" href='<c:url value="/board/faq_search${pagingVO.makeQuery(pageNum) }"/>'>${pageNum }</a></li>
                  </c:forEach>
                  <c:if test="${pagingVO.next }">
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/board/faq_search${pagingVO.makeQuery(pagingVO.endPage+1) }"/>' aria-label="Next">
                      <span aria-hidden="true">&gt;</span>
                    </a>
                  </li>
                  <li class="page-item">
                	<a class="page-link text-dark" href='<c:url value="/board/faq_search${pagingVO.makeQuery(pagingVO.lastPage) }"/>' >
                		<span>&gt;&gt;</span>
                	</a>
                </li>
                  </c:if>
                </ul>
            </div>

                    </div> <!-- paging div -->
        
        <table class="xans-board-search xans-board-search2">
            <tbody>
                <tr>

                    <td>
                    
                   
                   
                    
                    </td>
                </tr>
            </tbody>
        </table>
        </div><!-- paging 검색 div -->
    </form>
    </div>
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
