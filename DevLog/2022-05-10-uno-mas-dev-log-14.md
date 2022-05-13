# JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 14 - 신상품 페이지와 특가상품 페이지에서 할인상품의 할인율과 할인가 보여주기

* 작성일 : 2022.05.10
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
* 2022.4.13 ~ 2022.5.20<br><br><br>

# 주제
* 웹 백엔드 수업 중 마지막 과제로 팀 프로젝트를 진행하게 되었다.
* 조건은 `Spring` 기반으로 웹 사이트를 제작하는 것이다.
* 총 팀원은 6명이며, 우리 팀은 `1인 가구를 위한 쇼핑몰`을 주제로 정했다.
* 팀 이름으로 정해진 `Uno más`는 스페인어로 `하나 더`라는 뜻이다. <br><br><br>

# 진행상황 

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_prodListDb1.png" width="900"></p>

* 신상품과 할인상품을 볼 수 있는 페이지를 만들어 DB에서 조회해 온 값에 따라 출력되도록 했다.

## productMapper.xml

```xml
<mapper namespace="com.unomas.mapper.ProductMapper">
    <!-- 한 달 이내 신상품 목록 가져오기 -->
    <select id="getNewProducts" resultType="ProductVO">
        SELECT *
        FROM products
        WHERE prod_regdate BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW()
        ORDER BY prod_regdate DESC
        LIMIT #{pageStart}, #{perPageNum}
    </select>
    
    <!-- 신상품 개수 가져오기 -->
    <select id="getNewProdCnt" resultType="int">
        SELECT COUNT(prod_num)
        FROM products
        WHERE prod_regdate BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW()
    </select>
    
    <!-- 특가 상품 목록 가져오기 -->
    <select id="getSaleProducts" resultType="ProductVO">
        SELECT *
        FROM products
        WHERE prod_discntrate > 0
        ORDER BY prod_regdate DESC
        LIMIT #{pageStart}, #{perPageNum}
    </select>
    
    <!-- 특가 상품 개수 가져오기 -->
    <select id="getSaleProdCnt" resultType="int">
        SELECT COUNT(prod_num)
        FROM products
        WHERE prod_discntrate > 0
    </select>
</mapper>
```

* 상품 테이블에서 신상품과 할인상품 목록을 가져오기 위한 쿼리문을 작성했다.
* 신상품은 등록일 기준으로 최근 한 달 이내의 상품만 가져오도록 했고, 특가(할인) 상품은 할인율을 표시하는 컬럼인 `prod_discntrate`의 값이 0 보다 큰 값을 때에만 가져오도록 했다. 할인율이 0이라면 할인하지 않는 상품이라는 뜻이다.

## ProductDAO.java

```java
public interface ProductDAO {
	
    // 신상품 목록 가져오는 메서드
    public List<ProductVO> getNewProductList(ProdCriteria pc) throws Exception;
	
    // 신상품 개수 가져오는 메서드
    public int getNewProdCnt() throws Exception;
	
    // 특가 목록 가져오는 메서드
    public List<ProductVO> getSaleProductList(ProdCriteria pc) throws Exception;
	
    // 특가 상품 개수 가져오는 메서드
    public int getSaleCnt() throws Exception;
}
```

## ProductDAOImpl.java

```java
@Repository
public class ProductDAOImpl implements ProductDAO {

    @Inject
    private SqlSession sqlSession;
    private static String NAMESPACE = "com.unomas.mapper.ProductMapper";
    private static final Logger log = LoggerFactory.getLogger(ProductDAOImpl.class);

    @Override
    public List<ProductVO> getNewProductList(ProdCriteria pc) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getNewProducts", pc);
    }

    @Override
    public int getNewProdCnt() throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".getNewProdCnt");
    }

    @Override
    public List<ProductVO> getSaleProductList(ProdCriteria pc) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getSaleProducts", pc);
    }

    @Override
    public int getSaleCnt() throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".getSaleProdCnt");
    }
}
```

* `DAO`를 통해 DB에서 신상품과 특가상품 정보를 불러온다.

## ProductDAOTest.java

```java
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
        )
public class ProductDAOTest {

    @Inject
    private ProductDAO dao;
    private static final Logger log = LoggerFactory.getLogger(ProductDAOTest.class);
	
    @Test
    public void 신상품목록출력테스트() throws Exception {
        ProdCriteria pp = new ProdCriteria();
        pp.setPage(0);
        pp.setPerPageNum(9);
		
        log.info(dao.getNewProductList(pp)+"");
        log.info("count: " + dao.getNewProdCnt());
    }
	
    @Test
    public void 특가목록출력테스트() throws Exception {
        ProdCriteria pc = new ProdCriteria();
        ProdPageMaker pm = new ProdPageMaker();
        pm.setCri(pc);
        pm.setTotalCnt(dao.getSaleCnt());
		
        log.info(dao.getSaleProductList(pc)+"");
        log.info(pm.getTotalCnt()+"");
    }
}
```

