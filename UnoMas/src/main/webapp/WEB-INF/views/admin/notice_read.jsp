<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<jsp:include page="../inc/top.jsp"></jsp:include>
<%-- <link rel="stylesheet" href="${path}/resources/css/product_css/productAdmin.css?after3"> --%>
<link rel="stylesheet" href="${path}/resources/css/user_css/updateMyInfo.css">
<link rel="stylesheet" href="${path}/resources/css/admin_css/admin.css?after1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#del-button").click(function(){
			var result = confirm("선택한 글을 삭제하시겠습니까?");
			if(!result){
				return false;
			};
		});
	});
</script>

<%
	pageContext.setAttribute("br", " ");
	pageContext.setAttribute("cn", "\n");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UnoMas 관리자페이지</title>
</head>
<!-- Start Header -->

<body>
    <!-- Header Section Begin -->
    <jsp:include page="../inc/adminHeader2.jsp"></jsp:include>
    <!-- Header End -->
    
    <!-- Product Register Section End -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">

				<!-- 관리자 카테고리 -->
				<div class="col-lg-3 produts-sidebar-filter">
					<div class="filter-widget">
				 		<jsp:include page="../inc/adminLeftBar.jsp"></jsp:include>
					</div>
				</div>
				
				<div class="col-lg-9">
					<h2>공지사항</h2>
					- ${vo.notice_num }번 글
					<div class="line"><hr></div>
					<div class="container">
						<form action="#" class="checkout-form"><br>
<%-- 						<form action="/admin/notice_delete?notice_num=${vo.notice_num }" class="checkout-form"><br> --%>
							<table class="table_board" style="margin-bottom: 60px; height: 330px;">

					<tr>
						<th>제목</th>
						<td colspan="3">${vo.notice_title }<input type="hidden" class="table_board" name="notice_title" value="${vo.notice_title }"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td colspan="3">UnoMás</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><a class="nfile" href="/board/nFileDown?notice_file=${vo.notice_file }">${vo.notice_file }</a><input type="hidden" name="notice_file" value="${vo.notice_file }"></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th>이미지</th> -->
<%-- 						<td colspan="3"><img alt="" src="${path }/resources/upload/images/board/notice/${vo.notice_img }"><input type="hidden" name="notice_img" value="${vo.notice_img }"></td> --%>
<!-- 					</tr> -->
					<tr>
						<th>작성일</th>
						<td>${vo.notice_regdate }<input type="hidden" class="table_board" name="" value="${vo.notice_regdate }"></td>
						<th>조회수</th>
						<td>${vo.notice_readcnt }<input type="hidden" class="table_board" name="" value="${vo.notice_readcnt }"></td>
					</tr>
				</table>
				<table class="table_board">
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td>
							<c:choose>
								<c:when test="${empty vo.notice_img }">
									<input type="hidden" readonly>
								</c:when>
								<c:otherwise>
                                    <img class="product-big-img" src="<spring:url value='/resources/upload/images/board/notice/${vo.notice_img }'></spring:url>" alt="">
                                </c:otherwise>
                            </c:choose>
						<div class="textarea">
		                    <textarea inputmode="text" name="notice_content" class="textarea-text" placeholder="내용을 입력하세요" readonly>${fn:replace(vo.notice_content,cn,br)}</textarea>
		                </div>
	<%-- 					<textarea>${fn:replace(vo.notice_content,cn,br)}</textarea> --%>
	<%-- 					<input type="hidden" name="notice_content" value="${fn:replace(vo.notice_content,cn,br)}"> --%>
						</td>
						</tr>
				</table>
				<button type="button" class="count-button" onclick="location.href='/admin/notice_update?notice_num=${vo.notice_num }';">수정</button>
				<button type="button" class="del-button" id="del-button" onclick="location.href='/admin/notice_delete?notice_num=${vo.notice_num }';"><span class="delete_text">삭제</span></button>
<!-- 				<button type="submit" class="del-button" id="del-button" ><span class="delete_text">삭제</span></button> -->
				<button type="button" class="back-button" onclick="history.back();">취소</button>
				<br><br>
				</form>
			</div>


			</div>
		</div>
	</div>
</section>

	
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
    <script src="${path}/resources/js/product_js/productAdmin.js"></script>
</body>

</html>