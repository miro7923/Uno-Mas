<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/productDetail.css?after2">
<!-- Header end -->

<%
    // @@ 로그인 된 회원의 정보에서 위시리스트 정보도 조회해오기 @@
    boolean isInWishlist = false;
%>
<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<!-- <div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text product-more">
						<a href="./home.html"><i class="fa fa-home"></i> Home</a> <a
							href="shop">Shop</a> <span>Detail</span>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad page-details">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-6">
							<div class="product-pic-zoom">
								<img class="product-big-img"
									src="${path}/resources/img/product-single/product_vegi01.jpeg"
									alt="">
								<!-- <div class="zoom-icon">
                                    <i class="fa fa-search-plus"></i>
                                </div> -->
							</div>
							<%-- <div class="product-thumbs">
                                <div class="product-thumbs-track ps-slider owl-carousel">
                                    <div class="pt active" data-imgbigurl="img/product-single/product_salad01.webp"><img
                                            src="${path}/resources/img/product-single/product_salad01.webp" alt=""></div>
                                    <div class="pt" data-imgbigurl="img/product-single/product-2.jpg"><img
                                            src="${path}/resources/img/product-single/product-2.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="img/product-single/product-3.jpg"><img
                                            src="${path}/resources/img/product-single/product-3.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="img/product-single/product-3.jpg"><img
                                            src="${path}/resources/img/product-single/product-3.jpg" alt=""></div>
                                </div>
                            </div> --%>
						</div>
						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<h3>청경채</h3>
								</div>
								<!-- <div class="pd-rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i> <span>(5)</span>
								</div> -->
								<div class="pd-desc">
									<p>아삭하고 부드러운</p>
								</div>
								<div class="pd-desc">
									<h5 class="priceText top">
										<span id="price">2,190</span> 원
									</h5>
									<p class="memberInfo">로그인 후, 적립혜택이 제공됩니다.</p>
								</div>
								<div class="pd-tags">
									<dl class="list first">
										<dt class="title">판매단위</dt>
										<dd class="description">1팩</dd>
									</dl>
									<dl class="list">
										<dt class="title">중량/용량</dt>
										<dd class="description">300g</dd>
									</dl>
									<hr>
									<dl class="list">
										<dt class="title">배송구분</dt>
										<dd class="description">택배배송</dd>
									</dl>
									<hr>
									<dl class="list">
										<dt class="title">원산지</dt>
										<dd class="description">국산</dd>
									</dl>
									<hr>
									<dl class="list">
										<dt class="title">포장타입</dt>
										<dd class="description">냉장/스티로품</dd>
									</dl>
									<hr>
									<dl class="list">
										<div class="quantity">
											<dt class="title">구매수량</dt>
											<div class="pro-qty">
												<input type="text" value="1">
											</div>
											<br>
										</div>
									</dl>
								</div>
								<div class="pd-desc">
									<h5 class="priceText">
										총 상품금액 : <span id="price">2,190</span> 원
									</h5>
								</div>
								<div class="quantity">
									<!--
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
-->
                                    <!-- 회원의 위시리스트에 이 상품번호가 추가되어 있으면 까만 하트가 기본값 -->
                                    <!-- @@ 클릭시 ajax로 DB 통신해서 위시리스트 추가하고 알림창 띄운 뒤 화면 새로고침 @@ -->
                                    <%if (isInWishlist) { %>
									    <button class="icon_heart" id="wishlistBtnFull" 
									        onclick="toggleWishlistBtn();"></button>
								   <% }
                                      else { %>
									    <button class="icon_heart_alt" id="wishlistBtnEmpty" 
									        onclick="toggleWishlistBtn();"></button>
								   <% } %>
									<a href="shopping-cart" class="primary-btn pd-cart">장바구니 담기</a>
								</div>
								<!--
                                <div class="pd-share">
                                    <div class="p-code">Sku : 00012</div>
                                    <div class="pd-social">
                                        <a href="#"><i class="ti-facebook"></i></a>
                                        <a href="#"><i class="ti-twitter-alt"></i></a>
                                        <a href="#"><i class="ti-linkedin"></i></a>
                                    </div>
                                </div>