* 서비스 코드에 넣기 전 테스트를 진행했다. 결과가 잘 나왔기 때문에 다음 단계로 넘어간다.
* `ProdCriteria`와 `ProdPageMaker`는 페이징 처리를 위한 객체들이다.

## ProdCriteria.java

* 한 페이지에 보여줄 상품 목록의 정보를 담고 있다.

```java
package com.april.unomas.domain;

import lombok.Data;

@Data
public class ProdCriteria {

    private int cateStart; 
    private int cateEnd; // 소분류의 시작과 끝번호 (대분류별로 가져올 때 사용)
    private int page; // 현재 페이지번호
    private int perPageNum; // 한 페이지에 보여질 상품 개수
    private int prod_category; // 소분류 번호. 소분류만 지정해서 가져올 때 사용
	
    // 한 페이지에 상품이 9개씩 노출될 것이고 첫 페이지는 1로 설정 
    public ProdCriteria() {
        this.page = 1;
        this.perPageNum = 9;
    }
	
    // 테이블에서 상품 목록을 가져올 때 시작 로우 설정
    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }
	
    // 페이지번호가 1보다 작게 입력되면 1페이지로 고정 
    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
		
        this.page = page;
    }
	
    public void setPerPageNum(int perPageNum) {
        // 페이지 사이즈 (한 페이지에 perPageNum만큼 출력하게 하기)
        if (!(0 < perPageNum && perPageNum < 100)) {
            this.perPageNum = 10;
            return;
        }
		
        this.perPageNum = perPageNum;
    }
}
```

* 입력된 페이지 번호에 따라 테이블에서 가져와야 할 로우 번호를 내부적으로 계산한 후 `MyBatis`로 넘겨주도록 했다.

## ProdPageMaker.java

* 페이지의 하단에서 다음 페이지로 이동할 수 있도록 하는 데이터를 처리하여 가지고 있는 객체이다.

```java
package com.april.unomas.domain;

import lombok.Data;

@Data
public class ProdPageMaker {

    private int totalCnt; // 총 게시글 수
    private int startPage; // 시작페이지 번호
    private int endPage; // 마지막 페이지 번호
    private boolean prev; // 이전 버튼 활성화 여부(페이지의 개수가 10개가 넘어가면 << >> 와 같은 버튼 보이게 하는 변수
    private boolean next; // 다음 버튼 활성화 여부
    private int pageBlock = 10; // 한 페이지에서 보여줄 페이지 블럭의 개수 
    private ProdCriteria cri; // 한 페이지에 보여주는 상품 정보를 관리하는 객체
	
    public void setCri(ProdCriteria cri) {
        this.cri = cri;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
		
        calcData();
    }
	
    // 입력받은 총 상품 수와 한 페이지에 보여줄 상품의 수를 이용해서 몇 개의 페이지가 생성되어야 하는지 계산 
    public void calcData() {
        endPage = (int)Math.ceil(cri.getPage() / (double)pageBlock) * pageBlock;
        startPage = (endPage - pageBlock) + 1;
        int tmpEndPage = (int)Math.ceil(totalCnt / (double)cri.getPerPageNum());
		
        if (endPage > tmpEndPage) endPage = tmpEndPage;
		
        prev = (startPage == 1) ? false : true;
        next = (endPage * cri.getPerPageNum() >= totalCnt) ? false : true;
    }
}
```

* 현재 카테고리에서 보여져야 하는 상품의 총 개수를 이용해서 생성해야 하는 페이지 블럭의 개수를 계산해 가지고 있는 객체이다. 여기서 계산된 데이터로 뷰 페이지에서 표시되어야 하는 페이지 블럭의 개수만큼 반복문을 돌려 출력한다.

## ProductService.java

```java
public interface ProductService {
	
    // 신상품 목록 가져오는 메서드
    public List<ProductVO> getNewProductList(ProdCriteria pc) throws Exception;
	
    // 신상품 개수 가져오는 메서드
    public int getNewProdCnt() throws Exception;
	
    // 특가 목록 가져오는 메서드
    public List<ProductVO> getSaleProductList(ProdCriteria pc) throws Exception;
	
    // 특가 상품 개수 가져오는 메서드
    public int getSaleCnt() throws Exception;
}
```

