# JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 13 - 대분류별 상품목록페이지에서 소분류별 상품 출력하는 기능 구현

* 작성일 : 2022.05.05
* 작성자 : 황유진

* 팀원 : 김진영, 박승지, 반현빈, 오성은, 오은현, 윤정환, 황유진
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
* 총 팀원은 7명이며, 우리 팀은 `1인 가구를 위한 쇼핑몰`을 주제로 정했다.
* 팀 이름으로 정해진 `Uno más`는 스페인어로 `하나 더`라는 뜻이다. <br><br><br>

# 진행상황 

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_dcate1.png" width="900"></p>

* 상품목록페이지에서 소분류를 클릭하면 선택한 소분류별로 모아볼 수 있는 기능을 구현했다.

## ProdPaging.java

```java
package com.april.unomas.domain;

import lombok.Data;

@Data
public class ProdPaging {

	private int cateStart;
	private int cateEnd;
	private int startRow;
	private int pageSize;
	private int prod_category;
}
```

* 상품목록페이지에서 상품을 출력할 때 DB에서 한 페이지에 보여줄 만큼만 가져와서 출력할 것인데 그럴려면 DB에서 조회시 지정해줘야 할 파라미터값이 많다. `SqlSession`의 `selectList()`와 같은 메서드를 사용할 때 전달 인자값은 하나만 지정할 수 있기 때문에 둘 이상을 보내려면 `Map`을 사용하거나 `VO` 객체를 만들어 전달해야 하는데 페이징 처리용 정보는 여러 메서드에서 사용되기 때문에 `VO` 객체를 만들었다.

## productMapper.xml

```xml
<mapper namespace="com.unomas.mapper.ProductMapper">
    <!-- 소분류별로 상품 가져오기 -->
    <select id="getDcateProducts" resultType="ProductVO">
        SELECT * 
        FROM products 
        WHERE prod_category = #{prod_category}
        LIMIT #{startRow}, #{pageSize}
    </select>
    
    <!-- 소분류별 상품 개수 가져오기 -->
    <select id="getDcateCnt" resultType="Integer">
        SELECT count(*) 
        FROM products 
        WHERE prod_category = #{prod_category}
    </select>
</mapper>
```

* 소분류는 소분류를 저장한 테이블에서 `1 - 고구마, 감자, 당근 / 2 - 양파, 대파, 마늘, 배추`와 같은 형태로 인덱스 번호를 가지고 저장되어 있다. 그리고 모든 상품은 자기가 속한 소분류의 인덱스 번호를 외래키로 가지고 있다. 그래서 사용자가 화면에 보여지는 소분류에 인덱스 번호를 매핑해 놓고 클릭하면 해당 번호로 상품들을 가져오도록 한다.
* 이때 `LIMIT` 범위 안의 상품들만 가져오도록 한다.(상품의 개수가 몇 백개, 몇 만개 이상으로 많아졌는데 한 페이지에 그걸 다 출력하기 위해 가져온다면... 페이지는 응답이 없을 것이다...)

## ProductDAO.java

```java
public interface ProductDAO {
	
	// 소분류별로 분류해서 가져오기
	public List<ProductVO> getDcateList(ProdPaging pp) throws Exception;
	
	// 소분류별 상품 개수
	public Integer getDcateCnt(int prod_category) throws Exception;
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
	public List<ProductVO> getDcateList(ProdPaging pp) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getDcateProducts", pp);
	}

	@Override
	public Integer getDcateCnt(int prod_category) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getDcateCnt", prod_category);
	}
}
```

* `DAO`를 통해 DB에서 상품 정보를 불러온다.

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
	public void 소분류별상품출력테스트() throws Exception {
		ProdPaging pp = new ProdPaging();
		pp.setStartRow(0);
		pp.setPageSize(9);
		pp.setProd_category(2);
		log.info(dao.getDcateList(pp)+"");
		log.info(dao.getDcateCnt(2)+"");
	}
}
```

* 서비스 코드에 넣기 전 테스트를 진행했다. 결과가 잘 나왔기 때문에 다음 단계로 넘어간다.

## ProductService.java

```java
public interface ProductService {
	
