# JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 4 - 상품 상세 페이지, 리뷰 작성 페이지, 문의 작성 페이지 제작

* 작성일 : 2022.04.25
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

# 진행상황 1 - 상품 상세 페이지 frontend
## productDetail.jsp
* 메인으로 사용하기로 한 템플릿을 약간 수정해서 상품 상세 정보를 보여주는 페이지를 만들었다.

### 메인 이미지와 요약 정보 출력 부분

```jsp
<section class="product-shop spad page-details">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product-pic-zoom">
                            <img class="product-big-img"
                                src="${path}/resources/img/product-single/product_vegi01.jpeg"
									alt="">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product-details">
                            <div class="pd-title">
                                <h3>청경채</h3>
                            </div>
                            <div class="pd-desc">
                                <p>아삭하고 부드러운</p>
                            </div>
                            <div class="pd-desc">
                                <h5 class="priceText top">
                                    <span id="price">2,190</span> 원
                                </h5>
                                <p class="memberInfo">로그인 후, 적립혜택이 제공됩니다.</p>
                            </div>
                            <div class="pd-tags">
                                <dl class="list first">
                                    <dt class="title">판매단위</dt>
                                    <dd class="description">1팩</dd>
                                </dl>
                                <dl class="list">
                                    <dt class="title">중량/용량</dt>
                                    <dd class="description">300g</dd>
                                </dl>
                                <hr>
                                <dl class="list">
                                    <dt class="title">배송구분</dt>
                                    <dd class="description">택배배송</dd>
                                </dl>
                                <hr>
                                <dl class="list">
                                    <dt class="title">원산지</dt>
                                    <dd class="description">국산</dd>
                                </dl>
                                <hr>
                                <dl class="list">
                                    <dt class="title">포장타입</dt>
                                    <dd class="description">냉장/스티로품</dd>
                                </dl>
                                <hr>
                                <dl class="list">
                                    <div class="quantity">
                                        <dt class="title">구매수량</dt>
                                        <div class="pro-qty">
                                            <input type="text" value="1">
                                        </div>
                                        <br>
                                    </div>
                                </dl>
                            </div>
                            <div class="pd-desc">
                                <h5 class="priceText">
                                    총 상품금액 : <span id="price">2,190</span> 원
                                </h5>
                            </div>
                            <div class="quantity">
                                <!-- 회원의 위시리스트에 이 상품번호가 추가되어 있으면 까만 하트가 기본값 -->
                                <!-- @@ 클릭시 ajax로 DB 통신해서 위시리스트 추가하고 알림창 띄운 뒤 화면 새로고침 @@ -->
                                <%if (isInWishlist) { %>
                                    <button class="icon_heart" id="wishlistBtnFull" 
                                        onclick="toggleWishlistBtn();"></button>
                                <% }
                                    else { %>
                                    <button class="icon_heart_alt" id="wishlistBtnEmpty" 
                                        onclick="toggleWishlistBtn();"></button>
                                <% } %>
                                <a href="shopping-cart" class="primary-btn pd-cart">장바구니 담기</a>
                            </div>
                        </div>
                    </div>
                </div>
```

* 전체적인 디자인은 마켓컬리의 상품 상세 페이지 디자인을 참고했다.

<p align="center"><img src="https://miro7923.github.io/assets/images/prodDetailMain.png" width="800"></p>

### 상품 설명 출력 부분

```jsp
<div class="product-tab">
    <div class="tab-item">
        <ul class="nav" role="tablist">
            <li><a class="active" data-toggle="tab" href="#tab-1"
                   role="tab">상품설명</a></li>
            <li><a data-toggle="tab" href="#tab-2" role="tab">상세정보</a></li>
            <!-- @@ 후기 개수에 따라 () 안에 숫자 출력하기 @@ -->
            <li><a data-toggle="tab" href="#tab-3" role="tab" onclick="toggleReview(0);">후기(02)</a></li>
            <li><a data-toggle="tab" href="#tab-4" role="tab" onclick="toggleQna(0);">문의</a></li>
        </ul>
    </div>
    <div class="tab-item-content">
        <div class="tab-content">
            <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                <div class="product-content">
                    <div class="col-lg-12">
                        <img src="${path}/resources/img/product-single/product_vegi02.webp" alt="">
                    </div>
                    <br> <br>
                    <div class="row">
                        <div class="text-center col-lg-12">
                            <!-- id 선택자 지정된 부분만 디비에서 불러와서 채우면 됨 -->
                            <h3 class="detailSubTitle" id="detailSubTitle">아삭하고 부드러운</h3>
                            <h1 class="detailTitle" id="detailTitle">청경채</h1>
                            <br>
                            <hr>
                            <p class="detailMainContent" id="detailMainContent">청경채는 잎과 줄기가 붙어 자라는 한 포기 쌈채소에요. 아삭하면서도 싱그러운 식감이 매력적이지만, 살짝 데치거나 볶아주면 새로운 풍미를 선사해요. 신선한 청경채를 Uno más를 통해 만나보세요.</p>
                            <br> <br> <br> <br> <br> <br>
                            <hr>
                            <h3 class="detailOtherTitle">재료와 성분</h3>
                            <p class="detailOtherContent" id="ingredient">비타민 C, 칼륨, 칼슘 풍부</p>
                            <h3 class="detailOtherTitle">활용법</h3>
                            <ul class="recomendation">
                                <!-- 추후 DB에서 불러와 상품별로 다르게 출력 -->
                                <li class="detailOtherContent" id="recomendation1">중화풍 요리, 샤브샤브 재료로 활용</li>
                                <li class="detailOtherContent" id="recomendation2">다양한 볶음, 무침으로 만들어도 OK</li>
                                <li class="detailOtherContent" id="recomendation3">1인 가구도 부담없이 사용하기 좋은 양</li>
                            </ul>
                            <h3 class="detailOtherTitle">보관법</h3>
                            <p class="detailOtherContent" id="ingredient">세척하지 않은 상태로 비닐 팩에 담은 뒤, 냉장고 채소칸에 보관하세요.</p>
                            <h3 class="detailOtherTitle">세척법</h3>
                            <p class="detailOtherContent" id="ingredient">사용할 만큼만 꺼내 흐르는 물로 깨끗이 세척하세요.</p>
                        </div>
                    </div>
                    <br> <br>
                </div>
            </div>
```

