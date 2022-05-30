<%@page import="com.april.unomas.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!-- 로딩화면 동그라미 -->
<div id="preloder">
	<div class="loader"></div>
</div>
<link rel="stylesheet" href="${path}/resources/css/admin_css/adminHeader.css">
<!-- Header Section Begin -->
<header class="headerSection">
	<%
		String avo = (String) session.getAttribute("saveAID");
		if (avo == null) {
	%>
	<div id="headerTop" class="headerTop"> <!-- 헤더 맨위쪽 링크 -->
    		<ul class="listMenu">
    			<li class="menu menuLogin">
    				<a href="../user/login" class="linkMenu">로그인</a>
    			</li>
    			<li class="menu CS">
    				<a href="../board/faq_paging" class="linkMenu">고객센터</a>
    			</li>
    		</ul>
    	</div>
	<%
		}else {
	%>
	<div id="headerTop" class="headerTop"> 
    		<ul class="listMenu">
    			<li  class="menu menuMypage">
    				<a class="linkMenu">관리자: <%=avo.toString() %></a>
    			</li>
    			<li class="menu menuMypage">
    				<a href="../admin/main" class="linkMenu">관리자페이지</a>
    			</li>
    			<li class="menu menuLogout">
    				<a href="../user/logout" class="linkMenu">로그아웃</a>
    			</li>
    			<li class="menu CS">
    				<a href="../board/faq_paging" class="linkMenu">고객센터</a>
    			</li>
    		</ul>
    	</div>
	<%
		}
	%>
	
	 <div class="container"> <!-- 로고·검색창·찜·장바구니 -->
            <div class="inner-header" style="padding: 0px; margin: 0px auto; padding-bottom: 10px;">
                <div class="row">
                    <div class="col-lg-5 col-md-5">
                    </div>
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="/index">
                                <img src="${path}/resources/img/logo.png" alt="로고">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-5 text-right col-md-5">
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container"> <!-- 카테고리 내외부 -->
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>상품 카테고리</span>
                        <ul class="depart-hover firstMenu">
                            <li><a href="/product/product_list?cateStart=1&cateEnd=3&topcate_num=1&pageNum=1&dcate_num=0">채소</a>
                            	<ul class="secondMenu">
                            		<li><a href="/product/product_list?cateStart=1&cateEnd=3&topcate_num=1&pageNum=1&dcate_num=1">고구마 · 감자 · 당근</a></li>
                            		<li><a href="/product/product_list?cateStart=1&cateEnd=3&topcate_num=1&pageNum=1&dcate_num=2">양파 · 대파 · 마늘 · 배추</a></li>
                            		<li><a href="/product/product_list?cateStart=1&cateEnd=3&topcate_num=1&pageNum=1&dcate_num=3">냉동 · 이색 · 간편채소</a></li>
                            	</ul>
                            </li>
                            <li><a href="/product/product_list?cateStart=4&cateEnd=6&topcate_num=2&pageNum=1&dcate_num=0">과일 · 견과류 · 쌀</a>
                            	<ul class="secondMenu">
                            		<li><a href="/product/product_list?cateStart=4&cateEnd=6&topcate_num=2&pageNum=1&dcate_num=4">제철과일</a></li>
                            		<li><a href="/product/product_list?cateStart=4&cateEnd=6&topcate_num=2&pageNum=1&dcate_num=5">견과류</a></li>
                            		<li><a href="/product/product_list?cateStart=4&cateEnd=6&topcate_num=2&pageNum=1&dcate_num=6">쌀</a></li>
                            	</ul>
                            </li>
                            <li><a href="/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=0">수산 · 해산 · 건어물</a>
                           		<ul class="secondMenu">
                            		<li><a href="/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=7">해산물</a></li>
                            		<li><a href="/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=8">수산가공품</a></li>
                            		<li><a href="/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=9">김 · 미역</a></li>
                            		<li><a href="/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=10">건어물</a></li>
                            	</ul>
                            </li>
                            <li><a href="/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=0">정육 · 계란</a>
                           		<ul class="secondMenu">
                            		<li><a href="/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=11">국내산 소고기</a></li>
                            		<li><a href="/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=12">수입산 소고기</a></li>
                            		<li><a href="/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=13">돼지고기</a></li>
                            		<li><a href="/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=14">닭 · 오리고기</a></li>
                            		<li><a href="/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=15">계란류</a></li>
                            	</ul>
                           	</li>
                            <li><a href="/product/product_list?cateStart=16&cateEnd=18&topcate_num=5&pageNum=1&dcate_num=0">생수 · 우유 · 커피 · 차</a>
                            	<ul class="secondMenu">
                            		<li><a href="/product/product_list?cateStart=16&cateEnd=18&topcate_num=5&pageNum=1&dcate_num=16">생수</a></li>
                            		<li><a href="/product/product_list?cateStart=16&cateEnd=18&topcate_num=5&pageNum=1&dcate_num=17">우유</a></li>
                            		<li><a href="/product/product_list?cateStart=16&cateEnd=18&topcate_num=5&pageNum=1&dcate_num=18">커피 · 차</a></li>
                            	</ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="/product/product_lookup">상품관리</span></a></li>
                        <li><a href="/product/new_list"><span class="menu">신상품목</span></a></li>
                        <li><a href="/product/sale_list"><span class="menu">특가품목</span></a></li>
                        <li><a href="/admin/notice_board"><span class="menu">공지사항</span></a></li>
                        <li><a href="/admin/qna_board"><span class="menu">1:1문의 답변 현황</span></a></li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    
    <script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/js/board_js/boardSearch.js"></script>
    <script src="${path}/resources/js/header.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>