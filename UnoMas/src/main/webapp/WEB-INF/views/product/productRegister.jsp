<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/product_css/productAdmin.css?after5">
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
					<h2>상품등록</h2><div class="line"><hr></div>
					<div class="container">
						<form role="form" method="post" class="checkout-form" id="register">
							<!-- 기본정보 -->
							<div class="row">
								<div class="col-lg-12">
									<br>
									<h4>기본정보</h4>
									<div class="row">
										<div class="col-lg-12">
											<label>상품명<span>*</span></label>
											<label><span id="prod_name"></span></label>
											<input type="text" name="prod_name">
										</div>
										<div class="col-lg-12">
											<label>상품 카테고리<span>*</span></label>
										</div>
										<div class="col-lg-6">
											<select class="selectBox" name="categories" id="categories">
												<option value="0" selected="selected">대분류</option>
												<c:forEach var="cvo" items="${categories }">
												<option value="${cvo.topcate_num }">${cvo.topcate_num }. ${cvo.topcate_name }</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-lg-6">
											<select class="selectBox" name="prod_category" id="details">
												<option value="0" selected>소분류</option>
												<c:forEach var="dvo" items="${details }">
													<option value="${dvo.dcate_num }" class="cate${dvo.topcate_num }">${dvo.dcate_name }</option>
												</c:forEach>
											</select>
											<label></label>
										</div>
										<div class="col-lg-12">
											<label>요약 설명<span>*</span></label> <input type="text" name="prod_explain">
										</div>
										<div class="col-lg-12">
											<div class="line"><hr></div><br><br>
										</div>
									</div>
								</div>
							</div>
							<!-- 기본정보 끝-->
							<!-- 판매정보 -->
							<div class="row">
								<div class="col-lg-6">
									<h4>판매정보</h4>
									<div class="row">
										<div class="col-lg-12">
											<label>판매가<span>*</span></label> <input type="text" name="prod_price" id="prod_price">
										</div>
										<div class="col-lg-12">
											<label>할인율<span>*</span></label> <input type="text" name="prod_discntrate" id="prod_discntrate" placeholder="0 ~ 100">
										</div>
										<div class="col-lg-12">
											<label>상품 재고<span>*</span></label> <input type="text" name="prod_stock" class="prod_stock" id="prod_stock">
										</div>
										<div class="col-lg-12">
											<label>판매 단위<span>*</span></label>
											<select class="selectBox" name="prod_sellunit">
												<option value=0>선택</option>
												<option value="1봉">1봉</option>
												<option value="1팩">1팩</option>
												<option value="1개">1개</option>
												<option value="1통">1통</option>
												<option value="1박스">1박스</option>
												<option value="1포대">1포대</option>
											</select>
											<label></label>
										</div>
										<div class="col-lg-12">
												<label>중량/용량<span>*</span></label><input type="text" name="prod_weight" id="prod_weight" placeholder="ex) 430g / 1.5L">
										</div>
									</div>
								</div>
								<!-- 판매정보 끝-->
								<!-- 추가항목 -->
								<div class="col-lg-6">
									<div class="place-order">
										<h4>추가항목</h4>
										<div class="row">
											<div class="col-lg-12">
												<label>원산지<span>*</span></label><input type="text" name="prod_country" id="prod_country">
											</div>
											<div class="col-lg-12">
												<label>유통기한<span>*</span></label><input type="text" name="prod_expire" id="selbox2" placeholder="남은 기한 ex) 7">
											</div>
<!-- 											<div class="col-lg-12"> -->
<!-- 												<input type="text" value="농산물로 별도의 유통기한은 없으나 가급적 빠른 섭취 부탁드립니다." name="prod_expire" id="selboxDirect2"> -->
<!-- 											</div> -->
											<div class="col-lg-12">
												<label>포장타입<span>*</span></label>
											<select class="selectBox" name="prod_packing" >
												<option value=0>선택</option>
												<option value="냉장/스티로품">냉장/스티로품</option>
												<option value="냉동/스티로품">냉동/스티로품</option>
											</select>
											</div>
											<div class="col-lg-12">
												<label style="margin-top: 3%;">보관방법 또는 취급방법<span>*</span></label>
											<select class="selectBox" name="prod_keep" id="selbox">
												<option value=0>선택</option>
												<option value="냉장보관">냉장보관</option>
												<option value="실온보관">실온보관</option>
												<option value="직접기재">상품별 직접기재</option>
											</select>
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
		                            <div class="col-lg-3 col-sm-6">
		                                <div class="product-item">
		                                    <div class="pi-text">
		                                        <h5>기본 이미지(세로)</h5><br>
				                                    <div class="pi-pic">
				                                        <img src="" alt="" id="prevImg1">
				                                        <div class="sale pp-sale">1</div>
				                                        <input class="uploadImgName1" id="uploadImgName1" value="이미지 선택" disabled="disabled"> 
				                                        <input type="hidden" id="prod_image1" name="prod_image1">
														<label class="site-btn" for="uploadImg1" id="uploadBtn">업로드</label>
				                                        <input type="file" id="uploadImg1" name="uploadImg1" oninput="checkFileName(1, 'top'); showFileName(1);">
				                                    </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col-lg-3 col-sm-6">
		                                <div class="product-item">
		                                    <div class="pi-text">
		                                        <h5>상품 상세 설명</h5><br>
				                                    <div class="pi-pic">
				                                        <img src="" alt="" id="prevImg2">
				                                        <div class="sale pp-sale">2</div>
				                                        <input class="uploadImgName2" id="uploadImgName2" value="이미지 선택" disabled="disabled">
				                                        <input type="hidden" id="prod_image2" name="prod_image2">
				                                        <label class="site-btn" for="uploadImg2" id="uploadBtn">업로드</label>
				                                        <input type="file" id="uploadImg2" name="uploadImg2" oninput="checkFileName(2, 'detail'); showFileName(2);">
				                                    </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col-lg-3 col-sm-6">
		                                <div class="product-item">
		                                    <div class="pi-text">
		                                        <h5>썸네일</h5><br>
				                                    <div class="pi-pic">
				                                        <img src="" alt="" id="prevImg3">
				                                        <div class="sale pp-sale">3</div>
				                                        <input class="uploadImgName3" id="uploadImgName3" value="이미지 선택" disabled="disabled">
				                                        <input type="hidden" id="prod_image3" name="prod_image3">
				                                        <label class="site-btn" for="uploadImg3" id="uploadBtn">업로드</label>
				                                        <input type="file" id="uploadImg3" name="uploadImg3" oninput="checkFileName(3, 'thumb'); showFileName(3);">
				                                    </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col-lg-3 col-sm-6">
                                      <div class="product-item">
                                          <div class="pi-text">
                                              <h5>품절 시 대체 썸네일</h5><br>
                                                <div class="pi-pic">
                                                    <img src="" alt="" id="prevImg4">
                                                    <div class="sale pp-sale">4</div>
				                                    <input class="uploadImgName4" id="uploadImgName4" value="이미지 선택" disabled="disabled">
				                                    <input type="hidden" id="prod_image4" name="prod_image4">
				                                    <label class="site-btn" for="uploadImg4" id="uploadBtn">업로드</label>
                                                    <input type="file" id="uploadImg4" name="uploadImg4" oninput="checkFileName(4, 'soldout'); showFileName(4);">
                                                </div>
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
		                                        <button type="button" class="site-button" onclick="prodCheck()">등록</button>
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
    <script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
    <script src="${path}/resources/js/product_js/productRegister.js"></script>
    <script src="${path}/resources/js/product_js/productAdmin.js"></script>
</body>

</html>