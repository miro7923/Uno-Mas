<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zxx">
<head>
<style type="text/css">
	*,
*:after,
*:before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 0
}

.xans-board-listheader {
    border-top: 2px solid #522772;
    font-size: 13px;
    line-height: 140%
}

.xans-board-listheader tr td {
    padding: 12px;
    border-top: 1px solid #f4f4f4;
    text-align: center;
    vertical-align: middle;
    word-wrap: break-word
}

.xans-board-listheader tbody tr:first-child td {
    border-top: 1px solid #333
}

.xans-board-listheader.jh {
    border-bottom: 1px solid #f4f4f4
}

.xans-board-listheader.jh tr td {
    padding: 20px 0
}


.xans-board-listheader th {
    padding: 20px 0;
    vertical-align: middle;
    font-size: 12px
}

.xans-board-listheader td a {
    color: #555
}
.page_aticle .head_aticle {
    padding: 5px 0 34px
}

.page_aticle .head_aticle .tit {
    height: 36px;
    font-weight: 700;
    font-size: 24px;
    line-height: 36px;
    color: #333;
    letter-spacing: -.5px
}

.page_aticle .head_aticle .tit_sub {
    padding-left: 11px;
    font-size: 14px;
    color: #999;
    line-height: 20px;
    letter-spacing: -.3px;
    vertical-align: 3px
}
.page_article {
    float: right;
}

.layout-pagination {
    margin: 60px 0 0;
    text-align: center
}

.layout-pagination-button {
    display: inline-block;
    width: 34px;
    height: 34px;
    border: 1px solid #ddd;
    border-left: 0;
    vertical-align: top
}

.layout-pagination-button:first-child {
    border-left: 1px solid #ddd
}

.layout-pagination-number {
    font-weight: 700;
    color: #333;
    line-height: 34px
}

.layout-pagination-number:hover,
.layout-pagination-number.__active {
    background-color: #f7f7f7;
    color: #5f0080
}

.layout-pagination-first-page,
.layout-pagination-prev-page,
.layout-pagination-next-page,
.layout-pagination-last-page {
    background-repeat: no-repeat;
    background-position: 50% 50%;
    text-indent: -9999px
}



 

.table_faq {
    border-top: 1px solid #f4f4f4
}

.table_faq tr td {
    padding: 20px 0
}

table {
    font-family: noto sans, malgun gothic, AppleGothic, dotum;
    line-height: 1;
    letter-spacing: -.05em;
    color: #4c4c4c;
    font-size: 12px;
    max-width: 100%
    border-collapse: collapse;
    border-spacing: 0
}

td,
th {
    padding: 0
}

ol,
ul {
    list-style-type: none
}
.page_aticle.aticle_type2 .page_section {
    float: right;
    width: 820px
}
.page_aticle .head_aticle {
    padding: 5px 0 34px
}

.page_aticle .head_aticle .tit {
    height: 36px;
    font-weight: 700;
    font-size: 24px;
    line-height: 36px;
    color: #333;
    letter-spacing: -.5px
}

.page_aticle .head_aticle .tit_sub {
    padding-left: 11px;
    font-size: 14px;
    color: #999;
    line-height: 20px;
    letter-spacing: -.3px;
    vertical-align: 3px
}

.search_date {
    position: relative;
    z-index: 1
}

.search_date .btn_layer {
    overflow: hidden;
    position: absolute;
    right: 0;
    top: -74px;
    width: 157px;
    height: 44px;
    padding: 11px 0 0 15px;
    border: 1px solid #ddd;
    font-size: 14px;
    color: #666;
    line-height: 18px;
    letter-spacing: -.5px
}

.search_date .btn_layer:after {
    content: "";
    position: absolute;
    left: 128px;
    top: 18px;
    width: 12px;
    height: 8px;
    background-size: 12px 8px
}

.search_date .btn_layer.on:after {
    transform: rotate(-180deg);
    -webkit-transform: rotate(-180deg);
    -moz-transform: rotate(-180deg);
    -ms-transform: rotate(-180deg);
    -o-transform: rotate(-180deg)
}

.search_date .layer_search {
    display: none;
    position: absolute;
    right: 0;
    top: -30px;
    width: 157px;
    border: 1px solid #dddfe1;
    border-top: 0
}

.search_date .layer_search li {
    background-color: #fff;
    border-top: 1px solid #dddfe1
}

.search_date .layer_search li:first-child {
    border-top: 0
}

.search_date .layer_search a {
    display: block;
    overflow: hidden;
    height: 32px;
    padding: 7px 0 0 8px;
    font-size: 12px;
    color: #666;
    line-height: 18px;
    letter-spacing: -.2px
}

.search_date .layer_search a.on {
    background-color: #f7f7f7
}
.page_aticle .layout-pagination {
    font-size: 0
}

.page_aticle .layout-pagination a:hover {
    background-color: #f7f7f7
}

.page_aticle .layout-pagination a,
.page_aticle .layout-pagination strong {
    font-weight: 700;
    font-size: 12px
}

.page_aticle .layout-pagination a {
    cursor: pointer
}

.page_aticle .layout-pagination-button:first-child {
    border-left: 0
}

.page_aticle .layout-pagination-first-page:first-child {
    border-left: 1px solid #ddd
}
.css-171zbec {
    width: 820px;
}


