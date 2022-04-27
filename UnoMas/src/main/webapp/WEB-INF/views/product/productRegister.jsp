<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/productAdmin.css">
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
					<h2>상품등록</h2><hr>
					<div class="container">
						<form action="#" class="checkout-form">
							<!-- 기본정보 -->
							<div class="row">
								<div class="col-lg-12">
									<br>
									<h4>기본정보</h4>
									<div class="row">
										<div class="col-lg-6">
											<label>상품명<span>*</span></label> <input type="text">
										</div>
										<div class="col-lg-3">
											<label>상품번호<span>*</span></label> <input type="text">
										</div>
										<div class="col-lg-3">
											<label>상태<span>*</span></label>
											<div class="filter-widget">
												<div class="fw-size-choose">
													<div class="sc-item">
														<input type="radio"> <label for="">정상</label>
													</div>
													<div class="sc-item">
														<input type="radio"> <label for="">품절</label>
													</div>
													<div class="sc-item">
														<input type="radio"> <label for="">숨김</label>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12">
											<label>상품 카테고리<span>*</span></label>
										</div>
										<div class="col-lg-6">
											<select class="selectBox">
												<option>대분류</option>
												<option>채소</option>
												<option>과일·견과·쌀</option>
												<option>수산·해산·건어물</option>
												<option>정육·계란</option>
												<option>생수·음료·우유·커피</option>
											</select>
										</div>
										<div class="col-lg-6">
											<select class="selectBox">
												<option>소분류</option>
												<option>1</option>
												<option>2</option>
											</select>
											<label></label>
										</div>
										<div class="col-lg-12">
											<label>요약 설명<span>*</span></label> <input type="text">
										</div>
										<div class="col-lg-12">
											<label for="zip">검색 키워드</label> <input type="text"> <label></label>
											<hr><br><br>
										</div>
									</div>
								</div>
							</div>
							<!-- 기본정보 끝 -->
							<!-- 판매정보 -->
							<div class="row">
								<div class="col-lg-6">
									<h4>판매정보</h4>
									<div class="row">
										<div class="col-lg-12">
											<label>판매가<span>*</span></label> <input type="text">
										</div>
										<div class="col-lg-12">
											<label>적립금</label> <input type="text">
										</div>
										<div class="col-lg-12">
											<label>상품 재고<span>*</span></label> <input type="text">
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
												<label>판매단위<span>*</span></label> <input type="text">
											</div>
											<div class="col-lg-12">
												<label>중량/용량</label> <input type="text">
											</div>
											<div class="col-lg-12">
												<label>배송구분<span>*</span></label> <input type="text">
											</div>
											<div class="col-lg-12">
												<label>포장타입<span>*</span></label> <input type="text">
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 추가항목 끝-->
							<div class="row">
								<div class="col-lg-12">
									<label></label>
									<hr><br><br>
								</div>
							</div>
							<!-- 상품정보고시 -->
							<div class="col-lg-12">
								<div class="row">
								<h4>상품정보고시</h4>
									<!--상품 상태 버튼-->
									<div class="filter-widget">
										<div class="fw-size-choose">
											<div class="sc-item">
												<input type="radio"> <label for="">ON</label>
											</div>
											<div class="sc-item">
												<input type="radio"> <label for="">OFF</label>
											</div>
										</div>
									</div>
									<!--상품 상태 버튼 끝-->
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="row">
										<div class="col-lg-5">
											<label>품목 또는 명칭</label>
										</div>
										<div class="col-lg-7">
											<input type="text" id="extraInfoProdName">
										</div>
										<div class="col-lg-5">
											<label>포장단위별 내용물의 용량(중량), 수량, 크기</label>
										</div>
										<div class="col-lg-7">
											<input type="text" id="extraInfoProdWeight">
										</div>
										<div class="col-lg-5">
											<label>관련법상 표기사항</label>
										</div>
										<div class="col-lg-7">
											<input type="text" value=
										
										"농산물 - 농수산물품질관리법상 유전자변형농산물 표시, 지리적 표시<br> 축산물
														- 축산법에 따른 등급 표시, 쇠고기의 경우 이력관리에 따른 표시 유무<br> 수산물 -
														농수산물품질관리법상 유전자변형수산물 표시, 지리적 표시<br> 수입식품에 해당하는 경우
														'수입식품안전특별법에 따른 수입신고를 필함'의 문구" readonly>
										
										</div>
										<div class="col-lg-5">
											<label>생산자, 수입품의 경우 수입자를 함께 표기</label>
										</div>
										<div class="col-lg-7">
											<input type="text" value="제품 별도 라벨 표기 참조" readonly>
										</div>
										<div class="col-lg-5">
											<label>농수산물의 원산지 표시에 관한 법률에 따른 원산지</label>
										</div>
										<div class="col-lg-7">
											<input type="text" value="상품설명 및 상품이미지참조" readonly>
										</div>
										<div class="col-lg-5">
											<label>상품구성</label>
										</div>
										<div class="col-lg-7">
											<input type="text" id="extraInfoCountry">
										</div>
										<div class="col-lg-5">
											<label>보관방법 또는 취급방법</label>
										</div>
										<div class="col-lg-7">
											<input type="text" >
										</div>
										<div class="col-lg-5">
											<label>제조연월일(포장일 또는 생산연도), 유통기한 또는 품질유지기한</label>
										</div>
										<div class="col-lg-7">
											<input type="text" value="제품 별도 라벨 표기 참조" readonly>
										</div>
										<div class="col-lg-5">
											<label>식품 등의 표시·광고에 관한 법률에 따른 소비자 안전을 위한 주의사항</label>
										</div>
										<div class="col-lg-7">
											<input type="text" value="상품설명 및 상품이미지참조" readonly>
										</div>
										<div class="col-lg-5">
											<label>소비자상담 관련 전화번호</label>
										</div>
										<div class="col-lg-7">
											<input type="text" value="우노마스 고객센터 (1544-1544)" readonly>
										</div>
									</div>
								</div>
							</div>
							<!-- 상품정보고시 끝-->
							<!-- 상품이미지-->
							<div class="row">
								<div class="col-lg-12">
									<label></label>
									<hr><br><br>
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
		                                        <h5>상세 이미지(가로)</h5><br>
				                                    <div class="pi-pic">
				                                        <img src="${path}/resources/img/products/product-2.jpg" alt="">
				                                        <div class="sale pp-sale">2</div>
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
							<div class="col-lg-12">
									<br>
									<h4>상품 상세 설명</h4>
									<div class="row">
										<div class="col-lg-12">
											<label>상품제목<span>*</span></label>
										</div>
										<div class="col-lg-6">
											<input type="text" id="detailSubTitle">
										</div>
										<div class="col-lg-6">
											<input type="text" id="detailTitle">
										</div>
										<div class="col-lg-12">
											<label>재료와 성분<span>*</span></label>
										</div>
										<div class="col-lg-12">
											<input type="text" id="ingredient">
										</div>
										<div class="col-lg-12">
											<label>활용법<span>*</span></label>
										</div>
										<div class="col-lg-12">
											<input type="text" id="recomendation1">
											<input type="text" id="recomendation2">
											<input type="text" id="recomendation3">
										</div>
										<div class="col-lg-12">
											<label>상품 내용<span>*</span></label>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="col-lg-12">
		                    <div class="contact-form">
		                        <div class="leave-comment">
		                            <form action="#" class="comment-form">
		                                    <div class="col-lg-12">
												<div id="detailMainContent">
		                                        <textarea placeholder="상품 설명"></textarea>
		                                        </div>
												<div id="ingredient">
		                                        <textarea placeholder="보관법"></textarea>
		                                        </div>
												<div id="detailMainContent">
		                                        <textarea placeholder="세척법"></textarea>
		                                        </div>
		                                        <button type="button" class="site-btn" onclick="history.back();">취소</button>
		                                        <button type="submit" class="site-btn" >등록</button>
		                                    </div>
		                            </form>
		                        </div>
		                    </div>
		                </div>
						<!-- 상품 상세 설명 끝-->
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
</body>

</html>