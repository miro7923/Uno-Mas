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
<script type="text/javascript">
// 	$('#details option[value='+${prod_category}]').attr('selected', 'selected');
</script>

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

				<!-- 상품등록-->
				<div class="col-lg-9">
					<h2>상품수정</h2><div class="line"><hr></div>
					<div class="container">
						<form role="form" method="post" class="checkout-form" >
							<!-- 기본정보 -->
							<div class="row">
								<div class="col-lg-12">
									<br>
									<h4>기본정보</h4>
									<div class="row">
										<div class="col-lg-3">
											<label>품번<span>*</span></label> <input type="text" name="prod_num" id="prod_num" value="${vo.prod_num }" readonly>
										</div>
										<div class="col-lg-9">
											<label>상품명<span>*</span></label> <input type="text" name="prod_name" id="prod_name" value="${vo.prod_name }">
										</div>
										<div class="col-lg-12">
											<label>상품 카테고리<span>*</span></label>
										</div>
										<div class="col-lg-6">
											<select class="selectBox" id="categories">
												<option value="0" selected="selected">대분류</option>
												<c:forEach var="cvo" items="${categories }">
												</c:forEach>
												<option value="1" <c:if test="${vo.prod_category > 0 }">selected</c:if>>채소</option>
												<option value="2" <c:if test="${vo.prod_category > 3 }">selected</c:if>>과일 · 견과류 · 쌀</option>
												<option value="3" <c:if test="${vo.prod_category > 6 }">selected</c:if>>수산 · 해산 · 건어물</option>
												<option value="4" <c:if test="${vo.prod_category > 10 }">selected</c:if>>정육 · 계란</option>
												<option value="5" <c:if test="${vo.prod_category > 15 }">selected</c:if>>생수 · 우유 · 음료</option>
												<option value="6" <c:if test="${vo.prod_category > 18 }">selected</c:if>>신상품</option>
												<option value="7" <c:if test="${vo.prod_category > 19 }">selected</c:if>>특가</option>
											</select>
										</div>
										<div class="col-lg-6">
											<select class="selectBox" name="prod_category" id="details">
												<option value="0" selected>소분류</option>
												<c:forEach var="dvo" items="${details }">
													<option value="${dvo.dcate_num }" 
														<c:if test="${vo.prod_category eq dvo.dcate_num }">selected="selected"</c:if>class="cate${dvo.topcate_num }">${dvo.dcate_name }</option>
												</c:forEach>
											</select>
											<label></label>
										</div>
										<div class="col-lg-12">
											<label>요약 설명<span>*</span></label> <input type="text" name="prod_explain" value="${vo.prod_explain }">
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
											<label>판매가<span>*</span></label> <input type="text" name="prod_price" id="prod_price" value="${vo. prod_price }">
										</div>
										<div class="col-lg-12">
											<label>할인율<span>*</span></label> <input type="text" name="prod_discntrate" id="prod_discntrate"  value="${vo. prod_discntrate }" placeholder="0 ~ 100">
										</div>
										<div class="col-lg-12">
											<label>상품 재고<span>*</span></label> <input type="text" name="prod_stock" class="prod_stock" id="prod_stock" value="${vo. prod_stock }">
										</div>
										<div class="col-lg-12">
											<label>판매 단위<span>*</span></label>
											<select class="selectBox" name="prod_sellunit" id ="prod_sellunit">
												<option value=0>선택</option>
												<option value="1봉" <c:if test="${vo.prod_sellunit == '1봉'}">selected</c:if>>1봉</option>
												<option value="1팩" <c:if test="${vo.prod_sellunit == '1팩'}">selected</c:if>>1팩</option>
												<option value="1개" <c:if test="${vo.prod_sellunit == '1개'}">selected</c:if>>1개</option>
												<option value="1통" <c:if test="${vo.prod_sellunit == '1통'}">selected</c:if>>1통</option>
												<option value="1박스" <c:if test="${vo.prod_sellunit == '1박스'}">selected</c:if>>1박스</option>
												<option value="1포대" <c:if test="${vo.prod_sellunit == '1포대'}">selected</c:if>>1포대</option>
											</select>
											<label></label>
										</div>
										<div class="col-lg-12">
											<label>중량/용량<span>*</span></label><input type="text" name="prod_weight" id="prod_weight" value="${vo.prod_weight }" placeholder="ex) 430g / 1.5L">
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
												<label>원산지<span>*</span></label><input type="text" name="prod_country" id="prod_country" value="${vo.prod_country }">
											</div>
											<div class="col-lg-12">
												<label>유통기한<span>*</span></label><input type="text" name="prod_expire" id="selbox2" value="${vo.prod_expire }" placeholder="남은 기한 ex) 7">
											</div>
