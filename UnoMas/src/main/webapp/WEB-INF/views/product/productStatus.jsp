<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/productAdmin.css?after5">
<!-- Start Header -->

<script type="text/javascript">
$(document).ready(function(){
	
	// 폼 태그 정보 가져오기
	var obj = $("form[role='form']");
	console.log(obj);
</script>

<body>
    <!-- Header Section Begin -->
    <jsp:include page="../inc/header.jsp"></jsp:include>
    <!-- Header End -->
	
	<!-- Product Register Section End -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
			
				<!-- 상품관리 카테고리 -->
				<div class="col-lg-2 produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">상품관리</h4>
						<ul class="filter-catagories">
							<li><a href="product_lookup">상품조회</a></li>
							<li><a href="product_register">상품등록</a></li>
						</ul>
					</div>
				</div>

				<!-- 상품등록-->
				<div class="col-lg-10">
					<h2>개별상품조회 :: ${vo.prod_name }</h2><div class="line"><hr></div>
					<div class="container">
						<form action="/product/modify" method="get" class="checkout-form" >
						<c:forEach var="vo" items="${productList }"></c:forEach>
						
							<!-- 기본정보 -->
							<div class="row">
								<div class="col-lg-12">
									<br>
									<h4>기본정보</h4>
									<div class="row">
										<div class="col-lg-2">
											<label>품번<span>*</span></label> <input type="text" name="prod_num" id="prod_num" value="${vo.prod_num }" readonly>
										</div>
										<div class="col-lg-6">
											<label>상품명<span>*</span></label> <input type="text" name="prod_name" id="prod_name" value="${vo.prod_name }" readonly>
										</div>
										<div class="col-lg-3">
											<label>상태<span></span></label>
											<div class="filter-widget">
												<div class="fw-size-choose">
													<c:choose>
														<c:when test="${vo.prod_stock eq 0}">
															<div class="sc-item">
																<input type="radio" name="stock_state" value="normal" onclick="return(false);"> <label for= "normal" >정상</label>
															</div>
															<div class="sc-item">
																<input type="radio" name="stock_state" value="sold" checked onclick="return(false);"> <label for="sold" class="active">품절</label>
															</div>
															<div class="sc-item">
																<input type="radio" name="stock_state" value="hide"> <label for="hide">숨김</label>
															</div>
														</c:when>
														<c:when test="${vo.prod_stock > 0}">
															<div class="sc-item">
																<div class="normal">
																<input type="radio" name="stock_state" value="normal"> <label for= "normal" class="active">정상</label>
																</div>
															</div>
															<div class="sc-item">
																<div class="normal">
																<input type="radio" name="stock_state" value="sold"> <label for="sold">품절</label>
																</div>
															</div>
															<div class="sc-item">
																<div class="normal">
																<input type="radio" name="stock_state" value="hide"> <label for="hide">숨김</label>
																</div>
															</div>
														</c:when>
													</c:choose>
												</div>
											</div>
										</div>
										<div class="col-lg-12">
											<label>상품 카테고리<span>*</span></label>
										</div>
										<div class="col-lg-6">
											<select class="selectBox" >
												<option selected>대분류</option>
												<c:forEach var="cvo" items="${categories }">
												<option value="">${cvo.topcate_num}. ${cvo.topcate_name }</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-lg-6">
											<input type="text" name="prod_category" value="${vo.prod_category }" readonly>
											<label></label>
										</div>
										<div class="col-lg-12">
											<label>요약 설명<span>*</span></label> <input type="text" name="prod_explain" value="${vo.prod_explain }" readonly>
										</div>
										<div class="col-lg-12">
											<label for="zip">검색 키워드</label> <input type="text"> <label></label>
											<div class="line"><hr></div><br><br>
										</div>
									</div>
								</div>
							</div>
							<!-- 기본정보 끝-->
							<!-- 판매정보 -->
							<div class="row">
								<div class="col-lg-12">
									<h4>판매정보</h4>
									<div class="row">
										<div class="col-lg-3">
											<label>판매가<span>*</span></label> <input type="text" name="prod_price" id="prod_price" value="${vo. prod_price }" readonly>
										</div>
										<div class="col-lg-3">
											<label>상품 재고<span>*</span></label> <input type="text" name="prod_stock" class="prod_stock" id="prod_stock" value="${vo. prod_stock }" readonly>
										</div>
										<div class="col-lg-3">
											<label>판매 단위<span>*</span></label>
											<input type="text" name="prod_sellunit" value="${vo.prod_sellunit }" readonly>
											<label></label>
										</div>
										<div class="col-lg-3">
												<label>중량/용량<span>*</span></label><input type="text" name="prod_weight" id="prod_weight" value="${vo.prod_weight }" readonly>
										</div>
									</div>
								</div>
								<!-- 판매정보 끝-->
								<!-- 추가항목 -->
								<div class="col-lg-12">
									<div class="place-order">
										<h4>추가항목</h4>
										<div class="row">
											<div class="col-lg-3">
												<label>원산지<span>*</span></label><input type="text" name="prod_country" id="prod_country" value="${vo.prod_country }" readonly>
											</div>
											<div class="col-lg-3">
												<label>유통기한<span>*</span></label><input type="text" name="prod_expire" id="selbox2" value="${vo.prod_expire }" readonly>
											</div>
<!-- 											<div class="col-lg-12"> -->
<!-- 												<input type="text" value="농산물로 별도의 유통기한은 없으나 가급적 빠른 섭취 부탁드립니다." name="prod_expire" id="selboxDirect2"> -->
<!-- 											</div> -->
											<div class="col-lg-3">
												<label>포장타입<span>*</span></label>
												<input type="text" name="prod_packing" value="${vo.prod_packing }" readonly>
											</div>
											<div class="col-lg-3">
												<label>보관방법/취급방법<span>*</span></label>
												<input type="text" name="prod_keep" value="${vo.prod_keep }" readonly>
											</div>
<!-- 											<div class="col-lg-12"> -->
<!-- 												<input type="text" name="prod_keep" id="selboxDirect"> -->
<!-- 											</div> -->
										</div>
									</div>
								</div>
							</div>
							<!-- 추가항목 끝-->
							<!-- 상품이미지-->
							<div class="row">
								<div class="col-lg-12">
									<label></label>
									<div class="line"><hr></div><br><br>
									<h4>상품이미지<label>(100MB)</label></h4>
								</div>
							</div>
							<div class="product-list">
		                        <div class="row">
		                            <div class="col-lg-4 col-sm-6">
		                                <div class="product-item">
		                                    <div class="pi-text">
		                                        <h5>기본 이미지(세로)</h5><br>
				                                    <div class="pi-pic">
				                                        <img src="${path}/resources/img/products/product-1.jpg" alt="">
				                                        <div class="sale pp-sale">1</div>
				                                        <input type="file" id="uploadImg" oninput="checkFileName();">
				                                    </div>
		                                        <div class="catagory-name">[이미지 삭제]</div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col-lg-4 col-sm-6">
		                                <div class="product-item">
		                                    <div class="pi-text">
		                                        <h5>상품 상세 설명</h5><br>
				                                    <div class="pi-pic">
				                                        <img src="${path}/resources/img/products/product-2.jpg" alt="">
				                                        <div class="sale pp-sale">2</div>
				                                        <input type="file" id="uploadImg" oninput="checkFileName();">
				                                    </div>
		                                     	<div class="catagory-name">[이미지 삭제]</div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col-lg-4 col-sm-6">
		                                <div class="product-item">
		                                    <div class="pi-text">
		                                        <h5>썸네일</h5><br>
				                                    <div class="pi-pic">
				                                        <img src="${path}/resources/img/products/product-3.jpg" alt="">
				                                        <div class="sale pp-sale">3</div>
				                                        <input type="file" id="uploadImg" oninput="checkFileName();">
				                                    </div>
		                                     	<div class="catagory-name">[이미지 삭제]</div>
		                                    </div>
		                                </div>
		                            </div>
								</div>
							</div>
							<!-- 상품이미지 끝-->
							<div class="row">
								<div class="col-lg-12">
									<label></label>
									<hr><br><br>
								</div>
							</div>
							<!-- 상품 상세 설명-->
<!-- 							<div class="col-lg-12"> -->
<!-- 									<br> -->
<!-- 									<h4>상품 상세 설명</h4> -->
<!-- 									<div class="row"> -->
<!-- 										<div class="col-lg-12"> -->
<!-- 											<label>상품제목<span>*</span></label> -->
<!-- 										</div> -->
<!-- 										<div class="col-lg-6"> -->
<!-- 											<input type="text" id="detailSubTitle"> -->
<!-- 										</div> -->
<!-- 										<div class="col-lg-6"> -->
<!-- 											<input type="text" id="detailTitle"> -->
<!-- 										</div> -->
<!-- 										<div class="col-lg-12"> -->
<!-- 											<label>재료와 성분<span>*</span></label> -->
<!-- 										</div> -->
<!-- 										<div class="col-lg-12"> -->
<!-- 											<input type="text" id="ingredient"> -->
<!-- 										</div> -->
<!-- 										<div class="col-lg-12"> -->
<!-- 											<label>활용법<span>*</span></label> -->
<!-- 										</div> -->
<!-- 										<div class="col-lg-12"> -->
<!-- 											<input type="text" id="recomendation1"> -->
<!-- 											<input type="text" id="recomendation2"> -->
<!-- 											<input type="text" id="recomendation3"> -->
<!-- 										</div> -->
<!-- 										<div class="col-lg-12"> -->
<!-- 											<label>상품 내용<span>*</span></label> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</form> -->
<!-- 						</div> -->
<!-- 						<div class="col-lg-12"> -->
<!-- 		                    <div class="contact-form"> -->
<!-- 		                        <div class="leave-comment"> -->
<!-- 		                            <form action="#" class="comment-form"> -->
<!-- 		                                    <div class="col-lg-12"> -->
<!-- 												<div id="detailMainContent"> -->
<!-- 		                                        <textarea placeholder="상품 설명"></textarea> -->
<!-- 		                                        </div> -->
<!-- 												<div id="ingredient"> -->
<!-- 		                                        <textarea placeholder="보관법"></textarea> -->
<!-- 		                                        </div> -->
<!-- 												<div id="detailMainContent"> -->
<!-- 		                                        <textarea placeholder="세척법"></textarea> -->
<!-- 		                                        </div> -->
		                                        <button type="button" class="back-button" onclick="history.back();">취소</button>
		                                        <button type="submit" class="site-button" >수정</button>
<!-- 		                                    </div> -->
<!-- 		                            </form> -->
<!-- 		                        </div> -->
<!-- 		                    </div> -->
<!-- 		                </div> -->
						<!-- 상품 상세 설명 끝-->
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Register Section End -->





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