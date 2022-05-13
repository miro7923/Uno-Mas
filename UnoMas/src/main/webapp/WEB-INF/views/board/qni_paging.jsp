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
    	<option value="/faq_paging">공지사항</option>
    	<option value="/qni_paging">자주하는 질문</option>
    	<option value="/inquiry_paging">1:1 문의</option>
    </select>
    <script type="text/javascript">
    	function select_location() {
    		var val = document.getElementById('select_location');
    		var val_loc = val.options[val.selectedIndex].value;
    		location.href = val_loc;
    	}
    </script>
    
    <input type="button" value="글쓰기" onclick="location.href='/qni_write';">
    <select id="search_type" name="search_type">
    	<option value="">검색조건</option>
    	<option value="title">제목</option>
    	<option value="cate">카테고리</option>
    	<option value="content">내용</option>
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


        <form name="frmList" id="form" method="get" action="?">
            <div class="page_section">
                
                <div class="search_date">
                    <select class="btn_layer" id="qni_category" >
                       			<option>카테고리 선택</option>
                       			<option value="배송/포장">배송/포장</option>
                            	<option value="취소/교환/환불">취소/교환/환불</option>
                            	<option value="이벤트/적립금">이벤트/적립금</option>
                            	<option value="상품">상품</option>
                            	<option value="주문/결제">주문/결제</option>
                            	<option value="회원">회원</option>
                            	<option value="서비스 이용">서비스 이용</option>
                    </select>
                </div><!-- seach_date -->
                
                
                <div class="xans-element- xans-myshop xans-myshop-couponserial ">
                    <table width="100%" class="xans-board-listheader">
                        <tbody>
                            <tr>
                                <th width="70" class="input_txt">번호</th>
                                <th width="135" class="input_txt">카테고리</th>
                                <th class="input_txt">제목</th>
                            </tr>
                        </tbody>
                    </table> <!-- table header -->
                                <c:forEach items="${pList }" var="vo">
                               
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
                                            ${fn:replace(vo.faq_content,cn,br)}<br>
                                            <input type="button" value="수정하기" onclick="location.href='/qni_update?faq_num=${vo.faq_num}'">
                                            <input type="button" value="삭제하기" onclick="location.href='/qni_delete?faq_num=${vo.faq_num}'">
                                            
                                            </td>
                                        </tr>
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div> <!-- table body -->

                                </c:forEach>
                                
                    <div style="padding:1px; border-top:1px solid #e6e6e6"></div>
                    
                    <div class="layout-pagination">
                        <div class="pagediv">
                        <div class="row justify-content-center">
              <div class="col-1 justify-content-center ">
                <ul class="pagination">
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/qni_paging${pagingVO.makeQuery(pagingVO.startPage-1) }"/>' aria-label="Previous">
                      <span aria-hidden="true">&lt;</span>
                    </a>
                  </li>
                  <c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="pageNum">
                  <li class="page-item"><a class="page-link text-dark" href='<c:url value="/qni_paging${pagingVO.makeQuery(pageNum) }"/>'>${pageNum }</a></li>
                  </c:forEach>
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/qni_paging${pagingVO.makeQuery(pagingVO.endPage+1) }"/>' aria-label="Next">
                      <span aria-hidden="true">&gt;</span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
                    </div> <!-- paging div -->
                    
                    <table class="xans-board-search xans-board-search2">
                        <tbody>
                            <tr>
                                <td>
                                
                                <select id="search_type" name="search_type">
    	<option value="">검색조건</option>
    	<option value="title">제목</option>
    	<option value="cate">카테고리</option>
    	<option value="content">내용</option>
    </select>
    <input type="text" id="keyword" name="keyword" value="" placeholder="검색어 입력">
<%--     <button onclick="location.href='/qni_paging?page=1&perPageNum=${pList.perPageNum}&search_type=$search_type.val()&keyword=encodeURIComponent($keyword.val())'">검색</button> --%>
    <button id="search_btn" onclick="search()">검색</button>
                                
                                </td>
                                
                            </tr>
                        </tbody>
                    </table><!-- 검색 table -->
                </div><!-- paging 검색 div -->

            </div> <!-- table total div -->
            </div><!-- page section div -->
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
    
    <script type="text/javascript">
		$(document).ready(function() {
			$("#qni_category").change(function() {
// 				alert($(this).val());
				var changeVal = $(this).val();
				location.href="/qni_sort${pagingVO.makeQuery(pageNum) }&faq_cate="+changeVal;
			});
		});
	</script>
    
</body>

</html>