<%@page import="com.april.unomas.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
 <!-- 로딩화면 동그라미 -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
     <!-- Header Section Begin -->
    <header class="headerSection">
    <%
    	String vo = (String)session.getAttribute("saveID");
    	String advo = (String)session.getAttribute("saveAID");	
    
    	if(vo == null && advo == null){ // 로그인 안 했을 때 링크
    %>
    	<div id="headerTop" class="headerTop"> <!-- 헤더 맨위쪽 링크 -->
    		<ul class="listMenu">
    			<li class="menu menuLogin">
    				<a href="/UnoMas/user/login" class="linkMenu">로그인</a>
    			</li>
    			<li class="menu menuJoin">
    				<a href="/UnoMas/user/register" class="linkMenu">회원가입</a>
    			</li>
    			<li class="menu CS">
    				<a href="/UnoMas/board/faq_paging" class="linkMenu">고객센터</a>
    			</li>
    		</ul>
    	</div>
    	<%
			} if(vo != null) { // 회원 로그인 했을 때 링크
    	%>	
    	<div id="headerTop" class="headerTop"> 
    		<ul class="listMenu">
    			<li class="menu menuMypage">
    				<a href="/UnoMas/user/mypage" class="linkMenu">마이페이지</a>
    			</li>
    			<li class="menu menuLogout">
    				<a href="/UnoMas/user/logout" class="linkMenu">로그아웃</a>
    			</li>
    			<li class="menu CS">
    				<a href="/UnoMas/board/faq_paging" class="linkMenu">고객센터</a>
    			</li>
    		</ul>
    	</div>
    	<%
			} if (advo != null) { // 관리자 로그인 했을 때 링크
    	%>
    	<div id="headerTop" class="headerTop"> 
    		<ul class="listMenu">
    			<li class="menu menuMypage">
    				<a href="/UnoMas/admin/main" class="linkMenu">관리자페이지</a>
    			</li>
    			<li class="menu menuLogout">
    				<a href="/UnoMas/user/logout" class="linkMenu">로그아웃</a>
    			</li>
    			<li class="menu CS">
    				<a href="/UnoMas/board/faq_paging" class="linkMenu">고객센터</a>
    			</li>
    		</ul>
    	</div>
    	<%
			}
    	%>
    	
    	 <div class="container"> <!-- 로고·검색창·찜·장바구니 -->
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2" style="bottom: 30px;">
                        <div class="logo">
                            <a href="/UnoMas/index">
                                <img src="${path}/resources/img/logo.png" alt="로고">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <button type="button" class="category-btn">All Categories</button>
                            <div class="input-group">
                            	<input type="hidden" value="prod_name" name="search_type" id="search_type_prod">
                                <input type="text" id="keyword_prod" name="keyword" value="" placeholder="검색어를 입력해주세요." >
                                <button type="button" id="sBtn" onclick="search_prod()"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                        	<li class="heart-icon">
                        	    <c:choose>
	                        	    <c:when test="${sessionScope.saveNUM != null }">
		                                <a href="javascript:void(0);" onclick="checkLogin('wish', true)">
		                                    <i class="icon_heart_alt"></i>
		                                </a>
	                        	    </c:when>
	                        	    <c:otherwise>
	                        	        <a href="javascript:void(0);" onclick="checkLogin('wish', false)">
		                                    <i class="icon_heart_alt"></i>
		                                </a>
	                        	    </c:otherwise>
                        	    </c:choose>
                            </li>
                            <li class="cart-icon">
                                <c:choose>
	                                <c:when test="${sessionScope.saveNUM != null }">
		                                <a href="javascript:void(0);" onclick="checkLogin('cart', true)">
		                                    <i class="icon_bag_alt"></i>
		                                </a>
	                                </c:when>
	                                <c:otherwise>
	                                    <a href="javascript:void(0);" onclick="checkLogin('cart', false)">
		                                    <i class="icon_bag_alt"></i>
		                                </a>
	                                </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container"> <!-- 카테고리 내외부 -->
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>전체 카테고리</span>
                        <ul class="depart-hover firstMenu">
                            <li><a href="/UnoMas/product/product_list?cateStart=1&cateEnd=3&topcate_num=1&pageNum=1&dcate_num=0">채소</a>
                            	<ul class="secondMenu">
                            		<li><a href="/UnoMas/product/product_list?cateStart=1&cateEnd=3&topcate_num=1&pageNum=1&dcate_num=1">고구마 · 감자 · 당근</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=1&cateEnd=3&topcate_num=1&pageNum=1&dcate_num=2">양파 · 대파 · 마늘 · 배추</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=1&cateEnd=3&topcate_num=1&pageNum=1&dcate_num=3">냉동 · 이색 · 간편채소</a></li>
                            	</ul>
                            </li>
                            <li><a href="/UnoMas/product/product_list?cateStart=4&cateEnd=6&topcate_num=2&pageNum=1&dcate_num=0">과일 · 견과류 · 쌀</a>
                            	<ul class="secondMenu">
                            		<li><a href="/UnoMas/product/product_list?cateStart=4&cateEnd=6&topcate_num=2&pageNum=1&dcate_num=4">제철과일</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=4&cateEnd=6&topcate_num=2&pageNum=1&dcate_num=5">견과류</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=4&cateEnd=6&topcate_num=2&pageNum=1&dcate_num=6">쌀</a></li>
                            	</ul>
                            </li>
                            <li><a href="/UnoMas/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=0">수산 · 해산 · 건어물</a>
                           		<ul class="secondMenu">
                            		<li><a href="/UnoMas/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=7">해산물</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=8">수산가공품</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=9">김 · 미역</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=7&cateEnd=10&topcate_num=3&pageNum=1&dcate_num=10">건어물</a></li>
                            	</ul>
                            </li>
                            <li><a href="/UnoMas/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=0">정육 · 계란</a>
                           		<ul class="secondMenu">
                            		<li><a href="/UnoMas/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=11">국내산 소고기</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=12">수입산 소고기</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=13">돼지고기</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=14">닭 · 오리고기</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=11&cateEnd=15&topcate_num=4&pageNum=1&dcate_num=15">계란류</a></li>
                            	</ul>
                           	</li>
                            <li><a href="/UnoMas/product/product_list?cateStart=16&cateEnd=18&topcate_num=5&pageNum=1&dcate_num=0">생수 · 우유 · 커피 · 차</a>
                            	<ul class="secondMenu">
                            		<li><a href="/UnoMas/product/product_list?cateStart=16&cateEnd=18&topcate_num=5&pageNum=1&dcate_num=16">생수</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=16&cateEnd=18&topcate_num=5&pageNum=1&dcate_num=17">우유</a></li>
                            		<li><a href="/UnoMas/product/product_list?cateStart=16&cateEnd=18&topcate_num=5&pageNum=1&dcate_num=18">커피 · 차</a></li>
                            	</ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="/UnoMas/product/new_list">신상품</a></li>
                        <li><a href="/UnoMas/product/sale_list">특가</a></li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>

    <script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
   

    <script src="${path}/resources/js/board_js/boardSearch.js"></script>
    <script src="${path}/resources/js/header.js"></script>