	// 소분류별로 분류해서 가져오기
	public List<ProductVO> getDcateList(ProdPaging pp) throws Exception;
	
	// 소분류별 상품 개수
	public Integer getDcateCnt(int prod_category) throws Exception;
}
```

## ProductServiceImpl.java

```java
@Service
public class ProductServiceImpl implements ProductService {

	@Override
	public List<ProductVO> getDcateList(ProdPaging pp) throws Exception {
		return dao.getDcateList(pp);
	}

	@Override
	public Integer getDcateCnt(int prod_category) throws Exception {
		return dao.getDcateCnt(prod_category);
	}
}
```

* 서비스 클래스도 연결해 준다. 서비스 레이어에서는 DB단과 컨트롤러단을 연결해 주는 역할을 하기 때문에 DB단 테스트가 잘 되었으면 여기서도 별 문제가 없어야 한다. 그런데 DB단에서는 잘 되는데 서비스단에 자꾸 테스트에 실패하는 것이었다. 같은 쿼리문 그대로 쓰는 건데 무슨 일...?
* 일단 STS를 껐다 켜 봤는데 갑자기 잘 되었다. 그냥 이클립스 버그였나보다...

## ProductController.java

```java
@Controller
public class ProductController {

    @Inject
    private ProductService service;
	
    private static final Logger log = LoggerFactory.getLogger(ProductController.class);
    