* 상세 설명란은 기본 템플릿이 탭 형식으로 제작되어 있었기 때문에 그대로 활용했다.

### 리뷰 게시판

```jsp
<div class="tab-pane fade" id="tab-3" role="tabpanel">
    <div class="customer-review-option">
        <h4>PRODUCT REVIEW</h4>
        <ul class="productReivewTitle">
            <li><span data-icon="&#x5e"></span> 상품에 대한 후기를 남기는
                    공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
            <li><span data-icon="&#x5e"></span> 배송관련, 주문(취소/교환/환불)관련
                    문의 및 요청사항은 마이페이지 내 <!-- @@ 1:1 문의글 작성 페이지 링크로 수정 @@ --> <span
                                onclick="window.parent.location.href = '/mypage/my_QnA'"
                                class="personalInquiry">1:1 문의</span>에 남겨주세요.</li>
        </ul>
        <div class="comment-option">
            <table class="reviewTable" width="100%" border="0" cellpadding="0" cellspacing="0">
                <caption style="display: none">구매후기 제목</caption>
                <colgroup>
                    <col style="width: 110px;">
                    <col style="width: auto;">
                    <col style="width: 77px;">
                    <col style="width: 100px;">
                    <col style="width: 50px;">
                    <col style="width: 80px;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th align="left">작성자</th>
                        <th>작성일</th>
                        <th>좋아요</th>
                        <th>조회</th>
                    </tr>
                </tbody>
            </table>
            <!-- 반복문으로 리뷰글 출력 부분 -->
            <%
                for (int i = 0; i < 7; i++) {
            %>
            <table class="reviewTable" width="100%" border="0" cellpadding="0" cellspacing="0">
                <caption style="display: none">구매후기 제목</caption>
                <colgroup>
                    <col style="width: 110px;">
                    <col style="width: auto;">
                    <col style="width: 77px;">
                    <col style="width: 100px;">
                    <col style="width: 50px;">
                    <col style="width: 80px;">
                </colgroup>
                <tbody>
                    <tr onmouseover="this.style.background='#f0f0f0'"
                        onmouseout="this.style.background='white'">
                        <td><%=i + 1%></td>
                        <td align="left" class="reviewTitle"
                            onclick="toggleReview(<%=i+1%>);">리뷰 <%=i + 1%></td>
                        <td align="left">UnoMas</td>
                        <td>2022-04-22</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                </tbody>
            </table>
            <div class="reviewContent" id="reviewContent<%=i+1%>">
                <p>평점 : <span><%=scores[i] %> / 5.0</span></p>
            </div>
            <%
                }
            %>
            <div class="col-lg-12 reviewBtnArea">
                <button type="submit" class="site-btn" onclick="location.href='review_writing_form';">
                    후기쓰기
                </button>
            </div>
        </div>
    </div>
</div>
```

* 리뷰 게시판과 문의 게시판은 이런 형식으로 만들었다.

<p align="center"><img src="https://miro7923.github.io/assets/images/reviewBoard.png" width="800"></p>

* 아직 DB 테이블을 생성하지 않았기 때문에 나중에 연결 후 게시글 목록을 불러오면 그것을 바탕으로 출력하도록 반복문 형태만 만들어 놓았다. 추후 DB 테이블 생성 후 백엔드 작업에 들어가면 수정할 예정이다.<br><br>

# 진행상황 2 - 리뷰 작성 페이지
* 처음에 계획을 짤 때엔 리뷰 작성 페이지를 생각하지 못 했는데 상품 상세 페이지를 만들다 보니 필요함을 깨달았다.

