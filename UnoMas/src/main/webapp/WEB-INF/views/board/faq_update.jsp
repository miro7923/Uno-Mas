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
        <h3 class="css-1ttk28w eug5r8l0">공지 사항</h3>
        <div class="css-185m8ch e1153ede0">
            <form method="post" action="/board/faq_update">
            <input type="hidden" name="notice_num" value="${vo.notice_num }">
                <div class="css-17bp14q e1vbjq4w3">
                    <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-subject" data-testid="label-text">글쓴이<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                    <div class="css-12l4j2c e1vbjq4w1">
                        <div class="css-1waqr6j e1uzxhvi4">
                            <div height="44" class="css-t7kbxx e1uzxhvi1">
                            <input type="hidden" name="admin_num" value="1">
                            <input data-testid="input-box" id="inquiry-subject" name="admin_name" placeholder="글쓴이" type="text" height="44" class="css-1fapsij e1uzxhvi0" value="관리자" readonly></div>
                        </div>
                    </div>
                </div>
                <div class="css-17bp14q e1vbjq4w3">
                    <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-subject" data-testid="label-text">제목<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                    <div class="css-12l4j2c e1vbjq4w1">
                        <div class="css-1waqr6j e1uzxhvi4">
                            <div height="44" class="css-t7kbxx e1uzxhvi1"><input data-testid="input-box" id="inquiry-subject" name="notice_title" type="text" height="44" class="css-1fapsij e1uzxhvi0" value="${vo.notice_title }"></div>
                        </div>
                    </div>
                </div>
                
                <div class="css-rm6te4 e1fgvk594">
                    <div class="css-17bp14q e1vbjq4w3">
                        <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-contents" data-testid="label-text">내용<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                        <div class="css-12l4j2c e1vbjq4w1">
                            <div class="css-0 e1tjt2bn7">
                                <div class="css-77m6at e1tjt2bn5"><textarea id="inquiry-contents" inputmode="text" aria-label="textarea-message" name="notice_content" class="css-835sfl e1tjt2bn1" >${vo.notice_content }</textarea>
                                    <span class="content-length-counter css-zgkz6w e1tjt2bn0"><span><span class="css-pa1wgl e1tjt2bn2">0자 </span><span class="css-1eqlkgi e1tjt2bn3">/ 500자</span></span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
                
                <div class="css-1spu0j4 ebvrvv11"><button type="submit" class="css-13kn1it ebvrvv10">등록</button></div>
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