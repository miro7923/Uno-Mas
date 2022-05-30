<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/admin_css/allUser.css">
<link rel="stylesheet" href="${path}/resources/css/product_css/productAdmin.css?after3">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$(".selectDel-button").click(function(){
			var check = confirm("선택한 상품을 삭제하시겠습니까?");
			
			if(check) {
				var checkArr = new Array();
				
				$("input[class='chBox']:checked").each(function(){
					checkArr.push($(this).attr("prod_num"));
					console.log(checkArr);
				});
				
				$.ajax({
					type : "POST",
					url : "${contextPath}/product/delete",
					data : {chbox : checkArr},
					success : function(){
						location.href = "/product/product_lookup";
					}, error : function(){
						alert("상품삭제 에러");
					}
				})
			}
		});
		

	document.getElementById("searchBtn").onclick = function() {
		var searchType = document.getElementsByName("searchType")[0].value;
		var keyword = document.getElementsByName("keyword")[0].value;
		
		console.log(searchType);
		console.log(keyword);
		location.href = "/product/product_lookup?page=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
	
	});
</script>

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

				<!-- 상품조회-->
				<div class="col-lg-9">
					<div class="container">
						<div class="allUser_container">
							<h3>상품조회</h3>
							<div class="line">
								<hr>
							</div>
							<br>
							<div class="row">
								<div class="col-lg-3"
									style="padding-right: 0px; border-right: none;">
									<select class="selectBox" name="searchType">
										<option value="prod_name"
											<c:if test="${pm.searchType == 'prod_name' }">selected</c:if>>상품명</option>
										<option value="prod_num"
											<c:if test="${pm.searchType == 'prod_num' }">selected</c:if>>품번</option>
									</select>
								</div>
								<div class="col-lg-9" style="padding-left: 0px;">
									<div class="input-search">
										<input type="text" name="keyword" value="${pm.keyword }"
											placeholder="검색어를 입력해주세요.">
										<button type="button" id="searchBtn">
											<i class="ti-search"></i>
										</button>
									</div>
								</div>
								<div class="col-lg-12">
									<label></label>
									<button type="button" class="cancel-button" id="allNonChk">취소</button>
									<button type="button" class="selectDel-button">선택삭제</button>
								</div>
							</div>

							<table class="type09" style="margin-top: 0px;">
								<thead>
									<tr>
										<th><input type="checkbox" id="allCheck"></th>
										<th>품번</th>
										<th>상품명</th>
										<th>판매가</th>
										<th>상태</th>
										<th>조회수</th>
										<th>주문량</th>
										<th>재고</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${productList }">
										<tr>
											<c:choose>
												<c:when test="${vo.prod_stock eq 0 }">
													<td class="cart-pic first-row" style="text-align: center;">
														<input type="checkbox" class="chBox" name="chBox"
														prod_num="${vo.prod_num }">
													</td>
													<td class="normal-row"><span class="sold">${vo.prod_num }</span></td>
													<td class="normal-row"><span class="sold"> <a
															href="/product/status?prod_num=${vo.prod_num }"><span
																class="sold">${vo.prod_name }</span></a></td>
													<td class="normal-row"><span class="sold">${vo.prod_price }</span></td>
													<td class="normal-row"><span class="sold">품절</span></td>
													<td class="normal-row"><span class="sold">${vo.prod_readcnt }</span></td>
													<td class="normal-row"><span class="sold">${vo.prod_sellcnt }</span></td>
													<td class="normal-row"><span class="sold">${vo.prod_stock }</span></td>
												</c:when>
												<c:otherwise>
													<td class="cart-pic first-row" style="text-align: center;">
														<input type="checkbox" class="chBox" name="chBox"
														prod_num="${vo.prod_num }">
													</td>
													<td class="normal-row">${vo.prod_num }</td>
													<td class="normal-row"><a
														href="/product/status?prod_num=${vo.prod_num }"><span
															class="normal">${vo.prod_name }</span></a></td>
													<td class="normal-row">${vo.prod_price }</td>
													<td class="normal-row">정상</td>
													<td class="normal-row">${vo.prod_readcnt }</td>
													<td class="normal-row">${vo.prod_sellcnt }</td>
													<td class="normal-row">${vo.prod_stock }</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- 페이징처리 -->
							<div class="row justify-content-center">
								<div class="col-lg-12" style="text-align: center;">
									<ul class="pagination">
										<c:if test="${pm.prev }">
											<span><a class="page-link text-dark"
												href="/product/product_lookup?page=${pm.startPage - 1}${pm.srchTypeKyw}"
												class="arrow_carrot-left_alt pagingBtn" id="prev">이전</a></span>
										</c:if>

										<c:forEach var="page" begin="${pm.startPage }"
											end="${pm.endPage }">
											<span><a class="page-link text-dark"
												href="/product/product_lookup?page=${page }${pm.srchTypeKyw}"
												class="pagingBtn" style="color: black; font-weight: bold;">${page }
											</a></span>
										</c:forEach>

										<c:if test="${pm.next && pm.endPage > 0 }">
											<span><a class="page-link text-dark"
												href="/product/product_lookup?page=${pm.endPage+1 }${pm.srchTypeKyw}"
												class="arrow_carrot-right_alt pagingBtn" id="next">다음</a></span>
										</c:if>
									</ul>
								</div>
							</div>
							<!-- 페이징처리 -->
						</div>
					</div>
				</div>
				<!-- 상품 조회 끝 -->
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