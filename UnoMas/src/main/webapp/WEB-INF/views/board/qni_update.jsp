<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<head>

</head>
<!-- Head start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/board_css/inquiry_list.css?after22" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/board_css/inquiry_form.css?after22" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/board_css/board_main.css?after22" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/board_css/board_sub_menu.css?after22" type="text/css">

<!-- Head end -->

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
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Faq Section Begin -->
    <div class="faq-section spad">
        <div class="container">
            <div class="row">
            
                <div class="col-lg-12">
                
                    <div class="faq-accordin">
                        
                        <div class="page_aticle">
    
    
    <div class="css-171zbec eug5r8l1">
        <h3 class="css-1ttk28w eug5r8l0">자주하는 질문</h3>
        <div class="css-185m8ch e1153ede0">
            <form method="post" action="/board/qni_update">
            
                <div class="css-17bp14q e1vbjq4w3">
                    <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-subject" data-testid="label-text">제목<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                    <div class="css-12l4j2c e1vbjq4w1">
                        <div class="css-1waqr6j e1uzxhvi4">
                            <div height="44" class="css-t7kbxx e1uzxhvi1"><input data-testid="input-box" id="inquiry-subject" name="faq_title" placeholder="제목을 적으세요" type="text" height="44" class="css-1fapsij e1uzxhvi0" value="${vo.faq_title }"></div>
                        	<input type="hidden" name="faq_num" value="${vo.faq_num }">
                        </div>
                    </div>
                </div>
                <div class="css-17bp14q e1vbjq4w3">
                    <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-subject" data-testid="label-text">카테고리<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                    <div class="css-12l4j2c e1vbjq4w1">
                        <div class="css-1waqr6j e1uzxhvi4">
                            <div height="44" class="css-t7kbxx e1uzxhvi1">
                            
<!--                             <input data-testid="input-box" placeholder="카테고리를 적으세요" type="text"   > -->
                            <select id="inquiry-subject" name="faq_cate" class="css-1fapsij e1uzxhvi0">
                            	<option value="${vo.faq_cate }">${vo.faq_cate }</option>
                            	<option value="배송/포장">배송/포장</option>
                            	<option value="취소/교환/환불">취소/교환/환불</option>
                            	<option value="이벤트/적립금">이벤트/적립금</option>
                            	<option value="상품">상품</option>
                            	<option value="주문/결제">주문/결제</option>
                            	<option value="회원">회원</option>
                            	<option value="서비스 이용">서비스 이용</option>
                            </select>
                            
                            </div>
                        </div>
                    </div>
                </div>
                <div class="css-rm6te4 e1fgvk594">
                    <div class="css-17bp14q e1vbjq4w3">
                        <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-contents" data-testid="label-text">내용<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                        <div class="css-12l4j2c e1vbjq4w1">
                            <div class="css-0 e1tjt2bn7">
                                <div class="css-77m6at e1tjt2bn5"><textarea id="inquiry-contents" inputmode="text" aria-label="textarea-message" name="faq_content" class="css-835sfl e1tjt2bn1" placeholder="내용을 적으세요">${vo.faq_content }</textarea>
                                    <span class="content-length-counter css-zgkz6w e1tjt2bn0"><span><span class="css-pa1wgl e1tjt2bn2">0자 </span><span class="css-1eqlkgi e1tjt2bn3">/ 500자</span></span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
                
                <div class="css-1spu0j4 ebvrvv11"><button type="submit" class="css-13kn1it ebvrvv10">수정</button></div>
            </form>
        </div>
    </div>
    
    
</div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Faq Section End -->

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
    <script src="${path}/resources/js/board_js/boardMain.js"></script>
    <script src="${path}/resources/js/board_js/boardSearch.js"></script>
</body>

</html>
