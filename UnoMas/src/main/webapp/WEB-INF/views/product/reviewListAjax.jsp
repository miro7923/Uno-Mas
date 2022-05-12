<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="comment-option" id="board_review">
	<table class="reviewTable" width="100%" border="0" cellpadding="0"
		cellspacing="0">
		<caption style="display: none">구매후기 제목</caption>
		<colgroup>
			<col style="width: 110px;">
			<col style="width: auto;">
			<col style="width: 77px;">
			<col style="width: 100px;">
			<col style="width: 50px;">
			<col style="width: 80px;">
		</colgroup>
		<tbody>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th align="left">작성자</th>
				<th>작성일</th>
				<th>좋아요</th>
				<th>조회</th>
			</tr>
		</tbody>
	</table>
	<!-- 반복문으로 리뷰글 출력 부분 -->
	<c:forEach var="reviewVo" items="${reviewList }" varStatus="it">
		<table class="reviewTable" width="100%" border="0" cellpadding="0"
			cellspacing="0">
			<caption style="display: none">구매후기 제목</caption>
			<colgroup>
				<col style="width: 110px;">
				<col style="width: auto;">
				<col style="width: 77px;">
				<col style="width: 100px;">
				<col style="width: 50px;">
				<col style="width: 80px;">
			</colgroup>
			<tbody>
				<tr onmouseover="this.style.background='#f0f0f0'"
					onmouseout="this.style.background='white'">
					<td>${reviewVo.review_num }</td>
					<td align="left" class="reviewTitle"
						onclick="toggleReview(${it.index});">${reviewVo.review_title }</td>
					<td align="left">${reviewVo.user_id }</td>
					<td><fmt:formatDate value="${reviewVo.review_regdate }"
							type="date" /></td>
					<td>${reviewVo.review_likecnt }</td>
					<td>${reviewVo.review_readcnt }</td>
				</tr>
			</tbody>
		</table>
		<div class="reviewContent" id="reviewContent${it.index }">
			<input type="hidden" value="${reviewVo.review_num }"
				id="review_num${it.index }"> <strong>${vo.prod_name }</strong>
			<p>
				평점 : <span>${reviewVo.review_rating } / 5.0</span>
			</p>
			<p>${reviewVo.review_content }</p>
		</div>
	</c:forEach>

	<div class="col-lg-12 reviewBtnArea">
		<button type="button" class="site-btn"
			onclick="location.href='/product/write_review?prod_num='+${vo.prod_num};">
			후기쓰기</button>
	</div>
</div>