<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<!-- Start header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/index_css/eventMay.css?after" type="text/css">
<!-- Start header -->

<body>
    <!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
    <!-- Header End -->

	<!-- Event Begin -->
	<div class="container">
		<div class="main">
			<div class="content">
				<div class="eventImg">
					<img src="${path}/resources/img/events/may.png" alt="가정의달이벤트">
				</div>
				<div class="productView">
					<div class="col-lg-12 col-md-12 text-right moreView">
						<p><a href="/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=11">더 보기</a></p>
					</div>
<%-- 					<c:forEach items="${readcntList2}" var="rl2"> --%>
<!-- 						<dl class="itemList"> -->
<!-- 							<dt class="thumb"> -->
<%-- 								<a href="/product/product_detail?prod_num=${rl2.prod_num}"> --%>
<%-- 									<img class="hot1" src="<spring:url value="/resources/upload/images/products/thumbnail/${rl2.prod_image3 }"></spring:url>" alt="hot이미지1"> --%>
<!-- 								</a> -->
<!-- 							</dt> -->
<!-- 							<dd class="prdInfo"> -->
<!-- 								<p class="prdName"> -->
<%-- 									<a href="/product/product_detail?prod_num=${rl2.prod_num}">${rl2.prod_name}</a> --%>
<!-- 								</p> -->
<%-- 								<c:choose> --%>
<%-- 				                    <c:when test="${rl2.prod_discntrate eq 0}"> --%>
<!-- 								        <div> -->
<!-- 								        	<p class="prdPrice"> -->
<%-- 								        	<fmt:formatNumber value="${rl2.prod_price}" type="number"/>원 --%>
<!-- 								        	</p> -->
<!-- 								        </div> -->
<%-- 				                    </c:when> --%>
<%-- 				                    <c:otherwise> --%>
<!-- 								        <div> -->
<!-- 											<p class="prdPrice"> -->
<%-- 										    <del><fmt:formatNumber value="${rl2.prod_price}" type="number"/>원</del><br> --%>
<%-- 										    <fmt:formatNumber value="${rl2.prod_price*(100-rl2.prod_discntrate)/100}" type="number"/>원 --%>
<!-- 										    </p> -->
<!-- 								        </div> -->
<%-- 				                    </c:otherwise> --%>
<%-- 		                        </c:choose> --%>
<!-- 							</dd> -->
<!-- 						</dl> -->
<%-- 					</c:forEach> --%>
				</div>
			</div>
		</div>
	</div>
	<!-- Event End -->

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