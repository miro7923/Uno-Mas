<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="ko">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order.css?after22">

<!-- Header end -->
<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

<!-- Faq Section Begin -->
    <div class="faq-section spad">
    
    <jsp:include page="../inc/board_sub_menu.jsp"></jsp:include>
    
        <div class="container">
            <div class="row">
            
                <div class="col-lg-12">
                
                    <div class="faq-accordin">
                        
                        <div class="page_aticle">
    			<div class="head_aticle">
                    <h2 class="tit">1:1 문의<span class="tit_sub"></span></h2>
                </div>
    
    <input type="button" value="글쓰기" onclick="location.href='/board/inquiry_form';">
    
    
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
	function deleteAction(data) {
		if(confirm("삭제하시겠습니까?") == true){
			location.href='/board/qna_delete?qna_num='+data;
		}
	}
</script>

        <form name="frmList" id="form" method="get" action="?">
            <div class="page_section">
                
                
                <div class="xans-element- xans-myshop xans-myshop-couponserial ">
                	
                    <table width="100%" class="xans-board-listheader">
                        <tbody>
                            <tr>
                                <th width="520px;" style="padding-left: 300px;" class="input_txt">제목</th>
                                <th width="100px;" class="input_txt">작성일</th>
                                <th width="100px;" class="input_txt">답변상태</th>
                                <th width="100px;" class="input_txt">삭제</th>
                            </tr>
                        </tbody>
                    </table> <!-- table header -->
                                <c:forEach items="${pList }" var="vo">
                                
                    
                        <div>
                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_7">
                                <tbody>
    
                                    <tr>
                                        <td class="td_subject">${vo.qna_title }</td>
                        <td class="td_regdate">${vo.qna_regdate }</td>
                        <c:choose>
                        <c:when test="${vo.qna_process eq '0' }">
                        	<td class="td_answerstatus">답변대기</td> <!-- 답변대기 컬러 #999999 답변완료 컬러 #5f0080; !-->
                        </c:when>
                        <c:otherwise>
                        	<td class="td_answerstatus"><a href="/board/inquiry_comment?qna_num=${vo.qna_num }" style="color: red;">답변완료</a></td> <!-- 답변대기 컬러 #999999 답변완료 컬러 #5f0080; !-->                        	
                        </c:otherwise>
                        </c:choose>
                        <td><input type="button" value="삭제" onclick="deleteAction(${vo.qna_num})"></td>
                                    </tr>
                                </tbody>
                            </table> 
                                
                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                            
                            
                            <table cellpadding="0" cellspacing="0" border="0">
                                    <tbody>
                                        <tr valign="top">
                                            <th style="color:#0000bf;width:40px; padding-top:1px;"></th>
                                            <td><span class="px-3">1차 카테고리 ${vo.qnaCateVO.qnacate_name }</span>
			            <span> > </span><br>
			            <span> 2차 카테고리 ${vo.qnacate2 }</span>
			            <div class="question mt-3 pb-5 px-3">
<%-- 			            <img src="${path}/resources/img/question.svg" class="questionicon">  --%>
			            이미지1 <a href="/board/image1Down?qna_image1=${vo.qna_image1 }"><img name="qna_image1" alt="img1" src="/resources/upload/images/board/qna/${vo.qna_image1 }"></a><input type="hidden" value="${vo.qna_image1 }" name="qna_image1"><br>
			            이미지2 <a href="/board/image2Down?qna_image2=${vo.qna_image2 }"><img name="qna_image2" alt="img2" src="/resources/upload/images/board/qna/${vo.qna_image2 }"></a><input type="hidden" value="${vo.qna_image2 }" name="qna_image2">
			            <span> 문의 내용 ${vo.qna_content }</span>
			        </div>
			        <div class="answer pb-5 px-3" >
<%-- 			            <img src="${path}/resources/img/answer.svg" class="answericon">  --%>
			        </div>
                                            <br>
                                            
                                            
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
                    <a class="page-link text-dark" href='<c:url value="/board/inquiry_paging${pagingVO.makeQuery(pagingVO.startPage-1) }"/>' aria-label="Previous">
                      <span aria-hidden="true">&lt;</span>
                    </a>
                  </li>
                  <c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="pageNum">
                  <li class="page-item"><a class="page-link text-dark" href='<c:url value="/board/inquiry_paging${pagingVO.makeQuery(pageNum) }"/>'>${pageNum }</a></li>
                  </c:forEach>
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/board/inquiry_paging${pagingVO.makeQuery(pagingVO.endPage+1) }"/>' aria-label="Next">
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
	<script src="${path}/resources/js/complete.js"></script>
	<script src="${path}/resources/js/inquiry_list.js"></script>


</body>
</html>