## ProductServiceImpl.java

```java
@Service
public class ProductServiceImpl implements ProductService {

    @Override
    public List<ProductVO> getNewProductList(ProdCriteria pc) throws Exception {
        return dao.getNewProductList(pc);
    }

    @Override
    public int getNewProdCnt() throws Exception {
        return dao.getNewProdCnt();
    }

    @Override
    public List<ProductVO> getSaleProductList(ProdCriteria pc) throws Exception {
        return dao.getSaleProductList(pc);
    }

    @Override
    public int getSaleCnt() throws Exception {
        return dao.getSaleCnt();
    }
}
```

* 서비스 클래스도 연결해 준다. 

## ProductController.java

```java
@Controller
public class ProductController {

    @Inject
    private ProductService service;
	
    private static final Logger log = LoggerFactory.getLogger(ProductController.class);
    
    @RequestMapping(value = "/new_list", method = RequestMethod.GET)
    public String newProductListGET(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
        ProdCriteria pc, Model model) throws Exception {
        pc.setPage(pageNum);
		
        int postCnt = service.getNewProdCnt();
		
        ProdPageMaker pm = new ProdPageMaker();
        pm.setCri(pc);
        pm.setTotalCnt(postCnt);

        model.addAttribute("productList", service.getNewProductList(pc));
        model.addAttribute("postCnt", postCnt);
        model.addAttribute("topcate", "신상품");
        model.addAttribute("topcate_num", 6);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pm", pm);
		
        return "product/productList";
    }
	
    @RequestMapping(value = "/sale_list", method = RequestMethod.GET)
    public String saleProductList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
            ProdCriteria pc, Model model) throws Exception {
        pc.setPage(pageNum);
		
        int postCnt = service.getSaleCnt();
		
        ProdPageMaker pm = new ProdPageMaker();
        pm.setCri(pc);
        pm.setTotalCnt(postCnt);

        model.addAttribute("productList", service.getSaleProductList(pc));
        model.addAttribute("postCnt", postCnt);
        model.addAttribute("topcate", "특가");
        model.addAttribute("topcate_num", 7);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pm", pm);
		
        return "product/productList";
    }
}
```

* 이제 컨트롤러로 와서 아까 작업했던 것들을 연결시켜 준다.
* 분류별 상품목록을 출력할 때와 다르게 신상품과 특가 상품 목록은 제목과 테이블 상에서의 대분류 번호가 고정되어 있기 때문에 인자값으로 고정된 값을 넣어주었다. 나중에 대분류와 소분류가 더 추가되어서 확장되었을 경우를 생각해보면 지금처럼 대분류 번호인 `topcate_num` 값 자체를 지정해 줄 필요가 없이 제거해도 될 거 같기도 하다... 저 번호를 활용해서 테이블에서 데이터를 불러오는 것도 아니고... 나중에 수정 해야겠다.

## productList.jsp
* 처음에 페이지 템플릿을 만들던 당시에는 신상품과 특가 상품 목록 페이지도 따로 만들었는데 이번에 DB 연결 작업을 하며 생각해보니 저 페이지들을 굳이 따로 만들 필요가 없었다. 기존에 상품 분류별로 출력하던 페이지에서 제어조건만 조금 추가해서 신상품과 특가 상품들도 출력하면 되는 것이었다. 페이지의 제목 부분만 다르지 상품 목록을 보여주고, 상품을 클릭하면 상세 페이지로 이동하는 로직은 다 같기 때문에...
* 그래서 분류별 상품을 출력할 때 썼던 `productList.jsp` 파일을 재활용했다.

```jsp
<div class="categoryBox">
    <h3 class="title">${topcate }</h3>
    <c:if test="${topcate_num <= 5 }">
        <ul class="categoryList">
        <input type="hidden" id="dcateNum" value="${dcate_num }"> 
            <li><a href="/product/product_list?cateStart=${cateStart }&cateEnd=${cateEnd}&topcate_num=${topcate_num}&pageNum=${pageNum}&dcate_num=0" 
                    class="category" id="category0" style="color: black;" 
                    onclick="changeSort(0, 0, ${fn:length(dcateList) });"> 전체보기</a>
            <c:forEach var="dcate" begin="0" end="${cateEnd-cateStart }" step="1" varStatus="it">
                <li><a href="/product/product_list?cateStart=${cateStart }&cateEnd=${cateEnd}&topcate_num=${topcate_num}&pageNum=1&dcate_num=${cateStart+dcate}" 
                    class="category" id="category${cateStart+dcate }" style="color: black;" 
                    onclick="changeSort(${cateStart+dcate }, ${cateStart }, ${fn:length(dcateList) });"> ${dcateList[it.index] }</a></li>
            </c:forEach>
        </ul>
    </c:if>
</div>
```

