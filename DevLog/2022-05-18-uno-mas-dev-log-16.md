# 1인가구를 위한 쇼핑몰 Uno más 개발일지 16 - Ajax로 이미지파일 업로드

* 작성일 : 2022.05.18
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

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_uploadProdImg2.png" width="900"></p>

* 관리자용 상품 등록 페이지에서 비동기 방식으로 상품 이미지를 업로드하고 등록된 이미지를 미리볼 수 있는 기능을 구현했다. 

## productMapper.xml

```xml
<insert id="setProduct">
    INSERT INTO products(prod_name, prod_category, prod_price, prod_stock, prod_expire, 
                    prod_keep, prod_weight, prod_country, prod_sellunit, prod_explain, prod_packing, 
                    prod_discntrate, prod_image1, prod_image2, prod_image3, prod_image4)
    VALUES (#{prod_name}, #{prod_category}, #{prod_price}, #{prod_stock}, #{prod_expire}, 
            #{prod_keep}, #{prod_weight}, #{prod_country}, #{prod_sellunit}, #{prod_explain}, #{prod_packing},
            #{prod_discntrate}, #{prod_image1}, #{prod_image2}, #{prod_image3}, #{prod_image4})
</insert>
```

* 이미지 파일을 비동기 방식으로 업로드 하기 때문에 `DB`에는 파일명만 넣어주면 된다.

## servlet-context.xml

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_uploadProdImg3.png" width="700"></p>

* 저장되는 이미지의 종류별로 폴더를 분리하는 것이 깔끔하고 화면에 뿌려주기 위해 해당 파일을 찾아올 때 분류된 폴더에서 찾아오는 것이 더 빠를 것이라 생각해서 위와 같이 이미지가 업로드 되는 경로를 분리해 주었다.

```xml
<!-- 상품 상세이미지 업로드 경로 -->
<beans:bean id="prodDimgUploadPath" class="java.lang.String">
    <beans:constructor-arg value="프로젝트경로/src/main/webapp/resources/upload/images/products/detail"/>
</beans:bean>
    
<!-- 상품 썸네일 업로드 경로 -->
<beans:bean id="prodThumbUploadPath" class="java.lang.String">
    <beans:constructor-arg value="프로젝트경로/src/main/webapp/resources/upload/images/products/thumbnail"/>
</beans:bean>
    
<!-- 상품 상단 이미지 업로드 경로 -->
<beans:bean id="prodTopImgUploadPath" class="java.lang.String">
    <beans:constructor-arg value="프로젝트경로/src/main/webapp/resources/upload/images/products/top"/>
</beans:bean>
    
<!-- 상품 품절 이미지 업로드 경로 -->
<beans:bean id="prodSoldoutImgUploadPath" class="java.lang.String">
    <beans:constructor-arg value="프로젝트경로/src/main/webapp/resources/upload/images/products/soldout"/>
</beans:bean>
```

* 프레임워크에게 알려주기 위해 `servlet-context.xml` 파일에서 각 폴더별로 업로드 경로를 지정해 주었다.

## productRegister.jsp

```jsp
<div class="col-lg-3 col-sm-6">
    <div class="product-item">
        <div class="pi-text">
            <h5>기본 이미지(세로)</h5><br>
            <div class="pi-pic">
                <img src="" alt="" id="prevImg1">
                <div class="sale pp-sale">1</div>
                <input type="hidden" id="prod_image1" name="prod_image1">
                <input type="file" id="uploadImg1" name="uploadImg1" oninput="checkFileName(1, 'top');">
            </div>
            <div class="catagory-name">[이미지 삭제]</div>
        </div>
    </div>
</div>
<div class="col-lg-3 col-sm-6">
    <div class="product-item">
        <div class="pi-text">
            <h5>상품 상세 설명</h5><br>
            <div class="pi-pic">
                <img src="" alt="" id="prevImg2">
                <div class="sale pp-sale">2</div>
                <input type="hidden" id="prod_image2" name="prod_image2">
                <input type="file" id="uploadImg2" name="uploadImg2" oninput="checkFileName(2, 'detail');">
            </div>
            <div class="catagory-name">[이미지 삭제]</div>
        </div>
    </div>
</div>
<div class="col-lg-3 col-sm-6">
    <div class="product-item">
        <div class="pi-text">
            <h5>썸네일</h5><br>
            <div class="pi-pic">
                <img src="" alt="" id="prevImg3">
                <div class="sale pp-sale">3</div>
                <input type="hidden" id="prod_image3" name="prod_image3">
                <input type="file" id="uploadImg3" name="uploadImg3" oninput="checkFileName(3, 'thumb');">
            </div>
            <div class="catagory-name">[이미지 삭제]</div>
        </div>
    </div>
</div>
<div class="col-lg-3 col-sm-6">
    <div class="product-item">
        <div class="pi-text">
            <h5>품절 시 대체 썸네일</h5><br>
            <div class="pi-pic">
                <img src="" alt="" id="prevImg4">
                <div class="sale pp-sale">4</div>
                <input type="hidden" id="prod_image4" name="prod_image4">
                <input type="file" id="uploadImg4" name="uploadImg4" oninput="checkFileName(4, 'soldout');">
            </div>
            <div class="catagory-name">[이미지 삭제]</div>
        </div>
    </div>
</div>
```

