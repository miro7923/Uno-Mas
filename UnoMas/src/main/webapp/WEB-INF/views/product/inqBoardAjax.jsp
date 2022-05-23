<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
	<div class="comment-option" id="inqDiv">
		<table class="reviewTable" width="100%" border="0" cellpadding="0" cellspacing="0">
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
					<table class="reviewTable" width="100%" border="0" cellpadding="0"
						cellspacing="0">
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
								<td id="inquiryRegdate${it.index }">
								<fmt:formatDate value="${inquiryVo.p_inquiry_regdate }" type="date" /></td>
							</tr>
						</tbody>
					</table>
					<div class="reviewContent" id="qnaContent${it.index }">
						<p id="inquiryContent${it.index }">${inquiryVo.p_inquiry_content }</p>
						<!-- @@ 관리자는 수정 삭제 답변 모두 가능 @@ -->
						<!-- @@ 로그인 한 회원이 쓴 자기 글은 수정 삭제 가능 @@ -->
						<c:if
							test="${sessionScope.saveID != null && user_num == inquiryVo.user_num }">
							<p class="text-right">
								<a
									href="/product/modify_inquiry?inquiry_num=${inquiryVo.p_inquiry_num }">수정</a>
								&nbsp; <a href="javascript:void(0)"
									onclick="confirmToRemove('inquiry', ${inquiryVo.p_inquiry_num}, ${vo.prod_num })"
									style="color: #5179a5;">삭제</a>
							</p>
						</c:if>
						<p class="text-right">
							<a href="#">답변하기</a>
						</p>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<div class="col-lg-12 reviewBtnArea">
			<div class="row" id="pagediv">
				<input type="hidden" value="${page }" id="curInquiryPage">
				<div class="col-lg-12 text-center">
					<c:if test="${inquiryPm.prev }">
						<a href="/product/inquiry_list?page=${inquiryPm.startPage - 1 }"
							class="arrow_carrot-left_alt pagingBtn" id="prev"></a>
					</c:if>

					<c:forEach var="block" varStatus="it"
						begin="${inquiryPm.startPage }" end="${inquiryPm.endPage }"
						step="1">
						<span> <!----> <a href="javascript:void(0)"
							class="pagingBtn" id="inquiryPage${it.index }"
							style="color: black;"
							onclick="changePageNum(${it.index }, ${inquiryPm.endPage - inquiryPm.startPage + 1 }, 'inquiry');">${block }
								<!---->
						</a>
						</span>
					</c:forEach>

					<c:if test="${inquiryPm.next }">
						<a href="/product/inquiry_list?page=${inquiryPm.endPage + 1 }"
							class="arrow_carrot-right_alt pagingBtn" id="next"></a>
					</c:if>
				</div>
			</div>
			<c:if test="${sessionScope.saveID != null }">
				<button type="submit" class="site-btn"
					onclick="location.href='/product/write_inquiry?prod_num='+${vo.prod_num};">
					문의하기</button>
			</c:if>
		</div>
	</div>
