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
.boardView {
    table-layout: fixed;
    border-top: 2px solid #333;
    border-bottom: 1px solid #f4f4f4;
    color: #333;
    line-height: 180%;
    margin-top: 20px
}

.boardView th {
    width: 130px;
    padding: 13px 0 13px 20px;
    background-color: #f7f5f8;
    border-top: 1px solid #f4f4f4;
    text-align: left
}

.boardView td {
    width: auto;
    padding: 13px 0 13px 23px;
    border-top: 1px solid #f4f4f4
}

.boardView tr.etcArea td {
    padding: 0;
    border: 0
}

.boardView tr.etcArea ul {
    position: relative;
    z-index: 1;
    overflow: hidden;
    width: 100%;
    border-top: 1px solid #f4f4f4
}

.boardView tr.etcArea ul li {
    float: left
}

.boardView tr.etcArea ul .th {
    float: left;
    padding: 13px 0 13px 20px;
    width: 130px;
    background-color: #f7f5f8
}

.boardView tr.etcArea ul .td {
    float: left;
    padding: 13px 0 13px 20px;
    width: 180px
}
.bhs_button.yb:hover {
    background-color: #5f0080;
    color: #fff
}
.bhs_button.yb {
    background-color: #795b8f;
    color: #fff
}
.bhs_button {
    width: 150px;
    display: inline-block;
    line-height: 40px;
    text-align: center;
    background-color: #795b8f;
    border: 1px solid #5f0080;
    color: #fff;
    font-size: 15px;
    float: right;
    margin-left: 2px;
    font-size: 13px
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
    	<option value="/faq">공지사항</option>
    	<option value="/qni">자주하는 질문</option>
    	<option value="/faq">1:1 문의</option>
    </select>
    <script type="text/javascript">
    	function select_location() {
    		var val = document.getElementById('select_location');
    		var val_loc = val.options[val.selectedIndex].value;
    		location.href = val_loc;
    	}
    </script>
    
    
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
<tbody><tr>
<td>
<table width="100%">
<tbody><tr>
<td>
<table class="boardView" width="100%">
<tbody><tr>
<th scope="row" style="border:none;">제목</th>
<td>${vo.notice_title }</td>
</tr>
<tr>
<th scope="row">작성자</th>
<td>${vo.admin_num }</td>
</tr>
<tr class="etcArea">
<td colspan="2">
<ul>
<li class="date ">
<strong class="th">작성일</strong> <span class="td">${vo.notice_regdate }</span>
</li>
<li class="hit ">
<strong class="th">조회수</strong> <span class="td">${vo.notice_readcount }</span>
</li>
</ul>
</td>
</tr>
</tbody></table>
</td>
</tr>
<tr>
<td align="right" class="eng" style="padding:5px;">
</td>
</tr>
<tr>
<td style="padding:10px;" height="200" valign="top" id="contents">
<table width="100%" style="table-layout:fixed">
<tbody><tr>
<td>${fn:replace(vo.notice_content,cn,br)}</td>
</tr>
</tbody></table>
</td>
</tr>
<tr><td height="1" bgcolor="#f4f4f4"></td></tr>
</tbody></table><br>
<table width="100%" style="table-layout:fixed" cellpadding="0" cellspacing="0">
<tbody><tr>
<td align="center" style="padding-top:10px;">
<table width="100%">
<tbody><tr>
<td align="right">
<a href="/faq"><span class="bhs_button yb" style="float:none;">목록</span></a>
</td>
<td align="right">
<a href="/faq"><span class="bhs_button yb" style="float:none;">수정</span></a>
</td>
<td align="right">
<a href="/faq"><span class="bhs_button yb" style="float:none;">삭제</span></a>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
<!-- <div class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 "><ul>
<li class="prev ">
<strong>이전글</strong><a href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="></a><a href="view.php?id=notice&amp;no=930">[가격인상공지] [아베나] 니트릴 장갑 다목적용 XS 외 3건 (2021 5. 21 ~)</a>
</li>
<li class="next ">
<strong>다음글</strong><a href="/board/free/read.html?no=22443&amp;board_no=1&amp;page="></a><a href="view.php?id=notice&amp;no=932">[가격인상공지] [카구라노사토] 유즈코쇼 (2021 6. 22 ~)</a>
</li>
</ul>
</div> -->
<br><table width="100%" cellpadding="5" cellspacing="0">
<colgroup><col width="100" align="right" bgcolor="#f7f7f7" style="padding-right:10px">
<col style="padding-left:10px">
</colgroup></table><p>

</p></td></tr></tbody></table>
    
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