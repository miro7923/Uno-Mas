<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
 <!-- 로딩화면 동그라미 -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
     <!-- Header Section Begin -->
    <%
	    String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
    %>
    <header class="headerSection">
    <%
    	if(userID == null){ // 로그인 안 했을 때 링크
    %>
    	<div id="headerTop" class="headerTop"> <!-- 헤더 맨위쪽 링크 -->
    		<ul class="listMenu">
    			<li class="menu menuLogin">
    				<a href="login" class="linkMenu">로그인</a>
    			</li>
    			<li class="menu menuJoin">
    				<a href="register" class="linkMenu">회원가입</a>
    			</li>
    			<li class="menu CS">
    				<a href="qni_paging" class="linkMenu">고객센터</a>
    			</li>
    		</ul>
    	</div>
    	<%
			} else { // 로그인 했을 때 링크
    	%>	
    	<div id="headerTop" class="headerTop"> <!-- 헤더 맨위쪽 링크 -->
    		<ul class="listMenu">
    			<li class="menu menuMypage">
    				<a href="" class="linkMenu">마이페이지</a>
    			</li>
    			<li class="menu menuLogout">
    				<a href="" class="linkMenu">로그아웃</a>
    			</li>
    			<li class="menu CS">
    				<a href="/qni_paing" class="linkMenu">고객센터</a>
    			</li>
    		</ul>
    	</div>
    	<%
			}
    	%>
    	 <div class="headerMiddle"> <!-- 로고·검색창·찜·장바구니 -->
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="index">
                                <img src="${path}/resources/img/logo.png" alt="로고";>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <div class="input-group">
                                <input type="text" placeholder="검색어를 입력해주세요.">
                                <button type="button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                        	<li class="heart-icon">
                                <a href="#">
                                    <i class="icon_heart_alt"></i>
                                </a>
                            </li>
                            <li class="cart-icon">
                                <a href="shopping-cart">
                                    <i class="icon_bag_alt"></i>
                                </a>
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
                            <li><a href="#">채소</a>
                            	<ul class="secondMenu">
                            		<li><a href="#">고구마 · 감자 · 당근</a></li>
                            		<li><a href="#">양파 · 대파 · 마늘 · 배추</a></li>
                            		<li><a href="#">냉동 · 이색 · 간편채소</a></li>
                            	</ul>
                            </li>
                            <li><a href="#">과일 · 견과류 · 쌀</a>
                            	<ul class="secondMenu">
                            		<li><a href="#">제철과일</a></li>
                            		<li><a href="#">견과류</a></li>
                            		<li><a href="#">쌀</a></li>
                            	</ul>
                            </li>
                            <li><a href="#">수산 · 해산 · 건어물</a>
                           		<ul class="secondMenu">
                            		<li><a href="#">해산물</a></li>
                            		<li><a href="#">수산가공품</a></li>
                            		<li><a href="#">김 · 미역</a></li>
                            		<li><a href="#">건어물</a></li>
                            	</ul>
                            </li>
                            <li><a href="#">정육 · 계란</a>
                           		<ul class="secondMenu">
                            		<li><a href="#">국내산 소고기</a></li>
                            		<li><a href="#">수입산 소고기</a></li>
                            		<li><a href="#">돼지고기</a></li>
                            		<li><a href="#">닭 · 오리고기</a></li>
                            	</ul>
                           	</li>
                            <li><a href="#">생수 · 우유 · 커피 · 차</a>
                            	<ul class="secondMenu">
                            		<li><a href="#">생수</a></li>
                            		<li><a href="#">우유</a></li>
                            		<li><a href="#">커피 · 차</a></li>
                            	</ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="product_list">신상품</a></li>
                        <li><a href="product_list">특가</a></li>
                        <li><a href="product_list">공동구매</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>