<%@page import="com.april.unomas.domain.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/product_css/productDetail.css?after2">
<!-- Header end -->

<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad page-details">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-6">
							<div class="product-pic-zoom">
								<img class="product-big-img"
									src='<spring:url value="/resources/upload/images/products/top/${vo.prod_image1 }"></spring:url>' alt="">
							</div>
						</div>
						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
								    <input type="hidden" value="${vo.prod_num }" id="prod_num">
									<h3>${vo.prod_name }</h3>
								</div>
								<div class="pd-desc">
									<p>${vo.prod_explain }</p>
								</div>
								<div class="pd-desc">
									<h5 class="priceText top">
									    <c:choose>
									        <c:when test="${vo.prod_discntrate eq 0 }">
											    <input type="hidden" id="originPrice" value="${vo.prod_price }">
												<span class="finalPrice"><fmt:formatNumber value="${vo.prod_price }" type="number"/></span> 원
									        </c:when>
									        <c:otherwise>
									            <div class="saleSubTit">회원할인가</div>
									            <c:set var="discnted" value="${vo.prod_price*(100-vo.prod_discntrate)/100}"/>
									            <c:set var="discntedPrice" value="${discnted+((discnted%10>5)?(10-(discnted%10))%10:-(discnted%10))}"/>
									            <input type="hidden" id="originPrice" value="<fmt:formatNumber value="${discntedPrice }" type="number"/>">
									            <span class="finalPrice"><fmt:formatNumber value="${discntedPrice }" type="number"/></span> 원 &nbsp;
									            <span class="finalPrice discntRate">${vo.prod_discntrate }%</span>
									            <div class="discnted"><fmt:formatNumber value="${vo.prod_price}" type="number"/>원</div>
									        </c:otherwise>
									    </c:choose>
									</h5>
									<c:if test="${sessionScope.saveID == null }">
										<p class="memberInfo">로그인 후, 적립혜택이 제공됩니다.</p>
									</c:if>									
								</div>
								<div class="pd-tags">
									<dl class="list first">
										<dt class="title">판매단위</dt>
										<dd class="description">${vo.prod_sellunit }</dd>
									</dl>
									<dl class="list">
										<dt class="title">중량/용량</dt>
										<dd class="description">${vo.prod_weight }</dd>
									</dl>
									<hr>
									<dl class="list">
										<dt class="title">배송구분</dt>
										<dd class="description">택배배송</dd>
									</dl>
									<hr>
									<dl class="list">
										<dt class="title">원산지</dt>
										<dd class="description">${vo.prod_country }</dd>
									</dl>
									<hr>
									<dl class="list">
										<dt class="title">포장타입</dt>
										<dd class="description">${vo.prod_packing }</dd>
									</dl>
									<hr>
									<dl class="list">
										<dt class="title">유통기한</dt>
										<c:choose>
											<c:when test="${vo.prod_expire == 0 }">
												<dd class="description">신선식품으로 별도의 유통기한은 없으나 가급적 빠른 시일 내에 드시길 바랍니다.</dd>
											</c:when>
											<c:otherwise>
												<dd class="description">수령일 포함 최소 ${vo.prod_expire }일 이상 남은 제품을 보내드립니다.</dd>
											</c:otherwise>
										</c:choose>
									</dl>
									<hr>
									<dl class="list">
										<div class="quantity">
											<dt class="title">구매수량</dt>
											<c:if test="${vo.prod_stock > 0 }">
												<div class="pro-qty">
													<input type="text" id="quantity" value="1">
												</div>
											</c:if>
											<br>
										</div>
									</dl>
								</div>
								<div class="pd-desc">
									<h5 class="priceText">
									    총 상품금액 : 
									    <c:choose>
									        <c:when test="${vo.prod_stock > 0 }">
												<span id="totalPrice"></span>
									        </c:when>
									        <c:otherwise>
									            <span><fmt:formatNumber value="${vo.prod_price }" type="number"/></span>
									        </c:otherwise>
									    </c:choose>
									     원
									</h5>
								</div>
								<div class="quantity justify-content-end">
                                    <!-- 회원의 위시리스트에 이 상품번호가 추가되어 있으면 까만 하트가 기본값 -->
                                    <!-- @@ 클릭시 ajax로 DB 통신해서 위시리스트 추가하고 알림창 띄운 뒤 화면 새로고침 @@ -->
                                    <input type="hidden" value="${isInWishlist }" id="isInWishlist">
                                    <c:choose>
                                        <c:when test="${sessionScope.saveID == null }">
	                                        <button class="icon_heart_alt" id="wishlistBtn" 
										        onclick="toggleWishlistBtn(null, ${vo.prod_num });"></button>
                                        </c:when>
                                        <c:otherwise>
		                                    <c:choose>
		                                        <c:when test="${isInWishlist == true }">
												    <button class="icon_heart" id="wishlistBtn" 
												        onclick="toggleWishlistBtn(${sessionScope.saveID.user_num}, ${vo.prod_num });"></button>
		                                        </c:when>
		                                        <c:otherwise>
												    <button class="icon_heart_alt" id="wishlistBtn" 
												        onclick="toggleWishlistBtn(${sessionScope.saveID.user_num}, ${vo.prod_num });"></button>
		                                        </c:otherwise>
		                                    </c:choose>
                                        </c:otherwise>
                                    </c:choose>
								   <form action="/product/insert_cart">
								   </form>
								       <c:choose>
								           <c:when test="${vo.prod_stock == 0 }">
								              <button class="primary-btn pd-cart soldout" id="cartBtn" disabled>상품 준비 중입니다.</button>
								           </c:when>
									       <c:when test="${sessionScope.saveID != null }">
										       <input type="hidden" id="user_num" value="${sessionScope.saveNUM }">
										       <input type="hidden" id="prod_num" value="${vo.prod_num }">
										       <input type="hidden" id="prod_amount" value="1">
											   <button class="primary-btn pd-cart" id="cartBtn" onclick="insertCart();">장바구니 담기</button> 
									       </c:when>
									       <c:otherwise>
									           <button class="primary-btn pd-cart" id="cartBtn" onclick="askLogin();">장바구니 담기</button>
									       </c:otherwise>
								       </c:choose>
								</div>
							</div>
						</div>
					</div>
					<br> <br>

					<div class="product-tab">
						<div class="tab-item" style="border: 1px solid #ebebeb;">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#tab-1"
									role="tab">상품설명</a></li>
								<li><a data-toggle="tab" href="#tab-2" role="tab">상세정보</a>
								</li>
								<!-- @@ 후기 개수에 따라 () 안에 숫자 출력하기 @@ -->
								<li><a data-toggle="tab" href="#tab-3" role="tab" onclick="initReview();">후기
										(${reviewCnt })</a></li>
								<li><a data-toggle="tab" href="#tab-4" role="tab" onclick="initQna();">문의</a></li>
							</ul>
						</div>
						<div class="tab-item-content">
							<div class="tab-content">
								<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
									<div class="product-content">
										<div class="col-lg-12">
											<img src='<spring:url value="/resources/upload/images/products/detail/${vo.prod_image2 }"></spring:url>' alt="">
										</div>
										<br> <br>
										<div class="row">
											<div class="text-center col-lg-12">
												<!-- id 선택자 지정된 부분만 디비에서 불러와서 채우면 됨 -->
												<h3 class="detailSubTitle" id="detailSubTitle">${vo.prod_explain }</h3>
												<h1 class="detailTitle" id="detailTitle">${vo.prod_name }</h1>
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
									<div class="col-lg-12">
										<table class="extraInfo" cellpadding="0" cellspacing="1">
											<tbody>
												<tr>
													<th>품목 또는 명칭</th>
													<td id="extraInfoProdName">${vo.prod_name }</td>
													<th>포장단위별 내용물의 용량(중량), 수량, 크기</th>
													<td id="extraInfoProdWeight">${vo.prod_weight }g</td>
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
													<td id="extraInfoCountry">${vo.prod_country }</td>
												</tr>
												<tr>
													<th>보관방법 또는 취급방법</th>
													<td id="extraInfoKeeping">${vo.prod_keep }</td>
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
									</div>
								</div>
								<div class="tab-pane fade" id="tab-3" role="tabpanel">
									<div class="customer-review-option">
										<h4>PRODUCT REVIEW</h4>
										<ul class="productReivewTitle">
											<li><span data-icon="&#x5e"></span> 상품에 대한 후기를 남기는
												공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
											<li><span data-icon="&#x5e"></span> 배송관련, 주문(취소/교환/환불)관련
												문의 및 요청사항은 마이페이지 내  
												<span onclick="window.parent.location.href = '/user/mypage'"
												class="personalInquiry">1:1 문의</span>에 남겨주세요.</li>
										</ul>
										<div class="comment-option" id="reviewListAjax">
											<table class="reviewTable" width="100%" border="0"
												cellpadding="0" cellspacing="0">
												<caption style="display: none">구매후기 제목</caption>
												<colgroup>
													<col style="width: 110px;">
													<col style="width: auto;">
													<col style="width: 77px;">
													<col style="width: 100px;">
													<%-- <col style="width: 50px;"> --%>
													<col style="width: 80px;">
												</colgroup>
												<tbody>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th align="left">작성자</th>
														<th>작성일</th>
														<!-- <th>좋아요</th> -->
														<th>조회</th>
													</tr>
												</tbody>
											</table>
											<c:choose>
												<c:when test="${fn:length(reviewList) == 0 }">
												    <p class="text-center nonPost">등록된 후기가 없어요. 고객님께서 첫 번째 후기를 남겨주세요!</p>
												</c:when>
												<c:otherwise>
													<c:forEach var="reviewVo" items="${reviewList }" varStatus="it">
														<table class="reviewTable" width="100%" border="0"
															cellpadding="0" cellspacing="0">
															<caption style="display: none">구매후기 제목</caption>
															<colgroup>
																<col style="width: 110px;">
																<col style="width: auto;">
																<col style="width: 77px;">
																<col style="width: 100px;">
																<%-- <col style="width: 50px;"> --%>
																<col style="width: 80px;">
															</colgroup>
															<tbody>
																<tr onmouseover="this.style.background='#f0f0f0'"
																	onmouseout="this.style.background='white'">
																	<td id="reviewNum${it.index }">${reviewVo.review_num }</td>
																	<td align="left" class="reviewTitle" id="reviewTitle${it.index }"
																		onclick="updateReviewReadcnt(${it.index}); toggleReview(${it.index});">${reviewVo.review_title }</td>
																	<td align="left" id="reviewUserid${it.index }">${reviewVo.user_id }</td>
																	<td id="reviewRegdate${it.index }"><fmt:formatDate value="${reviewVo.review_regdate }" type="date"/></td>
																	<%-- <td id="reviewLikecnt${it.index }">${reviewVo.review_likecnt }</td> --%>
																	<td id="reviewReadcnt${it.index }">${reviewVo.review_readcnt }</td>
																</tr>
															</tbody>
														</table>
														<div class="reviewContent" id="reviewContentBox${it.index }">
														    <strong>${vo.prod_name }</strong>
															<p>평점 : <span id="reviewRating${it.index }">${reviewVo.review_rating } / 5.0</span></p><br>
															<c:if test="${reviewVo.review_image != null && fn:length(reviewVo.review_image) > 0 }">
																<p align="center"><img src="<spring:url value="/resources/upload/images/board/review/${reviewVo.review_image }"></spring:url>"></p>
															</c:if>
															<p id="reviewContent${it.index }">${reviewVo.review_content }</p>
															<!-- @@ 로그인 기능 추가되면 로그인한 사용자만 자기글 수정/삭제 가능하게 구현 @@ -->
															<!-- @@ 관리자도 수정 삭제 가능 -->
															<c:if test="${sessionScope.saveID != null && sessionScope.saveNUM == reviewVo.user_num }">
																<p class="text-right">
																    <a href="/product/modify_review?review_num=${reviewVo.review_num }">수정</a> &nbsp; 
																    <a href="javascript:void(0)" onclick="confirmToRemove('review', ${reviewVo.review_num}, ${vo.prod_num })" 
																    style="color: #5179a5;">삭제</a>
																</p>
															</c:if>
															
															<!-- @@ 좋아요 기능 나중에 추가하기 @@ -->
															<%-- <p class="text-right">
															    <button type="button" class="site-btn likeBtn" onclick="addLikeCnt(${reviewVo.review_num }, ${it.index});">좋아요</button>
															</p>
															<p class="text-right">
															    <button type="button" class="site-btn likeBtn" onclick="cancelLikeCnt(${reviewVo.review_num }, ${it.index});">좋아요 취소</button>
															</p> --%>
															<!-- @@ 좋아요 기능 나중에 추가하기 @@ -->
															
														</div>
													</c:forEach>
												</c:otherwise>
											</c:choose>
											
											<div class="col-lg-12 reviewBtnArea">
												<div class="row" id="pagediv">
												    <input type="hidden" value="1" id="curReviewPage">
													<div class="col-lg-12 text-center">
														<c:if test="${reviewPm.prev == true }">
															<a href="/product/review_list?page=${reviewPm.startPage - 1 }" class="arrow_carrot-left_alt pagingBtn" id="prev"></a> 
														</c:if>
														
														<c:forEach var="block" varStatus="it" begin="${reviewPm.startPage }" end="${reviewPm.endPage }" step="1">
															<span>
														        <!----> <a href="javascript:void(0)" 
																class="pagingBtn" id="reviewPage${it.index }" style="color: black;"
																onclick="changePageNum(${it.index }, ${reviewPm.endPage - reviewPm.startPage + 1 }, 'review');">${block } <!----></a>
															</span> 
														</c:forEach>
														
														<c:if test="${reviewPm.next == true }">
															<a href="/product/review_list?page=${reviewPm.endPage + 1 }" class="arrow_carrot-right_alt pagingBtn" id="next"></a> 
														</c:if>
													</div>
												</div>
												<c:if test="${sessionScope.saveID != null }">
													<button type="button" class="site-btn" onclick="location.href='/product/write_review?prod_num='+${vo.prod_num};">
													후기쓰기
													</button>
												</c:if>
											</div>
										</div>
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
												onclick="window.parent.location.href = '/user/mypage'"
												class="personalInquiry">1:1 문의</span>에 남겨주세요.</li>
										</ul>
										<div class="comment-option">
											<table class="reviewTable" width="100%" border="0"
												cellpadding="0" cellspacing="0">
												<caption style="display: none">문의 제목</caption>
												<colgroup>
													<col style="width: 110px;">
													<col style="width: auto;">
													<col style="width: 77px;">
													<col style="width: 100px;">
												</colgroup>
												<tbody>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th align="left">작성자</th>
														<th>작성일</th>
													</tr>
												</tbody>
											</table>
											<c:choose>
											    <c:when test="${fn:length(inquiryList) == 0 }">
											        <p class="text-center nonPost">등록된 문의가 없습니다.</p>
											    </c:when>
											    <c:otherwise>
													<c:forEach var="inquiryVo" items="${inquiryList }" varStatus="it">
														<table class="reviewTable" width="100%" border="0"
															cellpadding="0" cellspacing="0">
															<caption style="display: none">문의 제목</caption>
															<colgroup>
																<col style="width: 110px;">
																<col style="width: auto;">
																<col style="width: 77px;">
																<col style="width: 100px;">
															</colgroup>
															<tbody>
																<tr onmouseover="this.style.background='#f0f0f0'"
																	onmouseout="this.style.background='white'">
																	<td id="inquiryNum${it.index }">${inquiryVo.p_inquiry_num }</td>
																	<td align="left" class="reviewTitle" id="inquiryTitle${it.index }"
																		onclick="toggleQna(${it.index});">${inquiryVo.p_inquiry_title }</td>
																	<td align="left" id="inquiryUserid${it.index }">${inquiryVo.user_id }</td>
																	<td id="inquiryRegdate${it.index }"><fmt:formatDate value="${inquiryVo.p_inquiry_regdate }" type="date"/></td>
																</tr>
															</tbody>
														</table>
														<div class="reviewContent" id="qnaContent${it.index }">
															<p id="inquiryContent${it.index }">${inquiryVo.p_inquiry_content }</p>
															<!-- @@ 관리자는 수정 삭제 답변 모두 가능 @@ -->
															<!-- @@ 로그인 한 회원이 쓴 자기 글은 수정 삭제 가능 @@ -->
															<c:if test="${sessionScope.saveID != null && sessionScope.saveNUM == inquiryVo.user_num }">
																<p class="text-right">
																    <a href="/product/modify_inquiry?inquiry_num=${inquiryVo.p_inquiry_num }">수정</a> &nbsp; 
																    <a href="javascript:void(0)" 
																    onclick="confirmToRemove('inquiry', ${inquiryVo.p_inquiry_num}, ${vo.prod_num })" style="color: #5179a5;">삭제</a>
																</p>
															</c:if>
															<c:if test="${sessionScope.saveANUM != null && inqComList != null && inqComList[it.index] == null }">
																<p class="text-right"><a href="/product/write_inq_comment?prod_num=${vo.prod_num }&p_inquiry_num=${inquiryVo.p_inquiry_num}">답변하기</a></p>
															</c:if>
															
															<c:if test="${inqComList != null && inqComList[it.index] != null }">
															    <p><br><br>${inqComList[it.index].com_content }</p>
															</c:if>
														</div>
													</c:forEach>
											    </c:otherwise>
											</c:choose>
											<div class="col-lg-12 reviewBtnArea">
												<div class="row" id="pagediv">
												    <input type="hidden" value="1" id="curInquiryPage">
													<div class="col-lg-12 text-center">
														<c:if test="${inquiryPm.prev }">
															<a href="/product/inquiry_list?page=${inquiryPm.startPage - 1 }" class="arrow_carrot-left_alt pagingBtn" id="prev"></a> 
														</c:if>
														
														<c:forEach var="block" varStatus="it" begin="${inquiryPm.startPage }" end="${inquiryPm.endPage }" step="1">
															<span>
														        <!----> <a href="javascript:void(0)" 
																class="pagingBtn" id="inquiryPage${it.index }" style="color: black;"
																onclick="changePageNum(${it.index }, ${inquiryPm.endPage - inquiryPm.startPage + 1 }, 'inquiry');">${block } <!----></a>
															</span> 
														</c:forEach>
														
														<c:if test="${inquiryPm.next }">
															<a href="/product/inquiry_list?page=${inquiryPm.endPage + 1 }" class="arrow_carrot-right_alt pagingBtn" id="next"></a> 
														</c:if>
													</div>
												</div>
											    <c:if test="${sessionScope.saveID != null }">
													<button type="submit" class="site-btn" onclick="location.href='/product/write_inquiry?prod_num='+${vo.prod_num};">
													문의하기
													</button>
											    </c:if>
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
	<script src="${path}/resources/js/product_js/productDetail.js"></script>
</body>

</html>