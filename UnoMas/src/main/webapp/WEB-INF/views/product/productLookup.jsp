<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/productAdmin.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>

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
							<li><a href="product_lookup">상품조회</a></li>
							<li><a href="product_register">상품등록</a></li>
						</ul>
					</div>
				</div>
				
				<!-- 상품관리 카테고리 끝-->
				<div class="col-lg-10">
					<h2>상품조회</h2>
					<hr>
					<div class="container">

							<form action="#" class="checkout-form">
								<!-- 기본정보 -->
								<div class="row">
									<div class="col-lg-12">
										<br>
										<div class="row">
											<div class="col-lg-3">
												<select class="selectBox">
												<option>상품명</option>
												<option>품번</option>
												<option>상태</option>
											</select>
											</div>
											<div class="col-lg-9">
												<div class="input-search">
													<input type="text" placeholder="검색어를 입력해주세요.">
													<button type="button"><i class="ti-search"></i></button>
												</div>
											</div>
											<div class="col-lg-12">
											<label></label>
												<div class="cart-table">
													<table>
														<thead>
															<tr>
																<th><input type="checkbox" id="cbx_checkAll"></th>
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
															<tr>
																<td class="cart-pic first-row">
																	<input type="checkbox" name="check">
																</td>
																<td class="normal-row">
																1
																</td>
<!-- 															<td class="cart-title first-row"> -->
																<td class="normal-row">
																	<h5>상품명</h5>
																</td>
																<td class="normal-row">10,000</td>
<!-- 															<td class="qua-col first-row"> -->
																<td class="normal-row">
																	정상
																</td>
																<td class="normal-row">1200</td>
																<td class="normal-row">100</td>
																<td class="normal-row">12</td>
																
															</tr>
														</tbody>
														<tbody>
															<tr>
																<td class="cart-pic first-row">
																	<input type="checkbox" name="check">
																</td>
																<td class="normal-row">
																1
																</td>
<!-- 															<td class="cart-title first-row"> -->
																<td class="normal-row">
																	<h5>상품명</h5>
																</td>
																<td class="normal-row">10,000</td>
<!-- 															<td class="qua-col first-row"> -->
																<td class="normal-row">
																	정상
																</td>
																<td class="normal-row">1200</td>
																<td class="normal-row">100</td>
																<td class="normal-row">12</td>
															</tr>
														</tbody>
													</table>
												</div>
												<button type="button" class="back-button" onclick="history.back();">삭제</button>
		                                        <button type="submit" class="site-button" >수정</button>
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
    <script src="${path}/resources/js/productAdmin.js"></script>
</body>

</html>