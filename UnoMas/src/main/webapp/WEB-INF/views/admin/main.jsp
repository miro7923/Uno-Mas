<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<jsp:include page="../inc/top.jsp"></jsp:include>
<%-- <link rel="stylesheet" href="${path}/resources/css/product_css/productAdmin.css?after3"> --%>
<link rel="stylesheet" href="${path}/resources/css/user_css/myInfo.css">
<link rel="stylesheet" href="${path}/resources/css/admin_css/admin.css?after1">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UnoMas 관리자페이지</title>
</head>
<!-- Start Header -->
<%
	String avo = (String) session.getAttribute("saveAID");
%>


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
				
				<div class="col-lg-9">
					<h2>관리자페이지</h2>
					<div class="line"><hr></div>
					<div class="container">
						<form action="#" class="checkout-form">
							<table class="admin_profile">
								<tr>
									<td style="line-height: 25px;">
										<p style="font-weight: bold;"><img src="${path}/resources/img/admin/profile.png"></p>
									</td>
									<td style="line-height: 25px;">
										<p><b><%=avo.toString() %><br></b>2022-05-10&nbsp;02:23:53</p>
									</td>
								</tr>
							</table>
								<table class="table_info">
									<tr>
										<th>총 상품 수량</th>
										<th>총 주문 수량</th>
										<th>총 회원 수</th>
										<th>신규 가입자 수</th>
									</tr>
									<tr>
										<td>22</td>
										<td>16</td>
										<td>7</td>
										<td>3</td>
									</tr>
								</table>
							<table class="table_info">
								<tr>
									<th colspan="2">카테고리 별 상품 비중</th>
								</tr>
								<tr>
									<td>
									<ul>
										<li><span style="color: #b9ce45;">■</span> 채소</li>
										<li><span style="color: #faf5df;">■</span> 과일 · 견과류 · 쌀</li>
										<li><span style="color: #fed837;">■</span> 생수 · 우유 · 커피 · 차</li>
										<li><span style="color: #f67555;">■</span> 정육 · 계란</li>
										<li><span style="color: #ededed;">■</span> 수산 · 해산 · 건어물</li>
									</ul>
									</td>
									<td><div class="pie-chart2"><span class="center"></span></div></td>
								</tr>
							</table>
							
							
						</form>
					</div>


				</div>
			</div>
		</div>
	</section>

	
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
    <script src="${path}/resources/js/product_js/productAdmin.js"></script>
</body>

</html>