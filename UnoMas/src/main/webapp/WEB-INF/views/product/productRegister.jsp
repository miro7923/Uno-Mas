<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">

<!-- Start Header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- Start Header -->

<body>
    <!-- Header Section Begin -->
    <jsp:include page="../inc/header.jsp"></jsp:include>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <h4 class="fw-title">상품관리</h4>
                        <ul class="filter-catagories">
                            <li><a href="#">상품조회</a></li>
                            <li><a href="#">상품등록</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-lg-9 order-1 order-lg-2">

                <h2>상품등록</h2><hr>
                             
<!--         <section class="checkout-section spad"> -->
        <div class="container">
            <form action="#" class="checkout-form">
                <div class="row">
                    <div class="col-lg-12">
                        <br><h4>기본정보</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <label>상품명<span>*</span></label>
                                <input type="text">
                            </div>
                            <div class="col-lg-3">
                                <label>상품번호<span>*</span></label>
                                <input type="text">
                            </div>
                            <div class="col-lg-3">
                                <label>상태<span>*</span></label>
                        		<div class="filter-widget">
                        			<div class="fw-size-choose">
                            			<div class="sc-item">
                              				<input type="radio">
                             			    <label for="">정상</label>
                            			</div>
                           				<div class="sc-item">
                               				<input type="radio">
                                			<label for="">품절</label>
                            			</div>
                            			<div class="sc-item">
                               				<input type="radio">
                                			<label for="">숨김</label>
                            			</div>
                            
                      				</div>
                    			</div>
                         	</div>  
                            <div class="col-lg-12">
                                <label>상품 카테고리<span>*</span></label>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" placeholder="대분류">
                            </div>
                            <div class="col-lg-6">
                                <input type="text" placeholder="소분류">
                            </div>
                            <div class="col-lg-12">
                                <label>요약 설명<span>*</span></label>
                                <input type="text">
                            </div>
                            <div class="col-lg-12">
                                <label for="zip">검색 키워드</label>
                                <input type="text">
                                <label></label>
                                <label></label>
                                <hr><br><br>
                            </div>
                       </div>
                  </div>
              </div>
               
              <div class="row">
                    <div class="col-lg-6">
                        <h4>판매정보</h4>
                        <div class="row">
                            <div class="col-lg-12">
                                <label>상품 가격<span>*</span></label>
                                <input type="text">
                            </div>
                            <div class="col-lg-12">
                                <label>적립금</label>
                                <input type="text">
                            </div>
                            <div class="col-lg-12">
                                <label>상품 재고<span>*</span></label>
                                <input type="text">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="place-order">
                            <h4>추가항목</h4>
                            <div class="row">
                            <div class="col-lg-12">
                                <label>판매단위<span>*</span></label>
                                <input type="text">
                            </div>
                            <div class="col-lg-12">
                                <label>중량/용량</label>
                                <input type="text">
                            </div>
                            <div class="col-lg-12">
                                <label>배송구분<span>*</span></label>
                                <input type="text">
                            </div>
                            <div class="col-lg-12">
                                <label>포장타입<span>*</span></label>
                                <input type="text">
                                <label></label>
                            </div>
                        </div>
                       </div> 
                   </div>
            </div>
           <div class="col-lg-12">
				<div class="row">
                    <div class="col-lg-3.5">
                    	<h4>상품정보고시</h4>
                    </div>
                     <div class="col-lg-8.5">
                        <div class="place-order">
                            <div class="col-lg-12">
                        		<div class="filter-widget">
                        			<div class="fw-size-choose">
                            			<div class="sc-item">
                              				<input type="radio">
                             			    <label for="">ON</label>
                            			</div>
                           				<div class="sc-item">
                               				<input type="radio">
                                			<label for="">OFF</label>
                            			</div>
                            
                      				</div>
                    			</div>
                         	</div> 
                       </div> 
                   </div>
               </div>
          </div>     
                    
           	 <div class="col-lg-12">
                        <div class="checkout-content">
                            <input type="text" placeholder="Enter Your Coupon Code">
                        </div>
                        <div class="place-order">
                        <h4>dd2aa</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>Product <span>Total</span></li>
                                    <li class="fw-normal">Combination x 1 <span>$60.00</span></li>
                                    <li class="fw-normal">Combination x 1 <span>$60.00</span></li>
                                    <li class="fw-normal">Combination x 1 <span>$120.00</span></li>
                                    <li class="fw-normal">Subtotal <span>$240.00</span></li>
                                    <li class="total-price">Total <span>$240.00</span></li>
                                </ul>
                                <div class="payment-check">
                                    <div class="pc-item">
                                        <label for="pc-check">
                                            Cheque Payment
                                            <input type="checkbox" id="pc-check">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="pc-item">
                                        <label for="pc-paypal">
                                            Paypal
                                            <input type="checkbox" id="pc-paypal">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">Place Order</button>
                                </div>
                            </div>
                        </div>
                    </div>
            
            
      </form>
 </div>
                  
<!--                             <div class="col-lg-12"> -->
<!--                                 <div class="create-item"> -->
<!--                                     <label for="acc-create"> -->
<!--                                         Create an account?<br> -->
<!--                                         <input type="checkbox" id="acc-create"> -->
<!--                                         <span class="checkmark"></span> -->
<!--                                     </label> -->
<!--                                 </div> -->
<!--                             </div> -->

                    <div class="loading-more">
                        <i class="icon_loading"></i>
                        <a href="#">
                            Loading More
                        </a>
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
</body>

</html>