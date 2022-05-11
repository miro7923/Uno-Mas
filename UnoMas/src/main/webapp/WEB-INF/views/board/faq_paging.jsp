<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<head>
<style type="text/css">
	*,
*:after,
*:before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 0
}

.xans-board-listheader {
    border-top: 2px solid #522772;
    font-size: 13px;
    line-height: 140%
}

.xans-board-listheader tr td {
    padding: 12px;
    border-top: 1px solid #f4f4f4;
    text-align: center;
    vertical-align: middle;
    word-wrap: break-word
}

.xans-board-listheader tbody tr:first-child td {
    border-top: 1px solid #333
}

.xans-board-listheader.jh {
    border-bottom: 1px solid #f4f4f4
}

.xans-board-listheader.jh tr td {
    padding: 20px 0
}


.xans-board-listheader th {
    padding: 20px 0;
    vertical-align: middle;
    font-size: 12px
}

.xans-board-listheader td a {
    color: #555
}
.page_aticle .head_aticle {
    padding: 5px 0 34px
}

.page_aticle .head_aticle .tit {
    height: 36px;
    font-weight: 700;
    font-size: 24px;
    line-height: 36px;
    color: #333;
    letter-spacing: -.5px
}

.page_aticle .head_aticle .tit_sub {
    padding-left: 11px;
    font-size: 14px;
    color: #999;
    line-height: 20px;
    letter-spacing: -.3px;
    vertical-align: 3px
}
.page_article {
    float: right;
}

.layout-pagination {
    margin: 60px 0 0;
    text-align: center
}

.layout-pagination-button {
    display: inline-block;
    width: 34px;
    height: 34px;
    border: 1px solid #ddd;
    border-left: 0;
    vertical-align: top
}

.layout-pagination-button:first-child {
    border-left: 1px solid #ddd
}

.layout-pagination-number {
    font-weight: 700;
    color: #333;
    line-height: 34px
}

.layout-pagination-number:hover,
.layout-pagination-number.__active {
    background-color: #f7f7f7;
    color: #5f0080
}

.layout-pagination-first-page,
.layout-pagination-prev-page,
.layout-pagination-next-page,
.layout-pagination-last-page {
    background-repeat: no-repeat;
    background-position: 50% 50%;
    text-indent: -9999px
}

</style>

</head>
<!-- Head start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
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
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>FAQs</span>
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
    <div class="head_aticle">
        <h2 class="tit">공지사항 <span class="tit_sub">새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span></h2>
    </div>
    
    
    <select id="select_location" onchange="select_location()">
    	<option value="">선택</option>
    	<option value="/faq_paging">공지사항</option>
    	<option value="/qni_paging">자주하는 질문</option>
    	<option value="/inquiry_list">1:1 문의</option>
    </select>
    
    <input type="button" value="글쓰기" onclick="location.href='/faq_insert';">
    
    <select id="search_type" name="search_type">
<!--     	<option value="">검색조건</option> -->
    	<option value="title">제목</option>
<!--     	<option value="cate">카테고리</option> -->
<!--     	<option value="content">내용</option> -->
    </select>
    <input type="text" id="keyword" name="keyword" value="" placeholder="검색어 입력">
<%--     <button onclick="location.href='/qni_paging?page=1&perPageNum=${pList.perPageNum}&search_type=$search_type.val()&keyword=encodeURIComponent($keyword.val())'">검색</button> --%>
    <button id="search_btn" onclick="search()">검색</button>
    
    <script type="text/javascript">
    	function search() {
    		var search_type_val = document.getElementById("search_type");
    		var type_val = search_type_val.options[search_type_val.selectedIndex].value;
    		var keyword_val = document.getElementById("keyword").value;
    		var url = "/qni_paging?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    		location.href=url;
    	}
    </script>
    
    <script type="text/javascript">
    	function select_location() {
    		var val = document.getElementById('select_location');
    		var val_loc = val.options[val.selectedIndex].value;
    		location.href = val_loc;
    	}
    </script>
    
    <form name="frmList" action="/shop/board/list.php?&amp;" onsubmit="return chkFormList(this)">
        <input type="hidden" name="id" value="notice">
        <style>
            .notice .layout-pagination {
                margin: 0
            }

            .eng2 {
                color: #939393
            }

            .xans-board-listheader {
                font-size: 12px
            }
        </style>


        <table width="1000px" class="xans-board-listheader jh" cellpadding="0" cellspacing="0">
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
            <c:forEach items="${pList }" var="vo">
                <tr>
                    <td width="50" nowrap="" align="center" >${vo.notice_num }</td>
                    <td style="padding-left:10px; text-align:left; color:#999">
                        <a href="/faq_detail?notice_num=${vo.notice_num }"><b>${vo.notice_title }</b></a>
                    </td>
                    <td width="100" nowrap="" align="center">
                        관리자${vo.admin_num }번 </td>
                    <td width="100" nowrap="" align="center" class="eng2">${vo.notice_regdate }</td>
                    <td width="30" nowrap="" align="center" class="eng2">${vo.notice_readcount }</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        <table class="xans-board-search xans-board-search2">
            <tbody>
                <tr>

                    <td class="input_txt">&nbsp;</td>
                    <td>
                    
                    
                    <div class="pagediv">
                        <ul class="btn-group pagination">
<%--     <c:if test="${pagingVO.prev }"> --%>
    <li>
        <a href='<c:url value="/faq_paging${pagingVO.makeQuery(pagingVO.startPage-1) }"/>'><img src="${path}/resources/img/prev.png"></a>
    </li>
<%--     </c:if> --%>
    <c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="pageNum">
    <li>
        <a href='<c:url value="/faq_paging${pagingVO.makeQuery(pageNum) }"/>' class="layout-pagination-button layout-pagination-number __active"><i class="fa">${pageNum }</i></a>
    </li>
    </c:forEach>
<%--     <c:if test="${pagingVO.next && pagingVO.endPage >0 }"> --%>
    <li>
<%--         <a href='<c:url value="/qni_paging?page=${pagingVO.endPage+1 }"/>' class="layout-pagination-button layout-pagination-next-page">다음</a> --%>
        <a href='<c:url value="/faq_paging${pagingVO.makeQuery(pagingVO.endPage+1) }"/>'><img src="${path}/resources/img/next.png"></a>
    </li>
<%--     </c:if> --%>
</ul>
<!--                         <a href="" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a> -->
<!--                         <a href="" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a> -->
<!--                         <strong class="layout-pagination-button layout-pagination-number __active">1</strong> -->
<!--                         <a href="" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a> -->
<!--                         <a href="" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a></div> -->
                    </div> <!-- paging div -->
                    
                    
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
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
</body>

</html>