* `Ajax`를 이용해 비동기 방식으로 이미지를 등록할 것이기 때문에 뷰 페이지에서는 `oninput` 속성에 이미지 업로드 메서드를 연결했다.
* 이때 각 인풋 태그들에 들어갈 이미지의 종류만 다르지 수행할 동작 자체는 모두 같기 때문에 하나의 메서드에서 좀 더 쉽게 처리할 수 있도록 같은 `id`를 사용하되, `id="uploadImg1"`, `id="uploadImg2"`과 같이 맨 뒤에 번호를 부여해서 각 태그를 구분했다. 그리고 `oninput`의 `checkFileName(num, type)` 메서드에 인자값으로 해당 `id`의 번호와 이미지 타입을 넣어준다.

## productAdmin.js

```javascript
function checkFileName(num, type) {
    var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)");
    var maxSize = 10 * 1024 * 1024;
	
    // id 맨 뒤에 붙는 번호만 바꿔주면 간편하게 해당 인풋 태그를 찾아갈 수 있다.
    var fileSize = $('#uploadImg' + num)[0].files[0].size;
    if (fileSize > maxSize) {
        alert('5MB 이하만 첨부 가능합니다.');
        // 인풋 태그에 등록된 파일을 삭제한다.
        crossBrowsing(num);
        return;
    }
	
    if (!regex.test($('#uploadImg' + num).val())) {
        alert('확장자가 jpeg, jpg, png, gif인 이미지 파일만 등록 가능합니다.');
        // 인풋 태그에 등록된 파일을 삭제한다.
        crossBrowsing(num);
        return;
    }
	
    // 위에서 확장자 검사와 파일 크기 검사를 통과했을 때에만 업로드 메서드 실행 
    uploadImg(num, type);
}

// 인풋 태그에 등록된 파일을 삭제하는 메서드
function crossBrowsing(num) {
    var agent = navigator.userAgent.toLowerCase();
	
    // 크로스 브라우징 처리
    // IE일 때
    if (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1 ||
        agent.indexOf("msie") != -1)
        $('#uploadImg' + num).replaceWith($('#uploadImg' + num).clone(true));
    else // 그 외 브라우저
        $('#uploadImg' + num).val('');	
}

// 파일 업로드를 수행하는 메서드
function uploadImg(num, type) {
    var reader = new FileReader();
	
    // 업로드 할 파일을 읽어와서 이미지 미리보기 영역에 뿌려준다.
    reader.onload = e => {
        $('#prevImg' + num).attr('src', e.target.result);
    }
	
    reader.readAsDataURL($('#uploadImg' + num)[0].files[0]);
	
    // 파일을 form 데이터에 담아 전송할 준비 
    var form = new FormData();
    form.append('uploadImg' + num, $('#uploadImg' + num)[0].files[0]);
	
    // 업로드 되는 이미지 타입에 따라 매핑되는 url을 다르게 설정한다.
    var newUrl = '/product/upload_';
    switch(type) {
        case 'detail':
            newUrl += 'deImg';
            break;
        case 'top':
            newUrl += 'topImg';
            break;
        case 'thumb':
            newUrl += 'thumb';
            break;
        case 'soldout':
            newUrl += 'soldoutImg';
            break;
    }
	
    $.ajax({
        type: 'post',
        url: newUrl,
        data: form,
        processData: false,
        contentType: false,
        success: function(data) {
            if (data != null) {
                alert('이미지 업로드 성공' + data);
            }
        },
        error: function() {
            alert('서버 오류로 지연되고 있습니다. 잠시 후 다시 시도해 주세요.');
        }
    });
}
```

* 업로드 하려는 이미지 파일을 읽어와서 이미지 미리보기 영역에 출력한 뒤 파일 업로드를 위해 서버와 통신한 뒤 성공 유무에 따라 알림창을 출력할 것이다. 

## ProductAjaxController.java