```jsp
<%
// @@ 상품번호를 파라메터로 받아와서 상단에 해당 상품명 노출하기 @@
String prodName = "청경채";
int prodNum = 1;
%>
<body>
    <!-- Header Section Begin -->
    <jsp:include page="../inc/header.jsp"></jsp:include>
    <!-- Header End -->

    <section class="product-shop spad page-details">
      <div class="container">
        <div class="customer-review-option">
          <div class="comment-option">
            <div class="leave-comment">
              <h4>후기쓰기</h4>
              <form action="#" class="comment-form">
                <div class="row">
                  <div class="col-lg-12">
                    <!-- @@ DB 전송시 파라미터로 넘겨줘서 해당 번호 상품에 등록되도록 하기 -->
                    <input type="hidden" value="<%=prodNum%>" name="prodNum">
                    <p class="productName">
                      상품명 : <%=prodName%></p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-2">제목</div>
                    <div class="col-lg-10">
                      <input type="text" class="title" placeholder="제목을 입력해주세요." maxlength="40">
                    </div>
                  </div>
                <div class="row">
                <div class="col-lg-2">내용</div>
                  <div class="col-lg-10">
                    <textarea class="reviewTextarea"
                      placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며, 일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성시 검토 후 비공개 조치될 수 있습니다.
반품/환불 문의는 1:1문의로 가능합니다."></textarea>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-lg-2">사진등록</div>
                    <div class="col-lg-10">
                      <input class="uploadImgName" id="uploadImgName" value="이미지 선택" disabled="disabled"> 
                      <label class="site-btn" for="uploadImg" id="uploadBtn">업로드</label>
                      <button type="button" class="site-btn" onclick="removeImg();">삭제</button>
                      <input type="file" id="uploadImg" oninput="checkFileName();">
                      <p>구매한 상품이 아니거나 캡쳐 사진을 첨부할 경우, 통보없이 삭제 및 적립 혜택이 취소됩니다.</p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12">
                      <button type="button" class="site-btn" id="writeBtn" onclick="history.back();">취소</button>
                      <button type="submit" class="site-btn" id="writeBtn">등록</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
```

* 리뷰 작성 페이지에서는 제목과 텍스트, 이미지 파일 하나를 첨부할 수 있게 했다.
* 어떤 상품에 대한 리뷰를 쓰고 있는지 확인할 수 있도록 상단에는 해당 상품명을 노출하도록 했다. 이것 또한 추후 DB를 연결하면 정보를 받아와서 출력하는 방식으로 수정할 것이다.

<p align="center"><img src="https://miro7923.github.io/assets/images/writeReviewPage.png" width="800"></p>

* 전체적인 디자인 틀은 부트스트랩을 이용해 잡았다. 
* 문의글 작성 페이지도 동일하게 만들었으며 이미지 업로드란만 제거했다.<br><br>

# 작업 중 새로 알게 된 점과 어려웠던 점
* 세 페이지들을 작업하면서 새로 배운 부분은 `input` 태그의 `file` 타입의 `UI`를 바꾸는 것이었다.
* 처음엔 다른 태그들과 마찬가지로 `css`로 쉽게 바꿀 수 있는 것인 줄 알았다.
* 하지만 알고 보니 브라우저 고유 `UI`로 고정되어 있어 변경 불가였다. 그래서 구글링을 해 보니 우회해서 변경하는 방안들이 제시되고 있었다.
* 그 중에서도 [폼 필드(input type="file") 디자인 #4](https://webdir.tistory.com/435) 이 글을 참고해서 만들었다.

* 그리고 이 세 개의 페이지들을 작업하는 내내 날 괴롭혔던 것이 `margin`이었는데... 처음부터 내가 만든 것이 아닌, 만들어져 있는 템플릿을 가져다 쓰다 보니 기본 `css`파일에 설정된 여백 정보가 참 많았다. 
* 처음엔 템플릿에 익숙하지 않으니까 원치 않는 여백이 잡혀 있는데 무엇 때문인지 찾는 것이 쉽지 않았다. 한 번은 테이블 `<td>` 태그에 생겨 있는 여백 원인 찾느라고 한 시간 넘게 썼던 것 같다...
* 의도치 않은 여백의 대부분은 기본 `css` 파일에서 설정되어 있었는데 저 파일이 모든 뷰 페이지에서 공유되고 있었기 때문에 막 수정하면 다른 페이지에도 영향을 미쳐서 다른 사람들의 작업물에 혼동을 줄 것 같았다. 그래서 내가 작업하는 `JSP` 페이지별로 `CSS` 파일을 따로 만들어서 수정된 스타일을 적용했다.<br><br><br>

# 참고
* [폼 필드(input type="file") 디자인 #4](https://webdir.tistory.com/435) <br><br><br>

# 마감까지
* `D-25`
