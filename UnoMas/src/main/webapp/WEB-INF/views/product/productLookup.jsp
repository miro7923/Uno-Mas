<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
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
    <jsp:include page="../inc/header.jsp"></jsp:include>
    <!-- Header End -->
    
    <!-- Product Register Section End -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">

				<!-- 상품관리 카테고리 -->
				<div
					class="col-lg-2 produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">상품관리</h4>
						<ul class="filter-catagories">
<!-- 							<li><a href="product_lookup">상품조회</a></li> -->
							<li><a href="product_lookup">상품조회</a></li>
							<li><a href="product_register">상품등록</a></li>
						</ul>
					</div>
				</div>
				
				<!-- 상품관리 카테고리 끝-->
				<div class="col-lg-10">
					<h2>상품조회</h2>
					<div class="line"><hr></div>
					<div class="container">

							<form action="#" class="checkout-form">
								<!-- 기본정보 -->
								<div class="row">
									<div class="col-lg-12">
										<br>
										<div class="row">
												<div class="col-lg-3">
													<select class="selectBox" name="searchType">
													<option value="prod_name" <c:if test="${pm.searchType == 'prod_name' }">selected</c:if>>상품명</option>
													<option value="prod_num" <c:if test="${pm.searchType == 'prod_num' }">selected</c:if>>품번</option>
												</select>
												</div>
												<div class="col-lg-9">
													<div class="input-search">
														<input type="text" name="keyword" value="${pm.keyword }"placeholder="검색어를 입력해주세요.">
														<button type="button" id="searchBtn"><i class="ti-search"></i></button>
													</div>
												</div>
											<div class="col-lg-12">
											<label></label>
		                                        <button type="button" class="cancel-button" >취소</button>
		                                        <button type="button" class="selectDel-button" >선택삭제</button>
		                                     </div>
		                                     <div class="col-lg-12">
												<div class="cart-table">
													<table>
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
																			<td class="cart-pic first-row">
																				<input type="checkbox" class="chBox" name="chBox" prod_num="${vo.prod_num }">
																			<td class="normal-row"><span class="sold">${vo.prod_num }</span></td>
																			<td class="normal-row"><a href="/product/status?prod_num=${vo.prod_num }&page=${pc.page}&perPageNum=${pc.perPageNum }"><span class="sold">${vo.prod_name }</span></a></td>
																			<td class="normal-row"><span class="sold">${vo.prod_price }</span></td>
																			<td class="normal-row"><span class="sold">품절</span></td>
																			<td class="normal-row"><span class="sold">${vo.prod_readcnt }</span></td> <!-- 조회수 -->
																			<td class="normal-row"><span class="sold">-</span></td> <!-- 주문량 -->
																			<td class="normal-row"><span class="sold">${vo.prod_stock }</span></td>
																		</c:when>
																		<c:otherwise>
																			<td class="cart-pic first-row">
																				<input type="checkbox" class="chBox" name="chBox" prod_num="${vo.prod_num }">
																			</td>
																			<td class="normal-row">${vo.prod_num }</td>
																			<td class="normal-row"><a href="/product/status?prod_num=${vo.prod_num }">${vo.prod_name }</a></td>
																			<td class="normal-row">${vo.prod_price }</td>
																			<td class="normal-row">정상</td>
																			<td class="normal-row">${vo.prod_readcnt }</td> <!-- 조회수 -->
																			<td class="normal-row">-</td> <!-- 주문량 -->
																			<td class="normal-row">${vo.prod_stock }</td>
																		</c:otherwise>
																		
																	</c:choose>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<!-- 페이징처리 -->
												<div class="row" id="pagediv">
													<div class="col-lg-12 text-center">
<!-- 													<ul class="pagination pagination-sm no-margin"> -->
														<c:if test="${pm.prev }">
															<span><a href="/product/product_lookup?page=${pm.startPage - 1}${pm.srchTypeKyw}" class="arrow_carrot-left_alt pagingBtn" id="prev">이전</a></span>
														</c:if>
														
														<c:forEach var="page" begin="${pm.startPage }" end="${pm.endPage }">
<%-- 															<span><a href="/product/product_lookup?page=${page }${pm.srchTypeKyw}" class="pagingBtn" style="color: black; font-weight: bold;"  >${page } </a></span> --%>
															<span><a href="/product/product_lookup?page=${page }&searchType=${pm.searchType}&keyword=${pm.keyword}" class="pagingBtn" style="color: black; font-weight: bold;"  >${page } </a></span>
														</c:forEach>
														
														<c:if test="${pm.next && pm.endPage > 0 }">
															<span><a href="/product/product_lookup?page=${pm.endPage+1 }${pm.srchTypeKyw}" class="arrow_carrot-right_alt pagingBtn" id="next">다음</a></span>
														</c:if>
<!-- 													</ul> -->
												</div>
												</div>
												<!-- 페이징처리 -->
											</div>
										</div>
									</div>
								</div>
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