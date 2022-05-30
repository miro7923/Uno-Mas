<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
  
<!DOCTYPE html>
<html>
  <jsp:include page="../inc/adminHeader.jsp"></jsp:include>
        
<!--  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
        
        
      <div class="container">
            <div class="row">
            
                <div class="col-lg-12">
                
                    <div class="faq-accordin">
                        
                        <div class="page_aticle">
    <div class="head_aticle">
                    <h2 class="tit">1:1 문의<span class="tit_sub"></span></h2>
                </div>
    
   

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
                        <c:when test="${vo.qna_process eq '0'}">
                        <td class="td_answerstatus"><a href="/admin/qna_comment?qna_num=${vo.qna_num }">답변대기</a> </td> <!-- 답변대기 컬러 #999999 답변완료 컬러 #5f0080; !-->
                        </c:when>
                        <c:otherwise>
                        <td class="td_answerstatus"><a href="/admin/qna_commentView?qna_num=${vo.qna_num }">답변완료</a> </td> <!-- 답변대기 컬러 #999999 답변완료 컬러 #5f0080; !-->
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
			            이미지1 <a href="/admin/image1Down?qna_image1=${vo.qna_image1 }"><img name="qna_image1" alt="img1" src="/resources/upload/images/board/qna/${vo.qna_image1 }"></a><input type="hidden" value="${vo.qna_image1 }" name="qna_image1"><br>
			            이미지2 <a href="/admin/image2Down?qna_image2=${vo.qna_image2 }"><img name="qna_image2" alt="img2" src="/resources/upload/images/board/qna/${vo.qna_image2 }"></a><input type="hidden" value="${vo.qna_image2 }" name="qna_image2">
			            <span> 문의 내용 ${vo.qna_content }</span>
			        </div><br>
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
                <c:if test="${pagingVO.prev }">
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/admin/qna_board${pagingVO.makeQuery(pagingVO.startPage-1) }"/>' aria-label="Previous">
                      <span aria-hidden="true">&lt;</span>
                    </a>
                  </li>
                  </c:if>
                  <c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="pageNum">
                  <li class="page-item"><a class="page-link text-dark" href='<c:url value="/admin/qna_board${pagingVO.makeQuery(pageNum) }"/>'>${pageNum }</a></li>
                  </c:forEach>
                  <c:if test="${pagingVO.next }">
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/admin/qna_board${pagingVO.makeQuery(pagingVO.endPage+1) }"/>' aria-label="Next">
                      <span aria-hidden="true">&gt;</span>
                    </a>
                  </li>
                  </c:if>
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
        
        <jsp:include page="../inc/adminScript.jsp"></jsp:include>
<!--  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

  <jsp:include page="../inc/adminFooter.jsp"></jsp:include>