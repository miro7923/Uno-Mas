# JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 19 - 주문시 베송지 목록 새 창에서 선택된 배송지 정보 가져오는 기능 추가

* 작성일 : 2022.05.27
* 작성자 : 황유진

* 팀원 : 김진영, 박승지, 반현빈, 오성은, 오은현, 황유진
* 팀장 : 황유진
* 부팀장 : 오성은
* GitHub Repository : [https://github.com/miro7923/Uno-Mas](https://github.com/miro7923/Uno-Mas)<br><br><br>

# 개발환경
* MacBook Air (M1, 2020)
* OpenJDK 8
* Spring Tool Suite 4.14.0
* Spring framework 4.3.1.RELEASE
* Tomcat 8.5
* MySQL Workbench 8.0.19<br><br><br>

# 기간
* 2022.4.13 ~ 2022.5.27<br><br><br>

# 주제
* 웹 백엔드 수업 중 마지막 과제로 팀 프로젝트를 진행하게 되었다.
* 조건은 `Spring` 기반으로 웹 사이트를 제작하는 것이다.
* 총 팀원은 6명이며, 우리 팀은 `1인 가구를 위한 쇼핑몰`을 주제로 정했다.
* 팀 이름으로 정해진 `Uno más`는 스페인어로 `하나 더`라는 뜻이다. <br><br><br>

# 진행상황 

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_addrList1.png" width="500"></p>

* 쇼핑몰의 상품을 주문하는 페이지에서 배송지 목록 버튼을 클릭하면

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_addrList2.png" width="900"></p>

* 배송지를 선택할 수 있는 새 창을 띄우고, 여기서 선택한 주소를 주문 페이지에 입력하는 기능을 추가했다.

## shippingLocation.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko" style="margin: 0px; padding: 0px; height: 100%; overflow: hidden;">
<head>
<title>배송지 목록</title>
	<link rel="stylesheet" href="${path}/resources/css/themify-icons.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/elegant-icons.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/order_css/shippingLocation.css">
</head>

<body
	style="margin: 0px; padding: 0px; height: 100%; width: 100%; overflow: hidden;">
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
	                                    <span class="_addressName nick" id="addr_nameP">${primaryAddr.addr_name }</span>
	                                    <strong class="_receiverName name" id="addr_recipientP">${primaryAddr.addr_recipient }</strong>
	                                    <span class="mark_default">기본배송지</span>
	                                </td>
	                                <td>
	                                    <span class="_zipCode zipcode" id="addr_postalcodeP">${primaryAddr.addr_postalcode }</span>
	                                    <span class="_baseAddress" id="addr_roadaddrP">${primaryAddr.addr_roadaddr }</span><br>
	                                    <span class="_detailAddress" id="addr_detailaddrP">${primaryAddr.addr_detailaddr }</span>
	                                    <span class="_roadNameYn" style="display:none;">Y</span>
	                                </td>
	                                <td class="cell_tel">
	                                    <span class="_telNo1">${fn:substring(primaryAddr.addr_phone, 0, 3) } - ${fn:substring(primaryAddr.addr_phone, 3, 7) } - ${fn:substring(primaryAddr.addr_phone, 7, 11) }</span><br><span class="_telNo2"></span>
	                                    <input type="hidden" value="${primaryAddr.addr_phone }" id="addr_phoneP">
	                                </td>
	                                <td class="cell_btn">
	                                    <button type="button" class="_select setting_btn type_h green" onclick="chooseLocation('P')">선택</button>
	                                </td>
	                            </tr>
                            </c:if>
                            <c:forEach var="addrVO" items="${orderAddrList }" varStatus="i">
                                <tr page="1" class="_address default" style="display: table-row;">
	                                <td class="cell_delivery">
	                                    <span class="_addressName nick" id="addr_name${i.index }">${addrVO.addr_name }</span>
	                                    <strong class="_receiverName name" id="addr_recipient${i.index }">${addrVO.addr_recipient }</strong>
	                                </td>
	                                <td>
	                                    <span class="_zipCode zipcode" id="addr_postalcode${i.index }">${addrVO.addr_postalcode }</span>
	                                    <span class="_baseAddress" id="addr_roadaddr${i.index }">${addrVO.addr_roadaddr }</span><br>
	                                    <span class="_detailAddress" id="addr_detailaddr${i.index }">${addrVO.addr_detailaddr }</span>
	                                    <span class="_roadNameYn" style="display:none;">Y</span>
	                                </td>
	                                <td class="cell_tel">
	                                    <span class="_telNo1">${fn:substring(addrVO.addr_phone, 0, 3) } - ${fn:substring(addrVO.addr_phone, 3, 7) } - ${fn:substring(addrVO.addr_phone, 7, 11) }</span><br><span class="_telNo2"></span>
	                                    <input type="hidden" value="${addrVO.addr_phone }" id="addr_phone${i.index }">
	                                </td>
	                                <td class="cell_btn">
	                                    <button type="button" class="_select setting_btn type_h green" onclick="chooseLocation(${i.index})">선택</button>
	                                </td>
	                            </tr>
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
```

* 페이지 템플릿은 네이버 쇼핑의 배송지 목록 템플릿을 참고해서 만들었다.(사실상 그냥 긁어왔...)
* 태그의 클래스 선택자 이름이 출력하는 내용물의 용도에 맞게 지정되어 있어서 데이터를 넣는 `JSTL` 표현식을 쓸 때 정말 편했다. 역시 대기업은 다르다.

## order.jsp

```jsp
<button type="button" class="site-btn deliverListBtn"
    onclick="window.open('/order/addr_book?user_num=${sessionScope.saveNUM}&pageNum=1');">배송지 목록</button>
```

* 주문페이지에서 `배송지목록` 버튼을 클릭하면 이 템플릿 페이지가 새 창에서 열리도록 했다.

## shippingLocation.jsp

```jsp
<button type="button" class="_select setting_btn type_h green" onclick="chooseLocation(${i.index})">선택</button>
```

* 배송지 목록 페이지에서 배송지를 선택하면 해당 배송지 데이터를 주문 페이지에 입력하는 메서드가 실행된다. 

## shippingLocation.js

```javascript
function chooseLocation(num) {
    // 신규배송지로 라디오버튼 선택 변경
    window.opener.$('input:radio[name=deliverSpot]:radio[value="2"]').prop('checked', true);
    window.opener.$('#normalAddr').hide();
    window.opener.$('#newAddr').show(); 

    // 각 인풋태그값 세팅
    window.opener.$('#newName').val($('#addr_recipient'+num).text());
    window.opener.$('#newPhone1').val($('#addr_phone'+num).val().substring(0, 3));
    window.opener.$('#newPhone2').val($('#addr_phone'+num).val().substring(3, 7));
    window.opener.$('#newPhone3').val($('#addr_phone'+num).val().substring(7, 11));
    window.opener.$('#newPhone').val($('#addr_phone'+num).val());
    window.opener.$('#newPostalcode').val($('#addr_postalcode'+num).text());
    window.opener.$('#newRoadAddress').val($('#addr_roadaddr'+num).text());
    window.opener.$('#newDetailAddress').val($('#addr_detailaddr'+num).text());

    window.close();
}
```

* `window.opener` 메서드를 사용해 이 창을 연 부모 창에 데이터가 전달되도록 했다.

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_addrList3.png" width="500"></p>

* 구현 완료~!<br><br><br>

# 구현하며 했던 고민
* 이번 기능을 구현해 본 적이 없어서 처음에 검색 키워드를 뭘로 해야 할 지 고민했었다. 평소 많이 보던 기능인데 뭐라 쳐야 관련 자료가 나올지 모르겠는 그런 느낌...ㅎ 쇼핑몰 배송지 목록 새창 이런 식으로 검색하면서 관련 자료를 찾았던 것 같다.<br><br><br>

# 마감까지
* `D-0`<br><br><br>

# 참고
* [[JQuery] AJAX테이블 생성 후 팝업창 데이터 전달&인쇄 방법!! (영상 有)](https://chobopark.tistory.com/247)