-->
							</div>
						</div>
					</div>
					<br> <br>


					<!-- Related Products Section End -->
					<%-- <div class="related-products spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Related Products</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="${path}/resources/img/products/women-1.jpg" alt="">
                            <div class="sale">Sale</div>
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Coat</div>
                            <a href="#">
                                <h5>Pure Pineapple</h5>
                            </a>
                            <div class="product-price">
                                $14.00
                                <span>$35.00</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="${path}/resources/img/products/women-2.jpg" alt="">
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Shoes</div>
                            <a href="#">
                                <h5>Guangzhou sweater</h5>
                            </a>
                            <div class="product-price">
                                $13.00
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="${path}/resources/img/products/women-3.jpg" alt="">
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Towel</div>
                            <a href="#">
                                <h5>Pure Pineapple</h5>
                            </a>
                            <div class="product-price">
                                $34.00
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="${path}/resources/img/products/women-4.jpg" alt="">
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Towel</div>
                            <a href="#">
                                <h5>Converse Shoes</h5>
                            </a>
                            <div class="product-price">
                                $34.00
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --%>
					<!-- Related Products Section End -->

					<div class="product-tab">
						<div class="tab-item">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#tab-1"
									role="tab">상품설명</a></li>
								<li><a data-toggle="tab" href="#tab-2" role="tab">상세정보</a>
								</li>
								<!-- @@ 후기 개수에 따라 () 안에 숫자 출력하기 @@ -->
								<li><a data-toggle="tab" href="#tab-3" role="tab" onclick="toggleReview(0);">후기
										(02)</a></li>
								<li><a data-toggle="tab" href="#tab-4" role="tab" onclick="toggleQna(0);">문의</a></li>
							</ul>
						</div>
						<div class="tab-item-content">
							<div class="tab-content">
								<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
									<div class="product-content">
										<div class="col-lg-12">
											<img
												src="${path}/resources/img/product-single/product_vegi02.webp"
												alt="">
										</div>
										<br> <br>
										<div class="row">
											<div class="text-center col-lg-12">
												<!-- id 선택자 지정된 부분만 디비에서 불러와서 채우면 됨 -->
												<h3 class="detailSubTitle" id="detailSubTitle">아삭하고
													부드러운</h3>
												<h1 class="detailTitle" id="detailTitle">청경채</h1>
												<br>
												<hr>
												<p class="detailMainContent" id="detailMainContent">청경채는
													잎과 줄기가 붙어 자라는 한 포기 쌈채소에요. 아삭하면서도 싱그러운 식감이 매력적이지만, 살짝 데치거나
													볶아주면 새로운 풍미를 선사해요. 신선한 청경채를 Uno más를 통해 만나보세요.</p>
												<br> <br> <br> <br> <br> <br>
												<hr>
												<h3 class="detailOtherTitle">재료와 성분</h3>
												<p class="detailOtherContent" id="ingredient">비타민 C, 칼륨,
													칼슘 풍부</p>
												<h3 class="detailOtherTitle">활용법</h3>
												<ul class="recomendation">
													<!-- 활용법은 3개만 합시다. -->
													<li class="detailOtherContent" id="recomendation1">중화풍
														요리, 샤브샤브 재료로 활용</li>
													<li class="detailOtherContent" id="recomendation2">다양한
														볶음, 무침으로 만들어도 OK</li>
													<li class="detailOtherContent" id="recomendation3">1인
														가구도 부담없이 사용하기 좋은 양</li>
												</ul>
												<h3 class="detailOtherTitle">보관법</h3>
												<p class="detailOtherContent" id="ingredient">세척하지 않은
													상태로 비닐 팩에 담은 뒤, 냉장고 채소칸에 보관하세요.</p>
												<h3 class="detailOtherTitle">세척법</h3>
												<p class="detailOtherContent" id="ingredient">사용할 만큼만 꺼내
													흐르는 물로 깨끗이 세척하세요.</p>
											</div>
										</div>
										<br> <br>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-2" role="tabpanel">
									<!-- id 선택자 지정해 놓은 곳만 바뀌면 됨 -->
									<div class="col-lg-12">
										<table class="extraInfo" cellpadding="0" cellspacing="1">
											<tbody>
												<tr>
													<th>품목 또는 명칭</th>
													<td id="extraInfoProdName">청경채</td>
													<th>포장단위별 내용물의 용량(중량), 수량, 크기</th>
													<td id="extraInfoProdWeight">300g</td>
												</tr>
												<tr>
													<th>관련법상 표시사항</th>
													<td>농산물 - 농수산물품질관리법상 유전자변형농산물 표시, 지리적 표시<br> 축산물
														- 축산법에 따른 등급 표시, 쇠고기의 경우 이력관리에 따른 표시 유무<br> 수산물 -
														농수산물품질관리법상 유전자변형수산물 표시, 지리적 표시<br> 수입식품에 해당하는 경우
														"수입식품안전특별법에 따른 수입신고를 필함"의 문구
													</td>
													<th>생산자, 수입품의 경우 수입자를 함께 표기</th>
													<td>제품 별도 라벨 표기 참조</td>
												</tr>
												<tr>
													<th>농수산물의 원산지 표시에 관한 법률에 따른 원산지</th>
													<td>상품설명 및 상품이미지 참조</td>
													<th>상품구성</th>
													<td id="extraInfoCountry">국산</td>
												</tr>
												<tr>
													<th>보관방법 또는 취급방법</th>
													<td id="extraInfoKeeping">냉장 보관</td>
													<th>제조연월일(포장일 또는 생산연도), 유통기한 또는 품질유지기한</th>
													<td>제품 별도 라벨 표기 참조</td>
												</tr>
												<tr>
													<th>식품등의표시·광고에관한법률에 따른 소비자안전을 위한 주의사항</th>
													<td>상품설명 및 상품이미지참조</td>
													<th>소비자상담 관련 전화번호</th>
													<td>우노마스 고객센터 (1544-1544)</td>
												</tr>
											</tbody>
										</table>
										<!-- <table>
                                            <tr>
                                                <td class="p-catagory">평점</td>
                                                <td>
                                                    <div class="pd-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <span>(5)</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">가격</td>
                                                <td>
                                                    <div class="p-price" id="price">2,190원</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Add To Cart</td>
                                                <td>
                                                    <div class="cart-add">+ add to cart</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Availability</td>
                                                <td>
                                                    <div class="p-stock">22 in stock</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Weight</td>
                                                <td>
                                                    <div class="p-weight">1,3kg</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Size</td>
                                                <td>
                                                    <div class="p-size">Xxl</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Color</td>
                                                <td><span class="cs-color"></span></td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Sku</td>
                                                <td>
                                                    <div class="p-code">00012</div>
                                                </td>
                                            </tr>
                                        </table> -->
									</div>
								</div>
								<div class="tab-pane fade" id="tab-3" role="tabpanel">
									<div class="customer-review-option">
										<h4>PRODUCT REVIEW</h4>
										<ul class="productReivewTitle">
											<li><span data-icon="&#x5e"></span> 상품에 대한 후기를 남기는
												공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
											<li><span data-icon="&#x5e"></span> 배송관련, 주문(취소/교환/환불)관련
												문의 및 요청사항은 마이페이지 내 <!-- @@ 1:1 문의글 작성 페이지 링크로 수정 @@ --> <span
												onclick="window.parent.location.href = '/mypage/my_QnA'"
												class="personalInquiry">1:1 문의</span>에 남겨주세요.</li>
										</ul>
										<div class="comment-option">
											<table class="reviewTable" width="100%" border="0"
												cellpadding="0" cellspacing="0">
												<caption style="display: none">구매후기 제목</caption>
												<colgroup>
													<col style="width: 110px;">
													<col style="width: auto;">
													<%-- <col style="width: 51px;"> --%>
													<col style="width: 77px;">
													<col style="width: 100px;">
													<col style="width: 50px;">
													<col style="width: 80px;">
												</colgroup>
												<tbody>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<!-- <th scope="col" class="input_txt"><span
															class="screen_out">회원 등급</span></th> -->
														<th align="left">작성자</th>
														<th>작성일</th>
														<th>좋아요</th>
														<th>조회</th>
													</tr>
												</tbody>
											</table>
											<%-- <table class="reviewTable" width="100%" border="0"
												cellpadding="0" cellspacing="0">
												<caption style="display: none">구매후기 제목</caption>
												<colgroup>
													<col style="width: 110px;">
													<col style="width: auto;">
													<col style="width: 51px;">
													<col style="width: 77px;">
													<col style="width: 100px;">
													<col style="width: 50px;">
													<col style="width: 80px;">
												</colgroup>
												<tbody>
													<tr onmouseover="this.style.background='#f0f0f0'"
														onmouseout="this.style.background='white'">
														<td>공지</td>
														<td align="left" class="reviewTitle"
															onclick="toggleReview()">상품 후기 적립금 정책 안내</td>
														<!-- <th scope="col" class="input_txt"><span
															class="screen_out">회원 등급</span></th> -->
														<td align="left">UnoMas</td>
														<td>2022-04-22</td>
														<td>0</td>
														<td>245864</td>
													</tr>
												</tbody>
											</table> --%>
											<!-- <div class="reviewContent">
												<p>고객님 안녕하세요, 우노마스입니다.</p>
											</div> -->
											<!-- 반복문으로 리뷰글 출력 부분 -->
											<%
											for (int i = 0; i < 7; i++) {
											%>
											<table class="reviewTable" width="100%" border="0"
												cellpadding="0" cellspacing="0">
												<caption style="display: none">구매후기 제목</caption>
												<colgroup>
													<col style="width: 110px;">
													<col style="width: auto;">
													<%-- <col style="width: 51px;"> --%>
													<col style="width: 77px;">
													<col style="width: 100px;">
													<col style="width: 50px;">
													<col style="width: 80px;">
												</colgroup>
												<tbody>
													<tr onmouseover="this.style.background='#f0f0f0'"
														onmouseout="this.style.background='white'">
														<td><%=i + 1%></td>
														<td align="left" class="reviewTitle"
															onclick="toggleReview(<%=i+1%>);">리뷰 <%=i + 1%></td>
														<!-- <th scope="col" class="input_txt"><span
																class="screen_out">회원 등급</span></th> -->
														<td align="left">UnoMas</td>
														<td>2022-04-22</td>
														<td>0</td>
														<td>0</td>
													</tr>
												</tbody>
											</table>
											<div class="reviewContent" id="reviewContent<%=i+1%>">
												<p>고객님 안녕하세요, 우노마스입니다.</p>
											</div>
											<%
											}
											%>
											<div class="col-lg-12 reviewBtnArea">
												<button type="submit" class="site-btn" onclick="location.href='review_writing_form';">
												후기쓰기
												</button>
											</div>

											<%-- <div class="co-item">
                                                <div class="avatar-pic">
                                                    <img src="${path}/resources/img/product-single/avatar-1.png" alt="">
                                                </div>
                                                <div class="avatar-text">
                                                    <div class="at-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <h5>Brandon Kelley <span>27 Aug 2019</span></h5>
                                                    <div class="at-reply">Nice !</div>
                                                </div>
                                            </div> --%>
											<%-- <div class="co-item">
                                                <div class="avatar-pic">
                                                    <img src="${path}/resources/img/product-single/avatar-2.png" alt="">
                                                </div>
                                                <div class="avatar-text">
                                                    <div class="at-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <h5>Roy Banks <span>27 Aug 2019</span></h5>
                                                    <div class="at-reply">Nice !</div>
                                                </div>
                                            </div> --%>
										</div>
										<!-- <div class="personal-rating">
                                            <h6>Your Ratind</h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                        </div> -->
										<!-- <div class="leave-comment">
											<h4>Leave A Comment</h4>
											<form action="#" class="comment-form">
												<div class="row">
													<div class="col-lg-6">
														<input type="text" placeholder="Name">
													</div>
													<div class="col-lg-6">
														<input type="text" placeholder="Email">
												<textarea placeholder="Messages"></textarea>
													</div>
												</div>
											</form>
										</div> -->
									</div>
								</div>
								<div class="tab-pane fade" id="tab-4" role="tabpanel">
									<div class="customer-review-option">
										<h4>PRODUCT Q&A</h4>
										<ul class="productReivewTitle">
											<li><span data-icon="&#x5e"></span> 상품에 대한 문의를 남기는
												공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
											<li><span data-icon="&#x5e"></span> 배송관련, 주문(취소/교환/환불)관련
												문의 및 요청사항은 마이페이지 내 <!-- @@ 1:1 문의글 작성 페이지 링크로 수정 @@ --> <span
												onclick="window.parent.location.href = '/mypage/my_QnA'"
												class="personalInquiry">1:1 문의</span>에 남겨주세요.</li>
										</ul>
										<div class="comment-option">
											<table class="reviewTable" width="100%" border="0"
												cellpadding="0" cellspacing="0">
												<caption style="display: none">문의 제목</caption>
												<colgroup>
													<col style="width: 110px;">
													<col style="width: auto;">
													<%-- <col style="width: 51px;"> --%>
													<col style="width: 77px;">
													<col style="width: 100px;">
													<col style="width: 50px;">
													<col style="width: 80px;">
												</colgroup>
												<tbody>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<!-- <th scope="col" class="input_txt"><span
															class="screen_out">회원 등급</span></th> -->
														<th align="left">작성자</th>
														<th>작성일</th>
														<th>좋아요</th>
														<th>조회</th>
													</tr>
												</tbody>
											</table>
											<!-- 반복문으로 리뷰글 출력 부분 -->
											<%
											for (int i = 0; i < 7; i++) {
											%>
											<table class="reviewTable" width="100%" border="0"
												cellpadding="0" cellspacing="0">
												<caption style="display: none">문의 제목</caption>
												<colgroup>
													<col style="width: 110px;">
													<col style="width: auto;">
													<%-- <col style="width: 51px;"> --%>
													<col style="width: 77px;">
													<col style="width: 100px;">
													<col style="width: 50px;">
													<col style="width: 80px;">
												</colgroup>
												<tbody>
													<tr onmouseover="this.style.background='#f0f0f0'"
														onmouseout="this.style.background='white'">
														<td><%=i + 1%></td>
														<td align="left" class="reviewTitle"
															onclick="toggleQna(<%=i+1%>);">문의 <%=i + 1%></td>
														<!-- <th scope="col" class="input_txt"><span
																class="screen_out">회원 등급</span></th> -->
														<td align="left">UnoMas</td>
														<td>2022-04-22</td>
														<td>0</td>
														<td>0</td>
													</tr>
												</tbody>
											</table>
											<div class="reviewContent" id="qnaContent<%=i+1%>">
												<p>원산지가 어딘가요?</p>
											</div>
											<%
											}
											%>
											<div class="col-lg-12 reviewBtnArea">
												<button type="submit" class="site-btn" onclick="location.href='product_qna_writing_form';">
												문의하기
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Shop Section End -->

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
	<script src="${path}/resources/js/productDetail.js"></script>
</body>

</html>