* `Ajax` 통신을 위한 `RestController`에서 이미지 업로드를 수행한다. 
* 이때 상품 상세페이지의 상단과 본문 영역에 보여질 이미지는 그대로 업로드 하지만 썸네일은 크기를 줄여서 업로드 할 것이라서 이미지 업로드는 두 가지 분기로 나눠진다.

### 이미지 원본 업로드

```java
@RestController
@RequestMapping("/product/*")
public class ProductAjaxController {

    @Inject
    private ProductService service;
	
    private static final Logger log = LoggerFactory.getLogger(ProductAjaxController.class);

    @Resource(name = "reviewImgUploadPath")
    private String reviewImgUploatPath;
	
    @Resource(name = "prodDimgUploadPath")
    private String prodDimgUploadPath;
	
    @Resource(name = "prodThumbUploadPath")
    private String prodThumbUploadPath;
	
    @Resource(name = "prodTopImgUploadPath")
    private String prodTopImgUploadPath;
	
    @Resource(name = "prodSoldoutImgUploadPath")
    private String prodSoldoutImgUploadPath;
	
    // 상세페이지 상단 이미지 
    @RequestMapping(value = "/upload_topImg", method = RequestMethod.POST)
    public String uploadTopImgPOST(@RequestParam("uploadImg1") MultipartFile file) throws Exception {
        String fileName = null;
        if (!file.isEmpty()) {
            // 이미지 파일명 변환
            fileName = Commons.convertImgName(file.getOriginalFilename(), service.getLastProdNum() + 1, ImgType.TOP);
            File targetFile = new File(prodTopImgUploadPath, fileName);
            FileCopyUtils.copy(file.getBytes(), targetFile);
        }
		
        return fileName;
    }

    // 상세페이지 본문 이미지 
    @RequestMapping(value = "/upload_deImg", method = RequestMethod.POST)
    public String uploadDeImgPOST(@RequestParam("uploadImg2") MultipartFile file) throws Exception {
        String fileName = null;
        if (!file.isEmpty()) {
            fileName = Commons.convertImgName(file.getOriginalFilename(), service.getLastProdNum() + 1, ImgType.DETAIL);
            File targetFile = new File(prodDimgUploadPath, fileName);
            FileCopyUtils.copy(file.getBytes(), targetFile);
        }
		
        return fileName;
    }
}
```

* 이미지 원본은 별도의 작업을 할 필요가 없기 때문에 지정된 경로에 그대로 업로드 한다. 
* 파일을 업로드 할 때 파일명을 각 용도별로 지정해서 사용하기로 했다. 예를 들면 상세 이미지는 `detail_상품번호.png`, 썸네일은 `thumbnail_상품번호.png`, 후기글의 이미지는 `review_리뷰글번호.png`와 같은 형태이다. 그래서 업로드되는 파일명을 변환해주는 메서드가 필요해서 따로 만들었다. 
* 파일명을 변환하는 메서드는 `ProductAjaxController` 뿐만 아니라 `ProductController`에서도 쓰이기 때문에 여러 클래스에서 공통으로 사용되는 메서드들을 모아놓은 `Commons` 클래스를 만들어서 작성했다. `Commons` 클래스의 메서드는 객체 생성 없이 바로 접근해서 사용하고 싶었기 때문에 `static` 메서드로 선언했다.

### Commons.java

```java
// 여러 컨트롤러에서 공통으로 쓸 수 있는 메서드를 모아놓은 클래스
public class Commons {

    // 이미지 용도에 따라 파일명 다르게 설정
    public final static String convertImgName(String name, int num, ImgType type) {
        // 확장자명 시작 위치 찾기
        int idx = name.lastIndexOf(".");
        String ret = null;
		
        switch (type) {
            case DETAIL:
                ret = "detail_" + num + "." + name.substring(idx + 1).toLowerCase();
                break;
            case THUMBNAIL:
                ret = "thumbnail_" + num + "." + name.substring(idx + 1).toLowerCase();
                break;
            case TOP:
                ret = "top_" + num + "." + name.substring(idx + 1).toLowerCase();
                break;
            case SOLDOUT:
                ret = "soldout_" + num + "." + name.substring(idx + 1).toLowerCase();
                break;
            case REVIEW:
                ret = "review_" + num + "." + name.substring(idx + 1).toLowerCase();
                break;
        }
		
        return ret;
    }
}
```

* 이미지 파일명 변환 메서드에서는 이미지 타입별로 파일명을 다르게 설정할 것인데 역시 재사용성을 높이기 위해 `enum` 클래스를 사용했으며, 가독성과 속도 향상을 위해 `swith`문으로 이미지 타입을 구분하도록 했다. 

### ImgType.java

```java
package com.april.unomas.domain;

public enum ImgType {

    DETAIL, THUMBNAIL, TOP, SOLDOUT, REVIEW
}
```

