<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/wishlist.css?after" type="text/css">
<!-- Start Header -->

<body>
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
	<script>
		function checkSelectAll(){ // 전체체크와 선택체크의 수가 같아야 selectall체크박스 체크on
			const checkboxes = document.querySelectorAll('input[name="wishCheck"]'); // 전체 체크박스
			const checked = document.querySelectorAll('input[name="wishCheck"]:checked'); // 선택된 체크박스
			const selectAll = document.querySelector('input[name="selectall"]'); // selectall 체크박스
			
			if(checkboxes.length === checked.length) {
				selectAll.checked = true;
			} else {
				selectAll.checked = false;
			}
		}

		function selectAll(selectAll)  { // selectall 체크박스로 on/off
			const checkboxes = document.getElementsByName('wishCheck');
				checkboxes.forEach((checkbox) => {
				checkbox.checked = selectAll.checked
			})
		}
		
		$(function(){ // 찜 전체삭제
			$("#btnDelete").click(function(){
				if(confirm("찜 목록을 비우시겠습니까?")){
					location.href="/product/wishlist/deleteAllWish";
				}
			});
		});
	</script>
    <!-- Header Section Begin -->
    <jsp:include page="../inc/header.jsp"></jsp:include>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <span>위시리스트</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                	<th class="wishCheck"><input type="checkbox" name="selectall" value="selectall" onclick='selectAll(this)'/></th>
                                    <th>이미지</th>
                                    <th class="p-name">상품정보</th>
                                    <th>가격</th>
                                    <th></th>
                                    <th>삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list}" var="list">
                                <tr>
                                	<td class="wishCheck"><input type="checkbox" name="wishCheck" value="check" class="chBox" onclick='checkSelectAll()'
                                		data-wishNum="${list.wish_num}"/></td>
                                	<td class="cart-pic first-row wishImg"><a href="/product/product_detail?prod_num=${list.prod_num}">
                                		<img src="${path}/resources/img/product-single/${list.prod_num}.jpeg" alt="productImg"/></a></td>
                                    <td class="cart-title first-row">
                                        <h5>${list.prod_name}</h5>
                                    </td>
                                    <td class="p-price first-row">${list.prod_price}원</td>
                                    <td class="cartInFirst">
                                        <div class="quantity">
		                                    <button type="button" class="btn btn-outline-secondary btn-lg px-4 cartBtn">장바구니 담기</button>
                                        </div>
                                    </td>
                                    <td class="close-td first-row"><a href="/product/wishlist/deleteWish?prod_num=${list.prod_num}"><i class="ti-close" ></i></a></td>
                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <button type="button" class="selectDelete_btn">선택 삭제</button>
                                	<script>
										$(".selectDelete_btn").click(function(){
											var confirm_val = confirm("정말 삭제하시겠습니까?");
											  
											if(confirm_val) {
												var checkArr = new Array();
											   
												$("input[class='chBox']:checked").each(function(){
													checkArr.push($(this).attr("data-wishNum"));
												});
												    
												$.ajax({
													url : "/product/wishlist/deleteCheckWish",
													type : "post",
													data : { chbox : checkArr },
													success : function(result){
														if(result == 1){
															location.href = "/product/wishlist";
														} else {
															alert("삭제 실패");
														} 
													}
												});
											} 
										});
									</script>
                                <button type="button" id="btnDelete" class="primary-btn">전체삭제</button>
                                <button type="button" class="selectInsertWish_btn">선택 담기</button>
                                	<script>
										$(".selectInsertWish_btn").click(function(){
											var checkArr = new Array();
											   
											$("input[class='chBox']:checked").each(function(){
												checkArr.push($(this).attr("data-wishNum"));
											});
												    
											$.ajax({
												url : "/product/wishlist/insertCheckWish",
												type : "post",
												data : { chbox : checkArr },
												success : function(result){
													if(result == 1){
														alert("정상적으로 장바구니에 담았습니다.")
														location.href = "/product/wishlist";
													} else {
														alert("장바구니 담기를 실패했습니다.");
													} 
												}
											});
										});
									</script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

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