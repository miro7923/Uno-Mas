<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 order-1 order-lg-2">
					<h3 class="title">공동구매</h3>
					<div class="subtitle-box">
						<div class="subtitle">
							<h3><span>반값 딜 1탄!</span> 기간 한정 구매 고객 <span>50%</span> 할인(4/25~5/1)</h3>
						</div>
						<h5>기간 2022.04.25 ~ 2022.05.01</h5>
					</div>
					
					
				</div>
			</div>
			
		</div>
		
		<div class="container" >
			<div class="col-lg-12 order-1 order-lg-2" style="background-color: #FAF5DF;">
			<div class="row">
            	<div class="col-lg-6 text-center">
                	<div class="section-title">
                		<label></label>
                   	 	<h2>
                   	 		<span class="month"></span>
                   	 		<span class="">월</span>
                   	 		<span class="date"></span>
                   	 		<span class="">일 오픈</span>
                   	 	</h2>
                   	 	<div class="square"><span>무료배송</span></div>
                    	<p>아삭하고 부드러운 청경채 / 300g</p>
                    	<div class="product-price">
                       		1,095원
                        	<span>/ 2,190원</span>
                    	</div>
               		</div>
                	<div class="countdown">
	 				<div class="time-title">
	                	<p class="time-title">마감까지 남은 시간</p></div>
					  		<div class="time-font">
					    		<span class="hours"></span>
					    		<span class="col">:</span>
					    		<span class="minutes"></span>
					    		<span class="col">:</span>
					    		<span class="seconds"></span>
					 		</div>
                	</div>
                	<a href="#" class="primary-btn">구매하러 가기</a>
                	<label></label>
           	 	</div>
            	<div class="col-lg-6">
            		<div class="co-image">
            			<a href="product_detail">
            			<img src="${path}/resources/img/product-single/product_vegi01.jpeg" alt=""></a>
            		</div>
            	</div>
          	</div>
         	</div>
       	</div>
       	<label></label><br>
		<div class="container" >
			<div class="col-lg-12 order-1 order-lg-2" style="background-color: #FAF5DF;">
			<div class="row">
            	<div class="col-lg-6 text-center">
                	<div class="section-title">
                		<label></label>
                   	 	<h2>
                   	 		<span class="month"></span>
                   	 		<span class="">월</span>
                   	 		<span class="date"></span>
                   	 		<span class="">일 오픈</span>
                   	 	</h2>
                   	 	<div class="square"><span>무료배송</span></div>
                    	<p>아삭하고 부드러운 청경채 / 300g</p>
                    	<div class="product-price">
                       		1,095원
                        	<span>/ 2,190원</span>
                    	</div>
               		</div>
                	<div class="countdown">
	 				<div class="time-title">
	                	<p class="time-title">마감까지 남은 시간</p></div>
					  		<div class="time-font">
					    		<span class="hours"></span>
					    		<span class="col">:</span>
					    		<span class="minutes"></span>
					    		<span class="col">:</span>
					    		<span class="seconds"></span>
					 		</div>
                	</div>
                	<a href="#" class="primary-btn">구매하러 가기</a>
                	<label></label>
           	 	</div>
            	<div class="col-lg-6">
            		<div class="co-image">
            			<a href="product_detail">
            			<img src="${path}/resources/img/product-single/product_vegi01.jpeg" alt=""></a>
            		</div>
            	</div>
          	</div>
         	</div>
       	</div>
       	<label></label><br>
<!-- style="background-image: url(&quot;/resources/img/time-bg.jpg&quot;);"> -->
<!-- style="background-color: #ECEDEE;" -->



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
	<script src="${path}/resources/js/productList.js"></script>
	<script src="${path}/resources/js/productAdmin.js"></script>
</body>

</html>