    @RequestMapping(value = "/product_list", method = RequestMethod.GET) // /shop -> /product_list
	public String shopGET(@RequestParam("topcate_num") int topcate_num, 
			@RequestParam("cateStart") int cateStart, @RequestParam("cateEnd") int cateEnd, 
			@RequestParam("pageNum") int pageNum, @RequestParam("dcate_num") int dcate_num, 
			Model model) throws Exception {
        // 페이징 처리에 필요한 정보를 담은 객체 
        ProdPaging pp = new ProdPaging();
        pp.setCateStart(cateStart);
        pp.setCateEnd(cateEnd);
		
        // 페이징 처리 작업
        int pageSize = 9;
		
        int curPage = pageNum;
		
        // 현재 페이지정보를 이용해서 시작 행 정보 계산
        int startRow = (curPage - 1) * pageSize;
		
        // 하단 페이징 처리 //////
        // 현재 분류별 전체 상품 개수 얻기
        // dcate_num(소분류) 번호가 0이라면 전체를 불러오는 것이고
        // 1이상이라면 각각의 소분류만 불러오는 것이다.
        int postCnt = 0;
        if (dcate_num == 0) {
            postCnt = service.getProductCnt(pp);
        }
        else {
            postCnt = service.getDcateCnt(dcate_num);
        }
		
        // 페이지 전체 블록 개수 계산
        int pageCnt = postCnt / pageSize + ((postCnt % pageSize == 0) ? 0 : 1);
		
        // 한 번에 보여줄 페이지 블록 개수
        int pageBlockCnt = 10;
		
        // 시작 페이지 번호 구하기
        int startBlock = ((curPage - 1) / pageBlockCnt) * pageBlockCnt + 1;
		
        // 끝 페이지 블록 번호 구하기
        int endBlock = startBlock + pageBlockCnt - 1;
        if (endBlock > pageCnt)
            endBlock = pageCnt;
		
        pp.setStartRow(startRow);
        pp.setPageSize(pageSize);
        pp.setProd_category(dcate_num);
		
        Map<String, Object> map = new HashMap<String, Object>();
		
        List<ProductVO> productList = null;
        // 소분류 번호가 0이면 전체 목록을 가져오고 아니라면 해당 소분류에 맞는 상품들을 가져온다.
        if (dcate_num == 0) {
            productList = service.getProductPage(pp);
        }
        else {
            productList = service.getDcateList(pp);
        }
		
        // 글 목록 정보 저장
        map.put("productList", productList);
        map.put("cateStart", cateStart);
        map.put("cateEnd", cateEnd);
        map.put("topcate_num", topcate_num);
        map.put("topcate", service.getTopCateName(topcate_num));
        map.put("dcate_num", dcate_num);
        map.put("dcateList", service.getDcateNames(topcate_num));
		
        // 페이지 처리 정보 저장
        map.put("postCnt", postCnt);
        map.put("pageNum", pageNum);
        map.put("pageCnt", pageCnt);
        map.put("pageBlockCnt", pageBlockCnt);
        map.put("startBlock", startBlock);
        map.put("endBlock", endBlock);
		
        model.addAllAttributes(map);
		
        return "product/productList";
    }
}
```

* 이제 컨트롤러로 와서 아까 작업했던 것들을 연결시켜 준다.
* 파라미터로 받은 페이지 정보를 이용해서 현재 페이지에 표시되어야 할 상품 목록을 구해 `Model`에 저장한다.
* 대분류와 소분류별로 출력할 때 필요한 파라미터값들도 함께 저장해 뷰 페이지에서 다음 목록을 보여주어야 할 때 사용할 수 있도록 한다.
* `/product/product_list?cateStart=4&cateEnd=6&topcate_num=2&pageNum=1&dcate_num=0`
* 상품목록페이지에서 대소분류별 출력과 페이징 처리에 필요한 정보들을 `GET` 방식으로 파라미터를 넘겨주도록 했다. 그래서 새로운 페이지 호출이 있으면 이 파라미터들을 가지고 컨트롤러로 이동해 DB에서 목록을 불러온 다음 뷰 페이지로 이동하는 것이다.<br><br><br>

# 구현하며 했던 고민
* 이 부분을 구현하면서 상품목록페이지 내에서 소분류를 클릭하면 비동기 방식으로 목록을 가져와서 보여줄 것인지 지금 구현한 방식처럼 동기식으로 목록을 가져올 것인지 좀 고민을 하며 마켓컬리, 쿠팡과 같은 사이트들을 참고했다. 
* 마켓컬리는 비동기 방식, 쿠팡은 동기 방식이었는데 처음엔 마켓컬리처럼 비동기 방식으로 소분류를 보여주고 싶었지만 그러려면 지금 내가 알고 있는 기술 중에서는 `ajax`를 써야 했다. 

```jsp
<c:forEach var="vo" items="${productList }" varStatus="it">
    <div class="col-lg-4 col-sm-6">
        <div class="product-item" id="productItem">
            <div class="pi-pic">
                <a href="product_detail"> 
                    <img src="${path}/resources/img/product-single/product_vegi01.jpeg" alt="">
                </a>
                <ul>
                    <!-- 카트담기 버튼 -->
                    <li class="w-icon active"><a href="#">
                        <i class="icon_bag_alt"></i></a>
                    </li>
                </ul>
            </div>
            <div class="pi-text">
                <a href="#">
                    <h5>${vo.prod_name }</h5>
                </a>
                <div class="product-price" id="prod${it.index }">
                    ${vo.prod_price }원
                </div>
            </div>
        </div>
    </div>
</c:forEach>
```

* 하지만 `ajax`로 가져오게 되면 상품 목록을 자바스크립트로 화면에 뿌려줘야 했는데 기존에 상품목록 출력 부분을 구현한 방식은 위와 같이 컨트롤러에서 `Model`에 저장한 정보들을 `JSTL`로 읽어와 출력하는 방식이었다. 그래서 `ajax`로 하려면 상품목록 출력 방식을 다 새로 작성해야 했다. 이렇게 할 시간은 없기 때문에 비동기 방식은 포기하고 쿠팡을 참고해 동기 방식으로 소분류별로 모아서 보여주는 방식을 택했다.
* 이번 프로젝트 설계 시에는 상품 목록 페이지에서 카테고리별로 어떻게 보여줄 것이고, 또 정렬 기준별로는 파라미터를 어떻게 받아와서 어떤 통신 방식으로 보여줄 지 상세한 설계를 하지 않고 시작했기 때문에 나중에는 기존에 짜여진 틀 내에서만 구현이 가능한, 한마디로 구현 가능한 선택지가 줄어들게 되는 부분들이 있었다. 설계를 열심히 하고 시작했다고 생각했는데 아직 배울 것이 많이 남았다는 생각이 든다. 다음엔 더 철저하게 설계하고 시작하자!<br><br><br>

# 마감까지
* `D-15`
