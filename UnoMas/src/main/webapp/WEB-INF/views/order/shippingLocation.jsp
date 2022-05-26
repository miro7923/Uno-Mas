<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko" style="margin: 0px; padding: 0px; height: 100%; overflow: hidden;">
<head>
<title>배송지 목록</title>
<!--
<meta name="viewport"
	content="user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width">
-->
	<link rel="stylesheet" href="${path}/resources/css/themify-icons.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/elegant-icons.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/order_css/shippingLocation.css">
</head>

<body
	style="margin: 0px; padding: 0px; height: 100%; width: 100%; overflow: hidden;">
<!--
	<iframe frameborder="0" title="우편번호검색프레임" id="__daum__viewerFrame_1"
		src="http://postcode.map.daum.net/search?origin=http%3A%2F%2Flocalhost%3A8090&amp;indaum=off&amp;banner=on&amp;ubl=on&amp;mode=transmit&amp;vt=popup&amp;amr=on&amp;amj=on&amp;ani=off&amp;sd=on&amp;fi=on&amp;fc=on&amp;plrg=&amp;plrgt=1.5&amp;hmb=off&amp;heb=off&amp;asea=off&amp;smh=off&amp;zo=on&amp;us=on&amp;msi=10&amp;ahs=off&amp;whas=500&amp;sm=on&amp;a51=off&amp;zn=Y&amp;fullpath=%2Forder%2Forder"
		style="border: 0 none; margin: 0; width: 100%; height: 100%; min-width: 300px; overflow: hidden; padding: 0"></iframe>
-->
    <!-- @@@@@@@ 배송지 선택하면 주문 화면에서 신규배송지 탭에 출력되게 하기 -->
    <div id="pop_wrap">
        <div id="pop_header">
            <h1 class="h1">배송지 목록</h1>
        </div>
        <div id="pop_container">
            <div id="pop_content">
                <div class="delivery_list_area">
                    <input type="hidden" value="${sessionScope.saveNUM }" id="user_num">
                    <input type="hidden" value="${curPage }" id="curPage">
                    <table class="tbl_delivery_list">    
                        <colgroup width="100%">
                            <col style="width: 140px;">
                            <col style="width: auto;">
                            <col style="width: 150px;">
                            <col style="width: 148px;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>배송지</th>
                                <th>주소</th>
                                <th>연락처</th>
                                <th>선택</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${primaryAddr != null }">
	                            <tr page="1" class="_address default" style="display: table-row;">
	                                <td class="cell_delivery">
	                                    <span class="_addressName nick">${primaryAddr.addr_name }</span>
	                                    <strong class="_receiverName name">${primaryAddr.addr_recipient }</strong>
	                                    <span class="mark_default">기본배송지</span>
	                                </td>
	                                <td>
	                                    <span class="_zipCode zipcode">${primaryAddr.addr_postalcode }</span>
	                                    <span class="_baseAddress">${primaryAddr.addr_roadaddr }</span><br>
	                                    <span class="_detailAddress">${primaryAddr.addr_detailaddr }</span>
	                                    <span class="_roadNameYn" style="display:none;">Y</span>
	                                </td>
	                                <td class="cell_tel"><span class="_telNo1">${fn:substring(primaryAddr.addr_phone, 0, 3) } - ${fn:substring(primaryAddr.addr_phone, 3, 7) } - ${fn:substring(primaryAddr.addr_phone, 7, 11) }</span><br><span class="_telNo2"></span></td>
	                                <td class="cell_btn">
	                                    <button type="button" class="_select setting_btn type_h green">선택</button>
	                                </td>
	                            </tr>
                            </c:if>
                            <c:forEach var="addrVO" items="${orderAddrList }">
                                <c:if test="${addrVO.addr_primary == false }">
	                                <tr page="1" class="_address default" style="display: table-row;">
		                                <td class="cell_delivery">
		                                    <span class="_addressName nick">${addrVO.addr_name }</span>
		                                    <strong class="_receiverName name">${addrVO.addr_recipient }</strong>
		                                </td>
		                                <td>
		                                    <span class="_zipCode zipcode">${addrVO.addr_postalcode }</span>
		                                    <span class="_baseAddress">${addrVO.addr_roadaddr }</span><br>
		                                    <span class="_detailAddress">${addrVO.addr_detailaddr }</span>
		                                    <span class="_roadNameYn" style="display:none;">Y</span>
		                                </td>
		                                <td class="cell_tel"><span class="_telNo1">${fn:substring(addrVO.addr_phone, 0, 3) } - ${fn:substring(addrVO.addr_phone, 3, 7) } - ${fn:substring(addrVO.addr_phone, 7, 11) }</span><br><span class="_telNo2"></span></td>
		                                <td class="cell_btn">
		                                    <button type="button" class="_select setting_btn type_h green">선택</button>
		                                </td>
		                            </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="setting_paginate">
                    <c:if test="${pm.prev == true }">
		                <a href="/order/addr_book?user_num=${sessionScope.saveNUM }&page=${reviewPm.startPage - 1 }" 
		                id="prev" class="page_btn_prev" style="color: black;"><span class="arrow_carrot-left_alt"></span></a>
                    </c:if>
                    <c:forEach var="page" varStatus="i" begin="${pm.startPage }" end="${pm.endPage }" step="1">
		                <a href="javascript:void(0);" id="page${i.index }" style="color: black;" 
		                 class="_page page_num" onclick="changePageNum(${i.index}, ${pm.endPage - pm.startPage + 1 })">${page }</a>
                    </c:forEach>
	                <c:if test="${pm.next == true }">
		                <a href="/order/addr_book?user_num=${sessionScope.saveNUM }&page=${reviewPm.endPage + 1 }" 
		                id="next" class="page_btn_next" style="color: black;"><span class="arrow_carrot-right_alt"></span></a>
	                </c:if>
            	</div>
            </div>
        </div>
    </div>

    <div id="pop_footer">
        <button type="button" class="button" onclick="javascript:window.close();return false;">닫기</button>
    </div>
    
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/jquery-ui.min.js"></script>
	<script src="${path}/resources/js/jquery.countdown.min.js"></script>
	<script src="${path}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${path}/resources/js/jquery.zoom.min.js"></script>
	<script src="${path}/resources/js/jquery.dd.min.js"></script>
	<script src="${path}/resources/js/jquery.slicknav.js"></script>
	<script src="${path}/resources/js/owl.carousel.min.js"></script>
    <script src="${path}/resources/js/order_js/shippingLocation.js"></script>
</body>
</html>