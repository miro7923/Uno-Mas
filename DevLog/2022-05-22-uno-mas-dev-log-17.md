# JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 17 - 새로고침 없이 게시판 목록 불러오기

* 작성일 : 2022.05.22
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

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_prodBoard1.png" width="900"></p>

* 상품 상세페이지에 있는 후기와 문의 게시판의 하단에 있는 페이지 번호를 클릭하면 다음 글 목록을 보여주는 기능을 만들었다. 그런데 페이지의 새로고침 없이 보여주는 기능을 곁들인 
* [[Web] ajax으로 받아온 data를 jstl로 표현하기](https://backstreet-programmer.tistory.com/105)
* [ajax로 받아온 data 페이지 새로고침 없이 사용하기](https://velog.io/@hwarkhada/ajax%EB%A1%9C-%EB%B0%9B%EC%95%84%EC%98%A8-data-%ED%8E%98%EC%9D%B4%EC%A7%80-%EC%83%88%EB%A1%9C%EA%B3%A0%EC%B9%A8-%EC%97%86%EC%9D%B4-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0)
* 위 두 글을 참고해서 `Ajax`로 가져온 데이터를 새로고침 없이 출력하게 구현했다. 이 과정에서 `append` 메서드를 사용해 작성된 태그를 갈아 붙이는 방식이 널리 사용되고 있었지만 나는 이런 방식이 좀 비효율적으로 느껴졌다. 그리고 코드도 지저분해 보였다. 
* 그래서 임시 페이지에 똑같은 게시판을 만들어 놓고 임시 페이지를 새로고침해서 게시글 목록을 갱신한 다음에 원본 페이지에 있는 게시판을 임시 페이지의 게시판으로 바꾸는 방식으로 구현했다. 

## productMapper.xml

```xml
<select id="getReviewList" resultType="BoardReviewVO">
    SELECT *
    FROM board_review
    WHERE prod_num = #{prod_num}
    ORDER BY review_regdate DESC
    LIMIT #{pageStart}, #{perPageNum}
</select>
```

* 게시글 목록을 가져올 때엔 정해진 개수만큼만 가져온다. 모든 목록을 가져오면 게시글의 수가 1000개, 100000개 이상으로 아주아주 많아지면 하염없이 게시글 목록만 불러오고 있을 것이다.

## productDetail.jsp

```jsp
<c:forEach var="block" varStatus="it" begin="${reviewPm.startPage }" end="${reviewPm.endPage }" step="1">
    <span>
        <!----> <a href="javascript:void(0)" 
        class="pagingBtn" id="reviewPage${it.index }" style="color: black;"
        onclick="changePageNum(${it.index }, ${reviewPm.endPage - reviewPm.startPage + 1 }, 'review');">${block } <!----></a>
    </span> 
</c:forEach>
```

* 먼저 뷰 페이지에서 페이지 번호를 클릭할 수 있도록 만든다. 게시글의 총 개수를 세어서 필요한 만큼 페이지 번호를 생성한다.
* 클릭하면 자바스크립트 메서드가 호출된다.

## productDetail.js

```javascript
function changePageNum(num, maxNum, boardType) {    
    if (boardType == 'review') {
        initReview();
	    
        // 선택된 페이지 번호 강조 처리 
        var id = '#reviewPage' + num;
	    
        $(id).css('font-weight', 'bold');
        $(id).css('color', '#B9CE45');
	    
        // 나머지 번호들은 강조 처리 해제 
        for (var i = 1; i <= maxNum; i++) {
            if (num == i) continue;
	        
            id = '#reviewPage' + i;
            $(id).css('font-weight', '');
            $(id).css('color', 'black');
        }
	    
        $.ajax({
            type: 'get',
            url: '/product/list_review?prod_num=' + $('#prod_num').val() + '&page=' + num,
            success: function(data) {
                console.log('결과: '+data);
                // 임시 페이지에 출력된 데이터를 가져와 원본 페이지의 데이터를 바꿔준다.
                var html = jQuery('<div>').html(data);
                var contents = html.find('div#reviewListAjax').html();
                $('#reviewListAjax').html(contents);
				
                getPageNum();
            },
            error: function() {
                alert('통신 실패');
            }
        });
    }
    else {
        initQna();
		
        var id = '#inquiryPage' + num;
	    
        $(id).css('font-weight', 'bold');
        $(id).css('color', '#B9CE45');
	    
        for (var i = 1; i <= maxNum; i++) {
            if (num == i) continue;
	        
            id = '#inquiryPage' + i;
            $(id).css('font-weight', '');
            $(id).css('color', 'black');
        }
	    
        $.ajax({
            type: 'get',
            url: '/product/list_inquiry?prod_num=' + $('#prod_num').val() + '&page=' + num,
            success: function(data) {
                console.log('결과: '+data);
                var html = jQuery('<div>').html(data);
                var contents = html.find('div#inqDiv').html();
                $('#inqDiv').html(contents);

                getPageNum();
            },
            error: function() {
                alert('통신 실패');
            }
        });
		
    }
}
```

* 다음 페이지의 글 목록을 불러오는 메서드가 호출되면 `Ajax` 통신으로 서버에 접속해 임시 페이지를 새로고침 하는 동작을 수행한 뒤 돌아온다.
* 이제 임시 페이지에 있는 새 데이터를 원본 페이지의 게시판에 덮어씌워주면 작업이 끝난다.

## revBoardAjax.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
    <div class="comment-option" id="reviewListAjax">
        <table class="reviewTable" width="100%" border="0" cellpadding="0" cellspacing="0">
            <caption style="display: none">구매후기 제목</caption>
            <colgroup>
                <col style="width: 110px;">
                <col style="width: auto;">
                <col style="width: 77px;">
                <col style="width: 100px;">
                <col style="width: 80px;">
            </colgroup>
            <tbody>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th align="left">작성자</th>
                    <th>작성일</th>
                    <th>조회</th>
                </tr>
            </tbody>
        </table>
        <c:choose>
            <c:when test="${fn:length(reviewList) == 0 }">
                <p class="text-center nonPost">등록된 후기가 없어요. 고객님께서 첫 번째 후기를 남겨주세요!</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="reviewVo" items="${reviewList }" varStatus="it">
                    <table class="reviewTable" width="100%" border="0" cellpadding="0" cellspacing="0">
                        <caption style="display: none">구매후기 제목</caption>
                        <colgroup>
                            <col style="width: 110px;">
                            <col style="width: auto;">
                            <col style="width: 77px;">
                            <col style="width: 100px;">
                            <col style="width: 80px;">
                        </colgroup>
                        <tbody>
                            <tr onmouseover="this.style.background='#f0f0f0'"
                                onmouseout="this.style.background='white'">
                                <td id="reviewNum${it.index }">${reviewVo.review_num }</td>
                                <td align="left" class="reviewTitle" id="reviewTitle${it.index }"
                                    onclick="updateReviewReadcnt(${it.index}); toggleReview(${it.index});">${reviewVo.review_title }</td>
                                <td align="left" id="reviewUserid${it.index }">${reviewVo.user_id }</td>
                                <td id="reviewRegdate${it.index }">
                                    <fmt:formatDate value="${reviewVo.review_regdate }" type="date" />
                                </td>
                                <td id="reviewReadcnt${it.index }">${reviewVo.review_readcnt }</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="reviewContent" id="reviewContentBox${it.index }">
                        <strong>${vo.prod_name }</strong>
                        <p>
                            평점 : <span id="reviewRating${it.index }">${reviewVo.review_rating } / 5.0</span>
                        </p>
                        <br>
                        <c:if test="${reviewVo.review_image != null && fn:length(reviewVo.review_image) > 0 }">
                            <p align="center">
                                <img src="<spring:url value="/resources/upload/images/board/review/${reviewVo.review_image }"></spring:url>">
                            </p>
                        </c:if>
                        <p id="reviewContent${it.index }">${reviewVo.review_content }</p>
                        <c:if test="${sessionScope.saveID != null && user_num == reviewVo.user_num }">
                            <p class="text-right">
                                <a href="/product/modify_review?review_num=${reviewVo.review_num }">수정</a>&nbsp; 
                                <a href="javascript:void(0)"
                                    onclick="confirmToRemove('review', ${reviewVo.review_num}, ${vo.prod_num })"
                                    style="color: #5179a5;">삭제</a>
                            </p>
                        </c:if>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <div class="col-lg-12 reviewBtnArea">
            <div class="row" id="pagediv">
                <input type="hidden" value="${page }" id="curReviewPage">
                <div class="col-lg-12 text-center">
                    <c:if test="${reviewPm.prev }">
                        <a href="/product/review_list?page=${reviewPm.startPage - 1 }"
                            class="arrow_carrot-left_alt pagingBtn" id="prev"></a>
                    </c:if>
                    <c:forEach var="block" varStatus="it"
                        begin="${reviewPm.startPage }" end="${reviewPm.endPage }" step="1">
                        <span> <!----> 
                            <a href="javascript:void(0)"
                            class="pagingBtn" id="reviewPage${it.index }" style="color: black;"
                            onclick="changePageNum(${it.index }, ${reviewPm.endPage - reviewPm.startPage + 1 }, 'review');">${block }<!----></a>
                        </span>
                    </c:forEach>
                    <c:if test="${reviewPm.next }">
                        <a href="/product/review_list?page=${reviewPm.endPage + 1 }"
                            class="arrow_carrot-right_alt pagingBtn" id="next"></a>
                    </c:if>
                </div>
            </div>
            <c:if test="${sessionScope.saveID != null }">
                <button type="button" class="site-btn"
                    onclick="location.href='/product/write_review?prod_num='+${vo.prod_num};">
                    후기쓰기</button>
            </c:if>
        </div>
    </div>
```

* 상품 상세 페이지에서 게시판을 출력하는 부분만 임시 페이지에 복제해 놓는다. 새 데이터를 가져올 때 이 페이지를 새로고침 해서 게시판 목록을 갱신할 것이다. 

## ProductController.java
* `Ajax`를 사용하지만 컨트롤러는 `Rest` 컨트롤러가 아니라 일반 컨트롤러를 사용한다. 왜냐하면 새 데이터를 뷰 페이지로 전달해서 해당 뷰 페이지가 갱신되도록 해야 하기 때문이다. 위 두 글에서 이 부분에 대한 언급이 없어서 구현하는데 좀 헤멨었다.(처음에 배울 때 `Ajax`는 `@RestController`랑 같이 쓰라고 배워서 더 헤멨던 것도 있다🥲) 

```java
@Controller
@RequestMapping("/product/*")
public class ProductController {

    @Inject
    private ProductService service;
	
    @RequestMapping(value = "/list_review", method = RequestMethod.GET)
    public String getReviewListGET(@RequestParam("prod_num") int prod_num, 
            @RequestParam("page") int page, Model model) throws Exception {
        ProdCriteria pc = new ProdCriteria();
        pc.setPage(page);
        pc.setPerPageNum(7);
        pc.setProd_num(prod_num);
		
        List<BoardReviewVO> list = service.getReviewList(pc);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setUser_id(service.getUserid(list.get(i).getUser_num()));
        }
		
        ProdPageMaker reviewPm = new ProdPageMaker();
        reviewPm.setCri(pc);
        reviewPm.setTotalCnt(service.getReviewCnt(prod_num));
		
        model.addAttribute("reviewList", list);
        model.addAttribute("reviewPm", reviewPm);
        model.addAttribute("page", page);
		
        return "product/revBoardAjax";
    }
}
```

* 새 게시글 목록을 불러오고 나면 데이터를 임시 게시판 페이지로 전달해서 데이터가 갱신되게 한다. 그리고 `Ajax` 호출이기 때문에 페이지 이동은 하지 않고 메서드가 종료되면 아까 있던 곳으로 되돌아 올 것이다. 

```javascript
$.ajax({
    type: 'get',
    url: '/product/list_review?prod_num=' + $('#prod_num').val() + '&page=' + num,
    success: function(data) {
        console.log('결과: '+data);
        // 임시 페이지에 출력된 데이터를 가져와 원본 페이지의 데이터를 바꿔준다.
        var html = jQuery('<div>').html(data);
        var contents = html.find('div#reviewListAjax').html();
        $('#reviewListAjax').html(contents);
        
        // 선택된 페이지 번호 css로 강조 처리
        getPageNum();
    },
    error: function() {
        alert('통신 실패');
    }
});
```

* 되돌아오면 임시 페이지는 새 데이터로 갱신된 상태이기 때문에 불러와서 원본 페이지에 덮어씌우기만 하면 된다. `append`로 붙이는 코드보다 훨씬 간결해서 좋다.<br><br><br>

# 구현하며 했던 고민
* 무엇보다도 어떻게 하면 `append`를 쓰지 않을 수 있는지, 그리고 `Ajax`와 일반 컨트롤러 간의 통신 흐름을 이해하는 것이었다. 왜냐면 처음엔 `Ajax`와 일반 `@Controller`의 통신 방식에 대한 정확한 이해가 되어 있지 않았기 때문에... `@RestController`에서 다른 뷰 페이지에 `model` 객체를 전달하려고 시도하는 등 시행착오가 많았다.(당연히 동작 안 됨)
* 이번 기능을 구현하면서 `@Controller`와 `@RestController`의 차이를 확실하게 알게 되었다. 뭔가 스프링에 한 발 더 다가선 느낌~~!!<br><br><br>

# 마감까지
* `D-5`<br><br><br>

# 참고
* [[Web] ajax으로 받아온 data를 jstl로 표현하기](https://backstreet-programmer.tistory.com/105)
* [ajax로 받아온 data 페이지 새로고침 없이 사용하기](https://velog.io/@hwarkhada/ajax%EB%A1%9C-%EB%B0%9B%EC%95%84%EC%98%A8-data-%ED%8E%98%EC%9D%B4%EC%A7%80-%EC%83%88%EB%A1%9C%EA%B3%A0%EC%B9%A8-%EC%97%86%EC%9D%B4-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0)