* `ImgType enum` 역시 여러 클래스에서 공통으로 사용되기 때문에 `enum` 클래스를 생성했다.

### 이미지 크기 줄여서 업로드

```java
// 썸네일 업로드
@RequestMapping(value = "/upload_thumb", method = RequestMethod.POST)
public String uploadThumbPOST(@RequestParam("uploadImg3") MultipartFile file) throws Exception {
    String fileName = null;
    if (!file.isEmpty()) {
        // 파일명 변환 후
        fileName = Commons.convertImgName(file.getOriginalFilename(), service.getLastProdNum() + 1, ImgType.THUMBNAIL);
        // 이미지 크기 리사이즈
        Commons.resizeImg(file, prodThumbUploadPath, fileName);
    }
		
    return fileName;
}

// 품절시 대체 썸네일 업로드
@RequestMapping(value = "/upload_soldoutImg", method = RequestMethod.POST)
public String uploadSoldoutImgPOST(@RequestParam("uploadImg4") MultipartFile file) throws Exception {
    String fileName = null;
    if (!file.isEmpty()) {
        fileName = Commons.convertImgName(file.getOriginalFilename(), service.getLastProdNum() + 1, ImgType.SOLDOUT);
        Commons.resizeImg(file, prodSoldoutImgUploadPath, fileName);
    }
		
    return fileName;
}
```

* 썸네일과 품절시 대체 썸네일은 크기가 줄여져야 한다. 이미지 크기를 조절하는 메서드 또한 `Commons` 클래스에 작성했다.

### Commons.java

```java
public final static void resizeImg(MultipartFile file, String filePath, String fileName) throws IOException {
    // 이미지 읽어오기
    BufferedImage inputImg = ImageIO.read(file.getInputStream());
		
    // 이미지 가로세로 길이 측정
    int originWidth = inputImg.getWidth();
    int originHeight = inputImg.getHeight();
		
    // 변경할 가로 길이
    int newWidth = 360;
		
    if (originWidth > newWidth) {
        // 기존 이미지 비율을 유지하여 세로길이 설정
        int newHeight = (originHeight * newWidth) / originWidth;
			
        // 이미지 품질 설정         
        // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
        // Image.SCALE_FAST : 이미지 부드러움보다 속도 우선
        // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
        // Image.SCALE_SMOOTH : 속도보다 이미지 부드러움을 우선
        // Image.SCALE_AREA_AVERAGING : 평균 알고리즘 사용
        Image resizeImg = inputImg.getScaledInstance(newWidth, newHeight, Image.SCALE_FAST);
        BufferedImage newImg = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
        Graphics graphics = newImg.getGraphics();
        graphics.drawImage(resizeImg, 0, 0, null);
        graphics.dispose();
			
        // 이미지 저장
        File newFile = new File(filePath, fileName);
        ImageIO.write(newImg, fileName.substring(fileName.lastIndexOf(".") + 1), newFile);
    }
    else {
        // 이미지 저장
        File newFile = new File(filePath, fileName);
        FileCopyUtils.copy(file.getBytes(), newFile);
    }
}
```

* 업로드 된 파일과 업로드 될 경로, 변환된 파일명을 인자값으로 받아와 이미지 크기 조절 후 업로드를 수행한다.
* 이미지 크기 조절은 지정된 썸네일 크기보다 클 때 수행한다.<br><br><br>

# 구현하며 했던 고민
* 업로드 한 이미지를 실시간으로 미리볼 수 있게 하는 기능을 구현하는 것이 가장 고민이었다. 왜냐면 처음 해 보는 것이었고 학원에서 배웠던 것은 동기방식으로 미리보기 없이 업로드 하는 방식이었기 때문이다. 
* 하지만 이와 관련해서 구글에 레퍼런스가 많았기 때문에 약 세 시간 정도 걸려서 구현할 수 있었다.

* 그리고 파일명을 변환하는 메서드와 같이 여러 클래스에서 공통적으로 쓰이게 되는 메서드의 중복 작성을 줄이고자 `Commons` 클래스와 `static` 메서드를 만드는 과정에서 자바의 `static` 메서드 선언 규칙을 다시 공부할 수 있어서 좋았다. 왜냐면 `static` 메서드 사용 관련해서는 `C++` 기준 지식을 가지고 있었기 때문에...ㅎ<br><br><br>

# 마감까지
* `D-9`<br><br><br>

# 참고
* [ajax으로 file upload를 해보자 & 첨부파일 이미지 미리보기](https://cloud0477.tistory.com/122)
* [JAVA 이미지 리사이징, 가로세로 크기 줄이기](https://gorokke.tistory.com/214)
