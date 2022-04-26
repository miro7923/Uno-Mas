---
title: JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 5 - 카테고리별 상품 목록 페이지, 신상품 목록 페이지, 특가 목록 페이지 제작
toc: true
toc_sticky: true
toc_label: 목차
published: true
categories:
    - Uno mas
tags:
    - Project
    - UnoMas
    - Log
---

* 작성일 : 2022.04.26
* 작성자 : 황유진
* 팀원 : 김진영, 박승지, 반현빈, 오성은, 오은현, 윤정환, 황유진
* GitHub Repository : [https://github.com/miro7923/Uno-Mas](https://github.com/miro7923/Uno-Mas)<br><br><br>

# 개발환경
* MacBook Air (M1, 2020)
* OpenJDK 8
* Spring Tool Suite 4.14.0
* Spring framework 4.3.1.RELEASE
* Tomcat 8.5
* MySQL Workbench 8.0.19<br><br><br>

# 기간
* 2022.4.13 ~ 2022.5.20<br><br><br>

# 주제
* 웹 백엔드 수업 중 마지막 과제로 팀 프로젝트를 진행하게 되었다.
* 조건은 `Spring` 기반으로 웹 사이트를 제작하는 것이다.
* 총 팀원은 7명이며, 우리 팀은 `1인 가구를 위한 쇼핑몰`을 주제로 정했다.
* 팀 이름으로 정해진 `Uno más`는 스페인어로 `하나 더`라는 뜻이다. <br><br><br>

# 진행상황 1 - 상품 목록 페이지 frontend
## productList.jsp
* 사용자 입장에서 전체 상품 목록을 볼 수 있는 페이지를 만들었다.

### 상단 카테고리 노출

<p align="center"><img src="https://miro7923.github.io/assets/images/productListCategory.png" width="800"></p>

```jsp
<div class="categoryBox">
    <h3 class="title"><%=category%></h3>
    <ul class="categoryList">
        <% for (int i = 0; i < subCategory.length; i++) { %>
        <li><a class="category" id="category<%=i%>" onclick="changeSort(<%=i%>, <%=subCategory.length%>);"> <%=subCategory[i]%></a></li>
        <% } %>
    </ul>
</div>
<div class="product-show-option">
    <div class="row">
        <div class="col-lg-12 col-md-12 text-right">
            <p>총 <%=cnt%>개</p>
        </div>
    </div>
</div>
```

* 마켓컬리의 상품 목록 페이지를 참고해서 만들었다.
* 페이지의 상단에서는 카테고리별로 분류해서 볼 수 있도록 했다.
* 페이지 하나로 여러 카테고리에 돌려쓸 수 있게 상품 카테고리에 따라 페이지 제목을 다르게 출력하도록 틀을 만들었다. 추후 이전 페이지에서 받아온 파라미터로 DB에서 카테고리 정보를 조회해 와서 출력할 것이다.

### productList.js

```javascript
$(document).ready(function() {
    $('#category0').css('color', '#dea234');
    $('#category0').css('font-weight', 'bold');
    $('#page1').css('font-weight', 'bold');
});

function changeSort(num, maxNum) {
    var id = '#category' + num;
    
    $(id).css('color', '#dea234');
    $(id).css('font-weight', 'bold');
    
    for (var i = 0; i < maxNum; i++) {
        if (num == i) continue;
        
        id = '#category' + i;
        $(id).css('color', '#212529');
        $(id).css('font-weight', '');
    }
}
```

* 카테고리 클릭시 강조 표시가 바뀌는 것은 자바스크립트로 제어했다.
* 현재 선택된 id만 강조시키고 그렇지 않은 것들은 강조 표시를 해제하도록 했다.

### 상품 목록 노출

<p align="center"><img src="https://miro7923.github.io/assets/images/productListBody.png" width="800"></p>

```jsp
<div class="product-list">
    <div class="row">
    <% for (int i = 0; i < 9; i++) { %>
    <div class="col-lg-4 col-sm-6">
        <div class="product-item" id="productItem">
            <div class="pi-pic">
                <a href="product_detail"> <img src="${path}/resources/img/product-single/product_vegi01.jpeg" alt=""></a>
                <ul>
                    <!-- 카트담기 버튼 -->
                    <li class="w-icon active">
                        <a href="#"><i class="icon_bag_alt"></i></a>
                    </li>
                </ul>
            </div>
            <div class="pi-text">
                <a href="#">
                    <h5>청경채</h5>
                </a>
                <div class="product-price">
                    2,190원
                </div>
                <div class="productSubTitle">
                    아삭하고 부드러운
                </div>
            </div>
        </div>
    </div>
    <% } %>
    </div>
</div>
```

* 한 줄에 3개씩 3줄 출력하도록 했다.
* 상품 사진 위에 마우스 오버하면 장바구니 버튼이 노출되는데 이건 템플릿에 있는 것을 그대로 썼다.

### 하단 페이지 버튼

<p align="center"><img src="https://miro7923.github.io/assets/images/productListPageBtn.png" width="300"></p>

```jsp
<div class="row" id="pagediv">
    <div class="col-lg-12 text-center">
        <% if (startBlock > pageBlockCnt) { %>
        <a href="#" class="arrow_carrot-2left_alt pagingBtn" id="toFirst"></a> 
        <a href="#" class="arrow_carrot-left_alt pagingBtn" id="prev"></a> 
        <% }
            for (int i = startBlock; i <= endBlock; i++) { %>
        <span>
        <!----> <a class="pagingBtn" id="page<%=i%>" onclick="changePageNum(<%=i%>, <%=endBlock%>);"><%=i %> <!----></a>
        </span> 
        <% }
            if (endBlock < pageBlockCnt) { %> 
            <a href="#" class="arrow_carrot-right_alt pagingBtn" id="next"></a> 
            <a href="#" class="arrow_carrot-2right_alt pagingBtn" id="toLast"></a>
        <% } %>
    </div>
</div>
```

* 전체 글 개수에 따라 페이지 버튼이 생성되고 누르면 해당 페이지로 이동할 수 있는 틀을 만들었다.
* DB 연결되면 추가 수정할 예정
* 페이지 버튼 또한 클릭하면 강조 표시가 되게 만들었는데 위에서 카테고리를 선택하면 강조 표시가 되는 것과 동일한 로직으로 만들었다.<br><br>

# 진행상황 2 - 신상품 목록 페이지

<p align="center"><img src="https://miro7923.github.io/assets/images/newProductListPage.png" width="800"></p>

* 신상품 목록 페이지는 상품 목록 페이지를 복사해서 만들었다. 거기서 상단의 카테고리 출력란만 없앴다.<br><br>

# 진행상황 3 - 특가 상품 목록 페이지

<p align="center"><img src="https://miro7923.github.io/assets/images/saleProductListPage.png" width="800"></p> 

* 특가 상품 목록 페이지는 신상품 목록 페이지를 복사해서 만들었다. 할인하는 상품을 보여주는 페이지이기 때문에 할인율과 가격이 출력되도록 했다.<br><br><br>

# 마감까지
* `D-24`
