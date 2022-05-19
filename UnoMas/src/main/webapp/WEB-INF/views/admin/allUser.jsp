<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/defaultCss.css">
<link rel="stylesheet" href="${path}/resources/css/admin_css/allUser.css">
<title>전체 회원 조회</title>
</head>
<body>
  <jsp:include page="../inc/top.jsp"></jsp:include>
  <jsp:include page="../inc/header.jsp"></jsp:include>


  <div class="allUser_container">
  	<h3>전체 회원 </h3>
  	<span>(총 ${pm.totalCount })</span><br>
  	
   	<div class="allUser_top">
  	  <a href="/admin/all_user?standard=desc" id="standard_default">최신순</a>
  	  <a href="/admin/all_user?standard=asc" id="standard_asc">오래된 순</a>
  	  <a href="/admin/all_user?standard=drop" id="standard_drop">탈퇴회원</a>
  	</div>
  	
  	<c:forEach var="vo" items="${userList }" varStatus="it">
  	<table class="type09">
      <tr>
		<th scope="cols">No.</th>
		<td id="user_num">${vo.user_num}</td>
		<th >가입일</th>
	  	<td >${vo.user_regdate}</td>
		<th>상태</th>
		<c:choose>
		  <c:when test="${vo.user_status == 1 }">
	  		<td style="color: blue">회원</td>
	  	  </c:when>
	  	  <c:when test="${vo.user_status == -1 }">
	  		<td style="color: red">탈퇴</td>
	  	  </c:when>
	  	</c:choose>

	  <tr>
	  
	  <tr>
	  	<th>아이디</th>
	  	<td>${vo.user_id }</td>
	  	<th >이름</th>
	  	<td >${vo.user_name }</td>
	  	<th scope="cols">생년월일</th>
	  	<td>${vo.user_birth }</td>
	  </tr> 
	  
	  <tr>
	  	<th scope="cols">전화번호</th>
	  	<c:set var="tel" value="${vo.user_phone }"/>
	  	<td>${fn:substring(tel,0,3) }-${fn:substring(tel,3,7) }-${fn:substring(tel,7,11) }</td>
	  	<th >이메일</th>
	  	<td >${vo.user_email }</td>
	  	<th scope="cols">이메일 동의</th>
	  	<c:choose>
		  <c:when test="${vo.user_emailagree == 1 }">
	  		<td style="color: blue">O</td>
	  	  </c:when>
	  	  <c:when test="${vo.user_emailagree == 0 }">
	  		<td style="color: orange">X</td>
	  	  </c:when>
	  	</c:choose>
	  </tr>
	  
	
	  <tr>	
	  	<th>포인트</th>
	  	<td>${vo.user_point }</td>
	  	<th>환불계좌</th>
	  	<td>${vo.user_bank }, ${vo.user_account_holder } ${vo.user_account }</td>
		<th>탈퇴날짜</th>
	  	<td>${vo.user_deldate }</td>
	  </tr>
	  
	  <tr>
	  	<th>주소</th>
	  	<td colspan="4">[${vo.user_postalcode }] ${vo.user_roadaddr}, ${vo.user_detailaddr }</td>
	  
	  	<td>
	  	  <input type="button" value="상세보기" class="allUser_btn" style="border-color: #B9CE45;">
	  	  <c:if test="${vo.user_status == 1 }">
	  	  	<input type="button" value="탈퇴하기" onclick="showModal('${vo.user_id }')" class="allUser_btn" style="border-color: red;">
		  </c:if>
	  	</td>
	  </tr>

	</table>
	</c:forEach>
	
	<div class="allUser_paging">
	  <c:if test="${pm.prev }">				
	  	<a href="all_user?standard=${standard }&pagingNum=${pm.startPage - 1}" class="paging_a">이전</a>
	  </c:if>
	  
		<c:forEach var="block" varStatus="pg" begin="${pm.startPage }" end="${pm.endPage }" step="1">
		  <c:choose>
		  	<c:when test="${pg.index == pagingNum }">
		  	  <a href="all_user?standard=${standard }&pagingNum=${pg.index }" class="paging_num_yes">${pg.index }</a>
		  	</c:when>
		  	<c:otherwise>
		  	  <a href="all_user?standard=${standard }&pagingNum=${pg.index }" class="paging_num">${pg.index }</a>
		  	</c:otherwise>
		  </c:choose>
		</c:forEach>
	  
	  <c:if test="${pm.next }">
	    <a href="all_user?standard=${standard }&pagingNum=${pm.startPage + 1}" class="paging_a">다음</a>
	  </c:if>
	</div>
  </div>
  
  <jsp:include page="../user/basicModal.jsp">
  	<jsp:param name="targetID" value="${vo.user_id }" />
  </jsp:include>
	

  <jsp:include page="../inc/bottom.jsp"></jsp:include>

  <!-- Js Plugins -->  
  <script src="${path}/resources/js/user_js/jquery-3.6.0.js"></script>
  <script src="${path}/resources/js/main.js"></script> 
  
  <script src="${path}/resources/js/user_js/basicModal.js"></script>
  <script src="${path}/resources/js/admin_js/allUser.js"></script>
</body>
</html>