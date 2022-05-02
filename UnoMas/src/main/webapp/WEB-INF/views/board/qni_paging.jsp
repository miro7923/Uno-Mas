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



 

.table_faq {
    border-top: 1px solid #f4f4f4
}

.table_faq tr td {
    padding: 20px 0
}

table {
    font-family: noto sans, malgun gothic, AppleGothic, dotum;
    line-height: 1;
    letter-spacing: -.05em;
    color: #4c4c4c;
    font-size: 12px;
    max-width: 100%
    border-collapse: collapse;
    border-spacing: 0
}

td,
th {
    padding: 0
}

ol,
ul {
    list-style-type: none
}
.page_aticle.aticle_type2 .page_section {
    float: right;
    width: 820px
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

.search_date {
    position: relative;
    z-index: 1
}

.search_date .btn_layer {
    overflow: hidden;
    position: absolute;
    right: 0;
    top: -74px;
    width: 157px;
    height: 44px;
    padding: 11px 0 0 15px;
    border: 1px solid #ddd;
    font-size: 14px;
    color: #666;
    line-height: 18px;
    letter-spacing: -.5px
}

.search_date .btn_layer:after {
    content: "";
    position: absolute;
    left: 128px;
    top: 18px;
    width: 12px;
    height: 8px;
    background-size: 12px 8px
}

.search_date .btn_layer.on:after {
    transform: rotate(-180deg);
    -webkit-transform: rotate(-180deg);
    -moz-transform: rotate(-180deg);
    -ms-transform: rotate(-180deg);
    -o-transform: rotate(-180deg)
}

.search_date .layer_search {
    display: none;
    position: absolute;
    right: 0;
    top: -30px;
    width: 157px;
    border: 1px solid #dddfe1;
    border-top: 0
}

.search_date .layer_search li {
    background-color: #fff;
    border-top: 1px solid #dddfe1
}

.search_date .layer_search li:first-child {
    border-top: 0
}

.search_date .layer_search a {
    display: block;
    overflow: hidden;
    height: 32px;
    padding: 7px 0 0 8px;
    font-size: 12px;
    color: #666;
    line-height: 18px;
    letter-spacing: -.2px
}

.search_date .layer_search a.on {
    background-color: #f7f7f7
}
.page_aticle .layout-pagination {
    font-size: 0
}

.page_aticle .layout-pagination a:hover {
    background-color: #f7f7f7
}

.page_aticle .layout-pagination a,
.page_aticle .layout-pagination strong {
    font-weight: 700;
    font-size: 12px
}

.page_aticle .layout-pagination a {
    cursor: pointer
}

.page_aticle .layout-pagination-button:first-child {
    border-left: 0
}

.page_aticle .layout-pagination-first-page:first-child {
    border-left: 1px solid #ddd
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
                    <h2 class="tit">자주하는 질문 <span class="tit_sub">고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span></h2>
                </div>

    
    <select id="select_location" onchange="select_location()">
    	<option value="">선택</option>
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
    
    <input type="button" value="글쓰기" onclick="location.href='/qni_write';">
    
    <script>
  var preContent;

  function view_content(obj)
  {
    var div = obj.parentNode;

    for (var i=1, m=div.childNodes.length;i<m;i++) {
      if (div.childNodes[i].nodeType != 1) continue;    // text node.
      else if (obj == div.childNodes[ i ]) continue;

      obj = div.childNodes[ i ];
      break;
    }

    if (preContent && obj!=preContent){
      obj.style.display = "block";
      preContent.style.display = "none";
    }
    else if (preContent && obj==preContent) preContent.style.display = ( preContent.style.display == "none" ? "block" : "none" );
    else if (preContent == null ) obj.style.display = "block";

    preContent = obj;
  }

  { // 초기출력
    var no = "faq_";
    if ( document.getElementById( no ) ) view_content( document.getElementById( no ) );
  }

 
</script>
<script type="text/javascript">
	function changeCate(e){
		var change_cate = e.value;
		location.href='/qni_sort?faq_cate='+change_cate;
	};
</script>


        <form name="frmList" id="form" method="get" action="?">
            <div class="page_section">
                
                <div class="search_date">
                    <select class="btn_layer" id="qni_category" onchange="changeCate(this)">
                       			<option>카테고리를 선택하세요</option>
                       			<option value="배송/포장">배송/포장</option>
                            	<option value="취소/교환/환불">취소/교환/환불</option>
                            	<option value="이벤트/적립금">이벤트/적립금</option>
                            	<option value="상품">상품</option>
                            	<option value="주문/결제">주문/결제</option>
                            	<option value="회원">회원</option>
                            	<option value="서비스 이용">서비스 이용</option>
                    </select>
                </div>
                
                
                <div class="xans-element- xans-myshop xans-myshop-couponserial ">
                    <table width="100%" class="xans-board-listheader">
                        <tbody>
                            <tr>
                                <th width="70" class="input_txt">번호</th>
                                <th width="135" class="input_txt">카테고리</th>
                                <th class="input_txt">제목</th>
                            </tr>
                        </tbody>
                    </table>
                                <c:forEach items="${boardList }" var="vo">
                    <div>
                        <div>
                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_7">
                                <tbody>
    
                                    <tr>
                                        <td width="70" align="center">${vo.faq_num }</td>
                                        <td width="135" align="center">${vo.faq_cate }</td>
                                        <td style="cursor:pointer">${vo.faq_title }</td>
                                    </tr>
                                </tbody>
                            </table>
                                
                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tbody>
                                        <tr valign="top">
                                            <th style="color:#0000bf;width:40px; padding-top:1px;"></th>
                                            <td>
                                            ${vo.faq_content }
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
                        <ul class="btn-group pagination">
    <c:if test="${pagingVO.prev }">
    <li>
        <a href='<c:url value="/board/qni_paging?page=${pagingVO.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
    </li>
    </c:if>
    <c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="pageNum">
    <li>
        <a href='<c:url value="/board/qni_paging?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pagingVO.next && pagingVO.endPage >0 }">
    <li>
        <a href='<c:url value="/board/qni_paging?page=${pagingVO.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
    </li>
    </c:if>
</ul>
<!--                         <a href="" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a> -->
<!--                         <a href="" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a> -->
<!--                         <strong class="layout-pagination-button layout-pagination-number __active">1</strong> -->
<!--                         <a href="" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a> -->
<!--                         <a href="" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a></div> -->
                    </div>
                    <table class="xans-board-search xans-board-search2">
                        <tbody>
                            <tr>
                                <td class="input_txt">&nbsp;</td>
                                
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
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