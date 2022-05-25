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
        <h2 class="tit">1:1문의 답변<span class="tit_sub"></span></h2>
    </div>
    
    
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
<tbody><tr>
<td>
<table width="100%">
<tbody><tr>
<td>
<table class="boardView" width="100%">
<tbody>

<tr>
<th scope="row">작성자</th>
<td>${commentList.adminVO.admin_id }<input type="hidden" name="admin_num" value=""></td>
</tr>
<tr>

<tr class="etcArea">
<td colspan="2">
<ul>
<li class="date ">
<strong class="th">작성일</strong> <span class="td">${commentList.qnacom_regdate }</span>
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
<td>${fn:replace(commentList.qnacom_content,cn,br)}
<input type="hidden" name="notice_content" value="${fn:replace(commentList.qnacom_content,cn,br)}">
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
<a href="/board/inquiry_paging"><span class="bhs_button yb" style="float:none;">목록</span></a>
</td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>

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
    <script src="${path}/resources/js/board_js/boardMain.js"></script>
    <script src="${path}/resources/js/board_js/boardSearch.js"></script>
</body>

</html>