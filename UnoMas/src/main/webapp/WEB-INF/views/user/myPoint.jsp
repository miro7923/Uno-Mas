<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="point_hello">김땡땡 님 환영합니다! </div>
				
			<div class="point_simple_box">
				<dl class="point_ststus_box">
					<dt>사용가능 포인트 <em>20</em> P</dt>
				</dl>
				<dl class="point_ststus_box">
					<dt>사용 포인트 <em>20</em> P</dt>
				</dl>
				<dl class="point_ststus_box">
					<dt>소멸 예정 포인트 <em>20</em> P</dt>
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
						<tr>
								<td>2022-04-23</td>
								<td>적립</td>
								<td>4월 출석체크 포인트</td>
								<td><span class="num_plus">10</span></td>
								<td>2022-04-26</td>
						</tr>
						<tr>
								<td>2022-04-22</td>
								<td>적립</td>
								<td>4월 출석체크 포인트</td>
								<td><span class="num_plus">10</span></td>
								<td>2022-04-25</td>
						</tr>
						<tr>
								<td>2022-04-21</td>
								<td>사용</td>
								<td>포인트 사용 – 상품</td>
								<td><span class="num_minus">-20</span></td>
								<td>-</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="page_control">
			<%
				// 이전을 누르면 이전 블럭의 제일 첫 페이지로 이동!
				//if(startPage > pageBlock) {
					%><a href="" class="previous_daum">[이전]</a> <%
				//}
			%>

			<%
				//for(int i=startPage; i<=endPage; i++) {
					%><a>1</a> <%		
				//}
			%>

			<%
				//if(endPage < pageCount) {
					%><a href="" class="previous_daum">[다음]</a> <%
				//}
			%>

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
    <script src="${path}/resources/js/bootstrap.min.js"></script>
    <script src="${path}/resources/js/jquery-ui.min.js"></script>
    <script src="${path}/resources/js/jquery.countdown.min.js"></script>
    <script src="${path}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${path}/resources/js/jquery.zoom.min.js"></script>
    <script src="${path}/resources/js/jquery.dd.min.js"></script>
    <script src="${path}/resources/js/jquery.slicknav.js"></script>
    <script src="${path}/resources/js/owl.carousel.min.js"></script>
    <script src="${path}/resources/js/main.js"></script>
</body>
</html>