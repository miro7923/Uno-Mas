<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		                 class="_page page_num" onclick="changePageNum(${i.index}, ${pm.endPage - pm.startPage + 1 })">${i.index }</a>
                    </c:forEach>
	                <c:if test="${pm.next == true }">
		                <a href="/order/addr_book?user_num=${sessionScope.saveNUM }&page=${reviewPm.endPage + 1 }" 
		                id="next" class="page_btn_next" style="color: black;"><span class="arrow_carrot-right_alt"></span></a>
	                </c:if>
            	</div>
            </div>
        </div>
    </div>
