<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
	<div class="comment-option" id="reviewListAjax">
		<table class="reviewTable" width="100%" border="0" cellpadding="0" cellspacing="0">
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
					<table class="reviewTable" width="100%" border="0" cellpadding="0" cellspacing="0">
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
								<td id="reviewRegdate${it.index }">
								    <fmt:formatDate	value="${reviewVo.review_regdate }" type="date" /></td>
								<%-- <td id="reviewLikecnt${it.index }">${reviewVo.review_likecnt }</td> --%>
								<td id="reviewReadcnt${it.index }">${reviewVo.review_readcnt }</td>
							</tr>
						</tbody>
					</table>
					<div class="reviewContent" id="reviewContentBox${it.index }">
						<strong>${vo.prod_name }</strong>
						<p>
							평점 : <span id="reviewRating${it.index }">${reviewVo.review_rating } / 5.0</span>
						</p>
						<br>
						<c:if test="${reviewVo.review_image != null && fn:length(reviewVo.review_image) > 0 }">
							<p align="center">
								<img src="<spring:url value="/resources/upload/images/board/review/${reviewVo.review_image }"></spring:url>">
							</p>
						</c:if>
						<p id="reviewContent${it.index }">${reviewVo.review_content }</p>
						<!-- @@ 로그인 기능 추가되면 로그인한 사용자만 자기글 수정/삭제 가능하게 구현 @@ -->
						<!-- @@ 관리자도 수정 삭제 가능 -->
						<c:if test="${sessionScope.saveID != null && user_num == reviewVo.user_num }">
							<p class="text-right">
								<a href="/product/modify_review?review_num=${reviewVo.review_num }">수정</a>&nbsp; 
								<a href="javascript:void(0)"
									onclick="confirmToRemove('review', ${reviewVo.review_num}, ${vo.prod_num })"
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
				<input type="hidden" value="${page }" id="curReviewPage">
				<div class="col-lg-12 text-center">
					<c:if test="${reviewPm.prev }">
						<a href="/product/review_list?page=${reviewPm.startPage - 1 }"
							class="arrow_carrot-left_alt pagingBtn" id="prev"></a>
					</c:if>

					<c:forEach var="block" varStatus="it"
						begin="${reviewPm.startPage }" end="${reviewPm.endPage }" step="1">
						<span> <!----> <a href="javascript:void(0)"
							class="pagingBtn" id="reviewPage${it.index }"
							style="color: black;"
							onclick="changePageNum(${it.index }, ${reviewPm.endPage - reviewPm.startPage + 1 }, 'review');">${block }
								<!---->
						</a>
						</span>
					</c:forEach>

					<c:if test="${reviewPm.next }">
						<a href="/product/review_list?page=${reviewPm.endPage + 1 }"
							class="arrow_carrot-right_alt pagingBtn" id="next"></a>
					</c:if>
				</div>
			</div>
			<c:if test="${sessionScope.saveID != null }">
				<button type="button" class="site-btn"
					onclick="location.href='/product/write_review?prod_num='+${vo.prod_num};">
					후기쓰기</button>
			</c:if>
		</div>
	</div>