.css-1ttk28w {
    padding-bottom: 27px;
    font-weight: 500;
    font-size: 24px;
    line-height: 48px;
    color: rgb(51, 51, 51);
    letter-spacing: -0.5px;
}
.css-185m8ch {
    width: 820px;
    padding: 4px 20px;
    border-top: 2px solid rgb(51, 51, 51);
}
.css-17bp14q {
    display: flex;
    padding: 12px 0px;
    -webkit-box-align: start;
    align-items: start;
}
.css-mm5tap {
    width: 140px;
    font-size: 14px;
    line-height: 44px;
}
.css-hwfcu5 {
    color: red;
}
.css-12l4j2c {
    width: 640px;
}
.css-zjik7 {
    display: flex;
}
.css-1a8mkrv {
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
}
.css-1a8mkrv > div:first-of-type {
    margin-right: 8px;
}
.css-1a8mkrv > div {
    width: 316px;
}
.css-tzsjye {
    display: inline-flex;
    flex-direction: column;
    position: relative;
    min-width: 0px;
    padding: 0px;
    margin: 0px;
    border: 0px;
    vertical-align: top;
    width: 100%;
}
.css-eg1co4 {
    font-family: Roboto, Helvetica, Arial, sans-serif;
    font-weight: 400;
    line-height: 1.4375em;
    letter-spacing: 0.00938em;
    color: rgba(0, 0, 0, 0.87);
    box-sizing: border-box;
    cursor: text;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    position: relative;
    font-size: 14px;
    height: 44px;
    border-color: rgb(221, 221, 221);
    border-radius: 0px;
}
.css-qiwgdb.css-qiwgdb.css-qiwgdb {
    padding-right: 32px;
}

.css-qiwgdb.MuiSelect-select {
    height: auto;
    min-height: 1.4375em;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}

.css-qiwgdb {
    appearance: none;
    user-select: none;
    border-radius: 4px;
    cursor: pointer;
    font: inherit;
    letter-spacing: inherit;
    color: currentcolor;
    border: 0px;
    box-sizing: content-box;
    background: none;
    height: 1.4375em;
    margin: 0px;
    -webkit-tap-highlight-color: transparent;
    display: block;
    min-width: 0px;
    width: 100%;
    animation-name: mui-auto-fill-cancel;
    animation-duration: 10ms;
    padding: 16.5px 14px;
}

.css-1k3x8v3 {
    bottom: 0px;
    left: 0px;
    position: absolute;
    opacity: 0;
    pointer-events: none;
    width: 100%;
    box-sizing: border-box;
}
.css-1636szt {
    user-select: none;
    width: 1em;
    height: 1em;
    display: inline-block;
    fill: currentcolor;
    flex-shrink: 0;
    transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    font-size: 1.5rem;
    position: absolute;
    right: 7px;
    top: calc(50% - 0.5em);
    pointer-events: none;
    color: rgba(0, 0, 0, 0.54);
}
.jss1 .MuiOutlinedInput-notchedOutline {
    border-color: #ddd !important;
}
.css-1a8mkrv {
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
}
.css-17bp14q {
    display: flex;
    padding: 12px 0px;
    -webkit-box-align: start;
    align-items: start;
}

.css-rm6te4 > div > div:first-of-type {
    padding-top: 5px;
}
.css-mm5tap {
    width: 140px;
    font-size: 14px;
    line-height: 44px;
}
.css-12l4j2c {
    width: 640px;
}
.css-77m6at {
    position: relative;
    display: flex;
    flex-direction: column;
    height: 496px;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(221, 221, 221);
    border-radius: 4px;
}
.css-rm6te4 textarea {
    font-family: "Noto Sans", sans-serif;
}
.css-835sfl {
    display: block;
    width: 100%;
    height: 100%;
    padding: 15px 16px;
    font-size: 15px;
    line-height: 1.43;
    word-break: break-all;
    z-index: 1;
    background: none;
    border-radius: 4px;
    color: rgb(51, 51, 51);
    outline: none;
    resize: none;
    border: none;
}
.css-1ofzfyp {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    padding: 15px 15px 32px;
}
.css-zgkz6w {
    padding: 0px 16px 13px;
    font-size: 12px;
    text-align: right;
}
.css-17bp14q {
    display: flex;
    padding: 12px 0px;
    -webkit-box-align: start;
    align-items: start;
}
.css-v3zc4x {
    border-top: 1px solid rgb(221, 221, 221);
    border-bottom: 1px solid rgb(221, 221, 221);
}
.css-1spu0j4 {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    padding-top: 40px;
}
.css-1g24b18 {
    position: absolute;
    width: 80px;
    right: 20px;
    top: 346.5px;
    font-size: 12px;
    line-height: 16px;
    color: rgb(51, 51, 51);
    letter-spacing: -0.3px;
    transition: top 0.2s ease 0s;
    z-index: 1;
}


</style>

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
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>FAQs</span>
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
            <form method="post">
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
                            <div height="44" class="css-t7kbxx e1uzxhvi1"><input data-testid="input-box" id="inquiry-subject" name="notice_title" placeholder="제목을 입력하세요" type="text" height="44" class="css-1fapsij e1uzxhvi0"></div>
                        </div>
                    </div>
                </div>
                
                <div class="css-rm6te4 e1fgvk594">
                    <div class="css-17bp14q e1vbjq4w3">
                        <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-contents" data-testid="label-text">내용<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                        <div class="css-12l4j2c e1vbjq4w1">
                            <div class="css-0 e1tjt2bn7">
                                <div class="css-77m6at e1tjt2bn5"><textarea id="inquiry-contents" inputmode="text" aria-label="textarea-message" name="notice_content" class="css-835sfl e1tjt2bn1" placeholder="내용을 입력하세요"></textarea>
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
    
</body>

</html>