<!-- 											<div class="col-lg-12"> -->
<!-- 												<input type="text" value="농산물로 별도의 유통기한은 없으나 가급적 빠른 섭취 부탁드립니다." name="prod_expire" id="selboxDirect2"> -->
<!-- 											</div> -->
											<div class="col-lg-12">
												<label>포장타입<span>*</span></label>
											<select class="selectBox" name="prod_packing">
												<option value=0>선택</option>
												<option value="냉장/스티로품" <c:if test="${vo.prod_packing == '냉장/스티로품'}">selected</c:if>>냉장/스티로품</option>
												<option value="냉동/스티로품" <c:if test="${vo.prod_packing == '냉동/스티로품'}">selected</c:if>>냉동/스티로품</option>
											</select>
											</div>
											<div class="col-lg-12">
											<br>
												<label>보관방법 또는 취급방법<span>*</span></label>
											<select class="selectBox" name="prod_keep" id="selbox">
												<option value=0>선택</option>
												<option value="냉장보관" <c:if test="${vo.prod_keep == '냉장보관'}">selected</c:if>>냉장보관</option>
												<option value="실온보관" <c:if test="${vo.prod_keep == '실온보관'}">selected</c:if>>실온보관</option>
												<option value="직접기재" <c:if test="${vo.prod_keep == '직접기재'}">selected</c:if>>상품별 직접기재</option>
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
<!-- 							<div class="row"> -->
<!-- 								<div class="col-lg-12"> -->
<!-- 									<label></label> -->
<!-- 									<div class="line"><hr></div><br><br> -->
<!-- 									<h4>상품이미지<label>(100MB)</label></h4> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="product-list"> -->
<!-- 		                        <div class="row"> -->
<!-- 		                            <div class="col-lg-3 col-sm-6"> -->
<!-- 		                                <div class="product-item"> -->
<!-- 		                                    <div class="pi-text"> -->
<!-- 		                                        <h5>기본 이미지(세로)</h5><br> -->
<!-- 				                                    <div class="pi-pic"> -->
<%-- 				                                        <img src="${path}/resources/img/products/product-1.jpg" alt=""> --%>
<!-- 				                                        <div class="sale pp-sale">1</div> -->
<!-- 				                                        <input type="file" id="uploadImg" oninput="checkFileName();"> -->
<!-- 				                                    </div> -->
<!-- 		                                        <div class="catagory-name">[이미지 삭제]</div> -->
<!-- 		                                    </div> -->
<!-- 		                                </div> -->
<!-- 		                            </div> -->
<!-- 		                            <div class="col-lg-3 col-sm-6"> -->
<!-- 		                                <div class="product-item"> -->
<!-- 		                                    <div class="pi-text"> -->
<!-- 		                                        <h5>상품 상세 설명</h5><br> -->
<!-- 				                                    <div class="pi-pic"> -->
<%-- 				                                        <img src="${path}/resources/img/products/product-2.jpg" alt=""> --%>
<!-- 				                                        <div class="sale pp-sale">2</div> -->
<!-- 				                                        <input type="file" id="uploadImg" oninput="checkFileName();"> -->
<!-- 				                                    </div> -->
<!-- 		                                     	<div class="catagory-name">[이미지 삭제]</div> -->
<!-- 		                                    </div> -->
<!-- 		                                </div> -->
<!-- 		                            </div> -->
<!-- 		                            <div class="col-lg-3 col-sm-6"> -->
<!-- 		                                <div class="product-item"> -->
<!-- 		                                    <div class="pi-text"> -->
<!-- 		                                        <h5>썸네일</h5><br> -->
<!-- 				                                    <div class="pi-pic"> -->
<%-- 				                                        <img src="${path}/resources/img/products/product-3.jpg" alt=""> --%>
<!-- 				                                        <div class="sale pp-sale">3</div> -->
<!-- 				                                        <input type="file" id="uploadImg" oninput="checkFileName();"> -->
<!-- 				                                    </div> -->
<!-- 		                                     	<div class="catagory-name">[이미지 삭제]</div> -->
<!-- 		                                    </div> -->
<!-- 		                                </div> -->
<!-- 		                            </div> -->
<!-- 		                            <div class="col-lg-3 col-sm-6"> -->
<!-- 		                                <div class="product-item"> -->
<!-- 		                                    <div class="pi-text"> -->
<!-- 		                                        <h5>품절 시 대체 썸네일</h5><br> -->
<!-- 				                                    <div class="pi-pic"> -->
<%-- 				                                        <img src="${path}/resources/img/products/product-4.jpg" alt=""> --%>
<!-- 				                                        <div class="sale pp-sale">4</div> -->
<!-- 				                                        <input type="file" id="uploadImg" oninput="checkFileName();"> -->
<!-- 				                                    </div> -->
<!-- 		                                     	<div class="catagory-name">[이미지 삭제]</div> -->
<!-- 		                                    </div> -->
<!-- 		                                </div> -->
<!-- 		                            </div> -->
<!-- 								</div> -->
<!-- 							</div> -->
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
		                                        <button type="button" class="site-button" onclick="prodCheck()">완료</button>
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
    <script src="${path}/resources/js/product_js/productRegister.js"></script>
    <script src="${path}/resources/js/product_js/productAdmin.js"></script>
</body>

</html>