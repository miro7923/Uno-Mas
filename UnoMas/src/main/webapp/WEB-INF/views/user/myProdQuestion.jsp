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
<link rel="stylesheet" href="${path}/resources/css/user_css/myProdQuestion.css">
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
			<h3>상품 문의 내역</h3>

			<div class="point_list_box">
			  <c:choose> 
			    <c:when test="${empty pqnaList }">
			    	<div class="null_text">상품 문의 내역이 없습니다.</div>
			    </c:when>
			    <c:otherwise>
				    <c:forEach var="vo" items="${pqnaList }" varStatus="it">
				    <fmt:formatDate var="regdate" value="${vo.p_inquiry_regdate}" pattern="yyyy-MM-dd"/>
				    <fmt:formatDate var="com_regdate" value="${vo.prod_comment.com_regdate}" pattern="yyyy-MM-dd"/>
					<table class="point_table">
						<tr>
							<th scope="col">번호</th>
							<td>${vo.p_inquiry_num }</td>
							
							<th scope="col">아이디</th>
							<td>${saveID }</td>
						
							<th scope="col">등록일</th>
							<td>${regdate }</td>
							
							<th scope="col">상태</th>
							<c:choose>
								<c:when test="${vo.p_inquiry_process eq false }">
									<td style="color: red">답변 대기</td>
								</c:when>
								<c:otherwise>
									<td style="color: blue">답변 완료</td>
								</c:otherwise>
							</c:choose>


							<td style="width: 180px;">
								<a href="/UnoMas/product/modify_inquiry?inquiry_num=${vo.p_inquiry_num }&pageInfo=my&pagingNum=${pagingNum}">
								  <input type="button" value="수정하기" class="review_btn" style="border-color: #B9CE45;">
								</a>
								<a href="/UnoMas/product/remove_inquiry?inquiry_num=${vo.p_inquiry_num }&pageInfo=my&pagingNum=${pagingNum}&prod_num=${vo.prod_num}">
								  <input type="button" value="삭제하기" onclick="" class="review_btn" style="border-color: red;">
								</a>
							</td>
						</tr>
						
						<th colspan="2">상품명</th>
						<td colspan="9" style="text-align: left; padding-left: 20px">${vo.prod_name }</td>
						
						<tr>
							<td colspan="11" class="content_tr">
								<p>${vo.p_inquiry_title }</p>
								${vo.p_inquiry_content }
							</td>
						</tr>
						
						<c:if test="${vo.prod_comment ne null}">
						  <tr class="comment_tr">
							<th rowspan="2">답<br><br>변</th>
							<td colspan="9">${vo.prod_comment.com_content }
								<div>관리자 | ${com_regdate }</div>
							</td>
						  </tr>
						</c:if>
					</table>	
				  </c:forEach>

					<div class="paging_container">
						<c:if test="${pm.prev }">
							<a href="my_prod_qa?pagingNum=${pm.startPage - 1}"
								class="paging_a">이전</a>
						</c:if>
		
						<c:forEach var="block" varStatus="pg" begin="${pm.startPage }"
							end="${pm.endPage }" step="1">
							<c:choose>
								<c:when test="${pg.index == pagingNum }">
									<a href="my_prod_qa?pagingNum=${pg.index }"
										class="paging_num_yes">${pg.index }</a>
								</c:when>
								<c:otherwise>
									<a href="my_prod_qa?pagingNum=${pg.index }" class="paging_num">${pg.index }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
		
						<c:if test="${pm.next }">
							<a href="my_prod_qa?pagingNum=${pm.endPage + 1}"
								class="paging_a">다음</a>
						</c:if>
					</div>
				</c:otherwise>
			  </c:choose>
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