* `JSTL` 표현식을 사용해 페이지 종류에 따라 출력해야 할 부분을 제어해 주었다. 상단의 소분류는 분류별로 상품을 보는 페이지에서만 출력하고 신상품과 특가 상품 페이지에서는 필요하지 않아서 출력하지 않게 했다.

```jsp
<div class="pi-text">
    <a href="/product/product_detail?prod_num=${vo.prod_num }">
        <h5>${vo.prod_name }</h5>
    </a>
    <c:choose>
        <c:when test="${vo.prod_discntrate eq 0}">
            <div class="product-price">
                <fmt:formatNumber value="${vo.prod_price}"/>원
            </div>
        </c:when>
        <c:otherwise>
            <span class="product-price discountedRate">${vo.prod_discntrate}%</span>
            <span class="product-price">
                <c:set var="discnted" value="${vo.prod_price*(100-vo.prod_discntrate)/100}"/>
                <fmt:formatNumber value="${discnted+((discnted%10>5)?(10-(discnted%10))%10:-(discnted%10))}" type="number"/>원<br>
            </span>
            <div class="product-price">
                <span><fmt:formatNumber value="${vo.prod_price}" type="number"/>원</span>
            </div>
        </c:otherwise>
    </c:choose>
</div>
```

* 만약 할인하는 상품이면 십의 자리에서 반올림한 가격을 출력하도록 했다. 
* 그리고 `JSTL`의 숫자 포맷 라이브러리를 사용해서 통화에 자동으로 `,`를 찍도록 했다. 처음엔 이걸 까먹고 있어서 자바스크립트에서 정규식을 사용하는 방식으로 구현했는데... `JSTL`을 사용하는 것이 코드상으로 깔끔하고 가독성도 좋아서 통화 출력 부분은 모두 이렇게 수정했다. 

```jsp
<div class="row" id="pagediv">
    <input type="hidden" value="${pageNum }" id="curPage">
    <div class="col-lg-12 text-center">
        <c:if test="${pm.prev }">
            <a href="#" class="arrow_carrot-left_alt pagingBtn" id="prev"></a> 
        </c:if>
						
        <c:forEach var="block" varStatus="it" begin="${pm.startPage }" end="${pm.endPage }" step="1">
            <span>
                <c:choose>
                    <c:when test="${topcate_num <= 5 }">
                        <!----> <a href="/product/product_list?cateStart=${cateStart }&cateEnd=${cateEnd }&topcate_num=${topcate_num }&pageNum=${it.index}&dcate_num=${dcate_num}" 
                            class="pagingBtn" id="page${it.index }" style="color: black;"
                            onclick="changePageNum(${it.index }, ${pm.endPage });">${it.index } <!----></a>
                    </c:when>
                    <c:when test="${topcate_num > 5 }">
                        <!----> <a href="/product/new_list?pageNum=${it.index}" 
                        class="pagingBtn" id="page${it.index }" style="color: black;"
                        onclick="changePageNum(${it.index }, ${pm.endPage });">${it.index } <!----></a>
                    </c:when>
                    <c:otherwise>
                        <!----> <a href="/product/sale_list?pageNum=${it.index}" 
                                class="pagingBtn" id="page${it.index }" style="color: black;"
                                onclick="changePageNum(${it.index }, ${pm.endPage });">${it.index } <!----></a>
                    </c:otherwise>
                </c:choose>
            </span> 
        </c:forEach>
						
        <c:if test="${pm.next }">
            <a href="#" class="arrow_carrot-right_alt pagingBtn" id="next"></a> 
        </c:if>
    </div>
</div>
```

* 하단 페이지 블럭 부분에도 각 페이지 종류에 따라 다른 주소를 매핑해주도록 제어했다. 
* 이렇게 페이지 재활용 끝!! 😄<br><br><br>

# 구현하며 했던 고민
* 위에서도 기술했다시피 신상품과 특가상품 목록 페이지에서 상품 상세페이지로 이동하는 로직은 다 같은데 굳이 페이지를 나눠야 할까? 였다. 페이지들을 따로 만들지 않고 페이지 하나를 재활용해서 구현하게 된 데에는 상품 상세페이지로 이동하는 매핑주소 작업을 새로 해주기 귀찮았던 것이 가장 컸다. 
* 역시 프로그래밍은 귀찮음이 커야 효율적으로 짤 수 있다는 말이 맞는 말이란 생각이 든다...😅 <br><br><br>

# 마감까지
* `D-10`
