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
    	<option value="/faq">공지사항</option>
    	<option value="/qni">자주하는 질문</option>
    	<option value="/faq">1:1 문의</option>
    </select>
    
    <input type="button" value="글쓰기" onclick="location.href='/faq_insert';">
    
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
            <c:forEach items="${boardList }" var="vo">
                <tr>
                    <td width="50" nowrap="" align="center">
                        ${vo.notice_num } </td>
                    <td style="padding-left:10px; text-align:left; color:#999">
                        <a href="/faq_detail?notice_num=${vo.notice_num }"><b>${vo.notice_title }</b></a><b>
                        </b>
                    </td>
                    <td width="100" nowrap="" align="center">
                        ${vo.admin_num } </td>
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