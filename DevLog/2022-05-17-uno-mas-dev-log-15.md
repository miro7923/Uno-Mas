# JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 15 - 후기글 첨부 이미지의 수정과 삭제

* 작성일 : 2022.05.17
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

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_reviewImg.png" width="900"></p>

* 상품 후기글에 이미지 하나를 첨부할 수 있도록 설계했기 때문에 후기글에 등록되는 이미지의 업로드 및 수정과 삭제가 가능하게 하는 기능을 구현했다. 업로드 자체는 `MultipartFile`로 쉽게 구현할 수 있었지만 수정 기능을 구현하는 과정이 만만치 않았기 때문에 기록으로 남긴다.

## productMapper.xml

```xml
<update id="updateReview">
    UPDATE board_review
    SET review_title = #{review_title}, review_content = #{review_content}, review_rating = #{review_rating}, review_image = #{review_image}
    WHERE review_num = #{review_num}
</update>
```

* `DB` 업데이트를 위한 쿼리문에서는 별도의 조건문 없이 입력받은 데이터를 그대로 사용하기 때문에 여기까지 오기 전에 후기글과 함께 업로드 되는 이미지 파일명에 대한 검증을 거친 후 추가 작업이 필요하다. 

## ProductController.java

```java
@RequestMapping(value = "/modify_review", method = RequestMethod.POST)
public String modifyReviewPOST(HttpServletRequest request, 
        @RequestParam(value = "review_image", required = false) MultipartFile file) throws Exception {
    BoardReviewVO vo = new BoardReviewVO();
    vo.setReview_num(Integer.parseInt(request.getParameter("review_num")));
    vo.setProd_num(Integer.parseInt(request.getParameter("prod_num")));
    vo.setReview_content(request.getParameter("review_content"));
    vo.setReview_rating(Float.parseFloat(request.getParameter("review_rating")));
    vo.setReview_title(request.getParameter("review_title"));
    vo.setUser_num(Integer.parseInt(request.getParameter("user_num")));
		
    String reviewImg = service.getReviewImg(vo.getReview_num());
    String uploadImgName = request.getParameter("uploadImgName");

    // 업로드 된 파일이 있을 때 
    if (!file.isEmpty()) {
        // 기존에 저장된 이미지가 없는 경우 파일이름 생성
        if (reviewImg == null) {
            reviewImg = convertImgName(file.getOriginalFilename(), vo.getReview_num());
        }
        
        // 파일 새로 업로드 
        File targetFile = new File(reviewImgUploatPath, reviewImg);
        FileCopyUtils.copy(file.getBytes(), targetFile);
        vo.setReview_image(reviewImg);
    }
    // 업로드 된 파일이 없을 때
    else { 
        // 기존에 업로드 된 파일이 없거나 글을 수정하며 이미지를 삭제한 경우
        if (uploadImgName.equals("이미지 선택")) {
            if (reviewImg != null) {
                // 기존에 업로드 된 파일이 있으면 서버에서 삭제
                File f = new File(reviewImgUploatPath + File.separator + reviewImg);

                if (f.exists())
                    f.delete();
            }
            
            // 기존 파일명 삭제
            vo.setReview_image(null);
        }
        // 기존에 업로드 된 파일이 있으면 그대로 사용
        else {
            vo.setReview_image(uploadImgName);
        }
    }
		
    service.modifyReview(vo);
		
    return "redirect:/product/product_detail?prod_num=" + vo.getProd_num();
}
```

* 매퍼에 후기글에 대한 정보를 보낼 때 `BoardReviewVO`를 사용해서 보내는데 게시글을 수정할 때 이미지 파일에 대한 정보도 설정해 주지 않으면 `VO` 속의 이미지 파일명 필드는 `null`로 남아있는 상태로 매퍼에 전달될 것이다. 그렇게 되면 기존에 서버에 업로드 된 이미지파일이 있는데도 DB 데이터 상에서는 이미지 파일명 정보가 없기 때문에 화면에 출력되지 않는다. 그래서 첨부파일이 포함된 게시글을 수정할 때엔 위와 같이 분기를 나누어 처리해 주게 했다.<br><br><br>

# 구현하며 했던 고민
* 가장 고민했던 것은 사용자가 글을 수정하면서 이미지를 삭제했는지 아닌지 여부를 확인하는 것이었다. 단순히 `file`로 넘어온 정보가 있고 없고로 따질 수 없었기 때문이다. `file`타입의 인풋태그 특성상 게시글을 작성할 때 파일을 업로드 하지 않으면 사진 첨부 영역의 삭제 버튼을 눌러서 이미지를 삭제해도 값이 비어있고 기존에 업로드했던 이미지를 삭제하는 동작을 하지 않아도 값이 비어있다. 즉 게시글을 수정할 때 새로운 이미지를 첨부하지 않는다면 항상 비어있는 상태로 전송되는 것이다. 

```jsp
<c:choose>
    <c:when test="${vo.review_image == null }">
        <input type="text" class="uploadImgName" id="uploadImgName" value="이미지 선택"
            readonly name="uploadImgName"> 
    </c:when>
    <c:otherwise>
        <input type="text" class="uploadImgName" id="uploadImgName" value="${vo.review_image }"
            readonly name="uploadImgName">
    </c:otherwise>
</c:choose>
<label class="site-btn" for="uploadImg" id="uploadBtn">업로드</label>
<button type="button" class="site-btn" onclick="removeImg();">삭제</button>
<input type="file" id="uploadImg" name="review_image" oninput="checkFileName();">
```

* 뷰 페이지 UI 디자인을 하며 업로드 하려는 파일명을 출력하는 인풋 태그를 분리해 뒀기 때문에 파일명이 출력되는 인풋 태그의 값에 따라 기존에 업로드 된 이미지 파일의 존재 유무를 확인하도록 설계했다.<br><br><br>

# 마감까지
* `D-10`
