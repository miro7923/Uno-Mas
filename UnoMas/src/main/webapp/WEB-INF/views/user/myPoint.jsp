<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/user_css/myPoint.css">
<title>적립금 확인 페이지</title>
</head>

<body>
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/header.jsp"></jsp:include>
<!--   <div style="height: 80px; border-bottom: 1px solid black; background-color: green">헤더</div> -->
		
  <div class="point_container">
	<jsp:include page="myPageLeftBar.jsp"></jsp:include>
	
	<div class="point_right_container">	
		<div class="point_simple_container">
			<div class="point_hello">${saveID } 님 환영합니다! </div>
				
			<div class="point_simple_box">
				<dl class="point_status_box">
					<dt>사용가능 포인트 <em>${userP }</em> P</dt>
				</dl>
				<dl class="point_status_box">
					<dt>사용 포인트 <em>0</em> P</dt>
				</dl>
				<dl class="point_status_box">
					<dt>소멸 예정 포인트 <em>0</em> P</dt>
					<dd>(30일이내 소멸예정)</dd>
				</dl>
			</div>
		</div>
		
		  
   
		<!-- 포인트 내역 -->
        <div class="point_history">
			<h3>포인트 내역</h3>

			<div class="point_list_box">
				<table class="point_table">
					<colgroup>
						<col style="width: 150px">
						<col style="width: 100px">
						<col style="width: 300px">
						<col style="width: 100px">
						<col style="width: 150px">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">발생일자</th>
							<th scope="col">유형</th>
							<th scope="col">내용</th>
							<th scope="col">포인트</th>
							<th scope="col">유효기간</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="vo" items="${pointList }">
							<tr>
								<td><fmt:formatDate value="${vo.point_regdate}" pattern="yyyy-MM-dd" /></td>
								<td>${vo.point_form }</td>
								<td>상품 구매</td>
								<td><span class="num_plus">${vo.point_cost }</span></td>
								<td><fmt:formatDate value="${vo.point_deadline}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="page_control">
				<div class="paging_container">
					<c:if test="${pm.prev }">
						<a href="mypoint?pagingNum=${pm.startPage - 1}" class="paging_a">이전</a>
					</c:if>
	
					<c:forEach var="block" varStatus="pg" begin="${pm.startPage }" end="${pm.endPage }" step="1">
						<c:choose>
							<c:when test="${pg.index == pagingNum }">
								<a href="mypoint?pagingNum=${pg.index }" class="paging_num_yes">${pg.index }</a>
							</c:when>
							<c:otherwise>
								<a href="mypoint?pagingNum=${pg.index }" class="paging_num">${pg.index }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
	
					<c:if test="${pm.next }">
						<a href="mypoint?pagingNum=${pm.endPage + 1}" class="paging_a">다음</a>
					</c:if>
				</div>
	  		</div>
	  		
	  		
		</div>
      	<!-- 포인트 내역 -->
      
      
      
      	<div class="point_notice">
          <dl>
          	<dt>포인트 이용안내</dt>
          	<dd>포인트는 상품 구매 시 현금처럼 사용할 수 있습니다.</dd>
          	<dd>포인트는 본인만 사용 가능하며 타인에게 양도할 수 없습니다.</dd>
          	<dd>무료 포인트는 환급되지 않으며 탈퇴 시 자동으로 소멸되고 유료 포인트는 환급 받을 수 있습니다.</dd>
          	<dd>사업자(업체) 회원은 유료 포인트 교환권 등록이 불가합니다. 무료 포인트 교환권만 등록해 주세요.</dd>
        	</dl>
      	</div>
      
      
    </div>
</div>

<!-- 	<div style="border-top: 1px solid black; height: 200px; background-color: green; clear:left;"> 푸터 </div> -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/js/main.js"></script>
</body>
</html>