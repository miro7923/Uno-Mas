<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/user_css/myReview.css">
<link rel="stylesheet" href="${path}/resources/css/user_css/pagingCommon.css">
<title>나의 리뷰</title>
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/header.jsp"></jsp:include>
	
  <div class="myReview_container">
	<jsp:include page="myPageLeftBar.jsp"></jsp:include>
	
	<div class="point_right_container">	
	
        <div class="review_container">
			<h3>나의 리뷰</h3>

			<div class="point_list_box">
			  <c:forEach var="vo" items="${reviewList }" varStatus="it">
			    <fmt:formatDate var="regdate" value="${vo.review_regdate}" pattern="yyyy-MM-dd"/>
				<table class="point_table">
					<tr>
<!-- 						<th scope="col">번호</th> -->
						<td>${vo.review_num }</td>
					
						<th scope="col">아이디</th>
						<td>user1</td>
					
						<th scope="col">평점</th>
						<td>${vo.review_rating }</td>
					
						<th scope="col">등록일</th>
						<td>${regdate }</td>
					
						<th scope="col">조회수</th>
						<td>${vo.review_readcnt }</td>
					
						<td style="width: 180px;">
							<a href="/UnoMas/product/modify_review?review_num=${vo.review_num }&pageInfo=pReview&pagingNum=${pagingNum}">
							  <input type="button" value="수정하기" class="review_btn" style="border-color: #B9CE45;">
							</a>
							<a href="/UnoMas/product/remove_review?pageInfo=pReview&review_num=${vo.review_num }&prod_num=${vo.prod_num}&pagingNum=${pagingNum}">
							  <input type="button" value="삭제하기" onclick="" class="review_btn" style="border-color: red;">
							</a>
						</td>
					</tr>
					
					<tr>
					  <th colspan="2">상품명</th>
					  <td colspan="8" style="text-align: left; padding-left: 20px">${vo.prod_name }</td>
					</tr>
					
					<tr>
					  <c:choose>
					    <c:when test="${empty vo.review_image }">
					      <td colspan=10" class="content_tr">
							  <p>${vo.review_title }</p>
							  ${vo.review_content }
						  </td>
					    </c:when>
					    <c:otherwise>
					      <td colspan="3">
						    <img src='<spring:url value="/resources/upload/images/board/review/${vo.review_image }"></spring:url>' class="review_img">
						  </td>
						  <td colspan="8" class="content_tr">
							  <p>${vo.review_title }</p>
							  ${vo.review_content }
						  </td>
					    </c:otherwise>
					  </c:choose>
					</tr>
				</table>	
			  </c:forEach>
			</div>

			<div class="paging_container">
				<c:if test="${pm.prev }">
					<a href="my_review?pagingNum=${pm.startPage - 1}" class="paging_a">이전</a>
				</c:if>

				<c:forEach var="block" varStatus="pg" begin="${pm.startPage }" end="${pm.endPage }" step="1">
					<c:choose>
						<c:when test="${pg.index == pagingNum }">
							<a href="my_review?pagingNum=${pg.index }" class="paging_num_yes">${pg.index }</a>
						</c:when>
						<c:otherwise>
							<a href="my_review?pagingNum=${pg.index }" class="paging_num">${pg.index }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${pm.next }">
					<a href="my_review?pagingNum=${pm.endPage + 1}" class="paging_a">다음</a>
				</c:if>
			</div>

			</div>
		</div>
      	<!-- 리뷰 페이지 끝 -->
      
      
      

      
      
    </div>

	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	
	<!-- js -->
	<script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
  	<script src="${path}/resources/js/main.js"></script> 
</body>
</html>