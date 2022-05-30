<%@page import="com.april.unomas.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!-- 로딩화면 동그라미 -->
<div id="preloder">
	<div class="loader"></div>
</div>

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
    			<%=avo.toString() %>님 환영합니다
    			<li class="menu menuMypage">
    				<a href="../admin/main" class="linkMenu">관리자페이지</a>
    			</li>
    			<li class="menu menuLogout">
    				<a href="../user/logout" class="linkMenu">로그아웃</a>
    			</li>
    		</ul>
    	</div>
	<%
		}
	%>

</header>