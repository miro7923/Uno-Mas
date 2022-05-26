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
<link rel="stylesheet" href="${path}/resources/css/user_css/myOrderList.css">
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
			  <c:choose> 
			    <c:when test="${false }">
			    	<div class="null_text">상품 문의 내역이 없습니다.</div>
			    </c:when>
			    <c:otherwise>
					<table class="point_table">
						<colgroup>
						  <col style="width: 15%"><col style="width: 55%;"><col style="width: 15%"><col style="width: 15%">
						</colgroup>
						<tr>
						  <td>주문일/주문번호</td><td>상품정보</td><td>상태</td><td>신청</td>
						</tr>
						
						<c:forEach var="vo" items="${orderList }" varStatus="it">
				    	<fmt:formatDate var="regdate" value="${vo.order_date}" pattern="yyyy-MM-dd"/>
							<tbody>
							  <tr>
								<td rowspan="2" class="order_num_td">
									${regdate }<br>
									[ ${vo.order_code } ]<br> 
									<a href="" class="table_btn">주문 상세보기</a>
								</td>
								<td class="order_info_td">
									<img src="https://view01.wemep.co.kr/wmp-product/6/996/2101399966/2101399966_thumbnail.jpg" alt="메이킹유 6801볼트원피스">
									
									<div>
										<a href="https://front.wemakeprice.com/deal/627640468?prodNo=2101399966&amp;allowView=Y"
													target="_blank"> 메이킹유 6801볼트원피스 </a>
										<hr>
										<span>9,900</span> / <span>${vo.order_quantity }개</span>
									</div>
								</td>
								<td rowspan="2">
									<strong>${vo.order_status }</strong><br>
									<a href="" class="table_btn">배송조회</a>
								</td>
								
								<td>
								  <a href="" class="table_btn">반품신청</a><br>
								  <a href="" class="table_btn">교환신청</a>
								</td>
							  </tr>
							</tbody>

						</c:forEach>
					</table>	
				  

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