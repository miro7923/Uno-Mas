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
    
    
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
<tbody><tr>
<td>
<table width="100%">
<tbody><tr>
<td>
<table class="boardView" width="100%">
<tbody>
<!-- <tr> -->
<!-- <th scope="row" style="border:none;">제목</th> -->
<!-- </tr> -->
<tr>
<th scope="row">작성자</th>
<td>${vo.adminVO.admin_id }<input type="hidden" name="admin_num" value="${vo.admin_num }"></td>
</tr>
<!-- <tr> -->
<!-- <th scope="row">첨부파일</th> -->
<%-- <td><a class="nfile" href="/board/nFileDown?notice_file=${vo.notice_file }">${vo.notice_file }</a><input type="hidden" name="notice_file" value="${vo.notice_file }"></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- <th scope="row">이미지</th> -->
<%-- <td><img alt="" src="${path }/resources/upload/images/board/notice/${vo.notice_img }"><input type="hidden" name="notice_img" value="${vo.notice_img }"></td> --%>
<!-- </tr> -->
<tr class="etcArea">
<td colspan="2">
<ul>
<li class="date ">
<strong class="th">작성일</strong> <span class="td">${vo.qnacom_regdate }</span>
</li>
<li class="hit ">
<%-- <strong class="th">조회수</strong> <span class="td">${vo.notice_readcnt }</span><input type="hidden" name=""> --%>
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
<td>${fn:replace(vo.qnacom_content,cn,br)}
<input type="hidden" name="notice_content" value="${fn:replace(vo.qnacom_content,cn,br)}">
</td>
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
<a href="/admin/qna_board"><span class="bhs_button yb" style="float:none;">목록</span></a>
</td>
<td align="right">
<%-- <a href="/admin/notice_update?notice_num=${vo.notice_num }"><span class="bhs_button yb" style="float:none;">수정</span></a> --%>
</td>
<td align="right">
<%-- <a href="/admin/notice_delete?notice_num=${vo.notice_num }"><span class="bhs_button yb" style="float:none;">삭제</span></a> --%>
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
        
        
<!--  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

  <jsp:include page="../inc/adminFooter.jsp"></jsp:include>