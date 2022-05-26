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
<link rel="stylesheet" href="${path}/resources/css/user_css/myQuestion.css">
<link rel="stylesheet" href="${path}/resources/css/user_css/pagingCommon.css">
<title>마이페이지</title>
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/header.jsp"></jsp:include>
	
  <div class="myReview_container">
	<jsp:include page="myPageLeftBar.jsp"></jsp:include>
	
	<div class="point_right_container">	
	
        <div class="review_container">
			<h3>1:1 문의</h3>

			<div class="point_list_box">
			  <c:forEach var="vo" items="${qnaList }" varStatus="it">
			    <fmt:formatDate var="regdate" value="${vo.qna_regdate}" pattern="yyyy-MM-dd"/>
				<table class="point_table">
					<tr>
						<th scope="col">번호</th>
						<td>${vo.qna_num }</td>
						
						<th scope="col">카테고리</th>
						<td>${vo.qnacate_name }</td>
					
						<th scope="col">아이디</th>
						<td>${saveID }</td>
					
						<th scope="col">상태</th>
						<c:choose>
						  <c:when test="${vo.qna_process eq 0 }">
						  	<td style="color: red" >답변 대기</td>
						  </c:when>
						  <c:otherwise>
						  	<td style="color: blue" >답변 완료</td>
						  </c:otherwise>
						</c:choose>
					
						<th scope="col">등록일</th>
						<td>${regdate }</td>
					
					
					
						<td style="width: 180px;">
							<a href="/product/modify_review">
							  <input type="button" value="삭제하기" onclick="" class="review_btn" style="border-color: red;">
							</a>
						</td>
					</tr>
					
					<tr>
					  <c:choose>
					    <c:when test="${empty vo.qna_image1 }">
					      <td colspan=11" class="content_tr">
							  <p>${vo.qna_title }</p>
							  ${vo.qna_content }
						  </td>
					    </c:when>
					    <c:otherwise>
					      <td colspan="3"> 
						    <img src='<spring:url value="/resources/upload/images/board/qna/"></spring:url>' class="review_img">
						  </td>
						  <td colspan="8" class="content_tr">
							  <p>${vo.qna_title }</p>
							  ${vo.qna_content }
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