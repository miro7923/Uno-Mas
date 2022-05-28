<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/order_css/myOrderList.css">
<link rel="stylesheet" href="${path}/resources/css/user_css/pagingCommon.css">
<title>마이페이지</title>
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/header.jsp"></jsp:include>
	
  <div class="myOrderLsit_container">
	<jsp:include page="../user/myPageLeftBar.jsp"></jsp:include>
	
	<div class="point_right_container">	
	
        <div class="review_container">
			<h3>전체 주문 내역</h3>

			<div class="point_list_box">
			  
				<table class="point_table">
					<colgroup>
					  <col style="width: 15%"><col style="width: 55%;"><col style="width: 15%"><col style="width: 15%">
					</colgroup>
					<tr class="table_top_tr">
						<th>주문일/주문번호</th><th>상품정보</th><th>상태</th><th>신청</th>
					</tr>
					
					<tbody>	
					<c:choose> 
						<c:when test="${empty orderMap }">
							<td colspan="4" class="null_text">상품 문의 내역이 없습니다.</td>
						</c:when>
						<c:otherwise>
							<c:forEach var="map" items="${orderMap }" varStatus="it">
							  <fmt:formatDate var="regdate" value="${map.value[0].order_date}" pattern="yyyy-MM-dd" />
								<tr>
									<td rowspan="${fn:length(map.value) }" class="order_num_td">${regdate }<br>
											( ${map.key } )<br> 
											<a href="order_detail" class="table_btn">주문 상세보기</a>
									</td>
									<c:forEach var="val" items="${map.value }" varStatus="itt">
										<td class="order_info_td">
											<img src='<spring:url value="/resources/upload/images/products/top/${val.prod_image1 }"></spring:url>' alt="이미지">
											<div>
												<a href="" target="_blank"> ${val.prod_name } </a>
												<hr>
												<span>${val.prod_price }원</span> / <span>${val.order_quantity }개</span>
											 </div>
										</td>
									</c:forEach>
										
									<td rowspan="${fn:length(map.value) }">
									  <c:choose>
									  	<c:when test="${map.value[0].order_status eq '결제완료'}">
									  		<strong style="color: red;">${map.value[0].order_status }<strong><br>
									  	</c:when>
									  	<c:when test="${map.value[0].order_status eq '배송완료'}">
									  		<strong style="color: blue;">${map.value[0].order_status }<strong><br>
									  	</c:when>
									  	<c:otherwise>
									  		<strong>${map.value[0].order_status }<strong><br>
									  	</c:otherwise>
									  </c:choose>
										
									  <a href="" class="table_btn">배송조회</a>
									</td>
									<td><a href="" class="table_btn">반품신청</a><br> 
										<a href="" class="table_btn">교환신청</a>
									</td>
								</tr>
							</c:forEach>
				  		</c:otherwise>
				  	  </c:choose>
				  	  </tbody>
					</table>
						
					<div class="paging_container">
						<c:if test="${pm.prev }">
							<a href="my_order?pagingNum=${pm.startPage - 1}"
								class="paging_a">이전</a>
						</c:if>
		
						<c:forEach var="block" varStatus="pg" begin="${pm.startPage }"
							end="${pm.endPage }" step="1">
							<c:choose>
								<c:when test="${pg.index == pagingNum }">
									<a href="my_order?pagingNum=${pg.index }"
										class="paging_num_yes">${pg.index }</a>
								</c:when>
								<c:otherwise>
									<a href="my_order?pagingNum=${pg.index }" class="paging_num">${pg.index }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
		
						<c:if test="${pm.next }">
							<a href="my_order?pagingNum=${pm.endPage + 1}"
								class="paging_a">다음</a>
						</c:if>
					</div>
			
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