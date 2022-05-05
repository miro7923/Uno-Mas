package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.domain.ProdPaging;
import com.april.unomas.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class ProductServiceTest {

	@Inject
	private ProductService service;
	
	private static final Logger log = LoggerFactory.getLogger(ProductServiceTest.class);
	
//	@Test
	public void 상품목록출력테스트() throws Exception {
		log.info(service.getProductList()+"");
	}
	
//	@Test
	public void 카테고리별출력테스트() throws Exception {
		ProdPaging pp = new ProdPaging();
		pp.setCateStart(1);
		pp.setCateEnd(3);
		log.info(service.getProductList(pp)+"");
	}
	
//	@Test
	public void 상품상위카테고리이름() throws Exception {
		log.info(service.getTopCateName(2));
	}
	
//	@Test
	public void 하위카테고리목록출력테스트() throws Exception {
		log.info(service.getDcateNames(3)+"");
	}
	
//	@Test
	public void 페이지개수만큼가져오기() throws Exception {
		ProdPaging pp = new ProdPaging();
		pp.setCateStart(1);
		pp.setCateEnd(3);
		pp.setPageSize(9);
		pp.setStartRow(1);
		log.info(service.getProductPage(pp)+"");
	}
	
//	@Test
	public void 대분류별상품개수가져오기() throws Exception {
		ProdPaging pp = new ProdPaging();
		pp.setCateStart(1);
		pp.setCateEnd(3);
		log.info(service.getProductCnt(pp)+"");
	}
	
	@Test
	public void 소분류별상품출력테스트() throws Exception {
		ProdPaging pp = new ProdPaging();
		pp.setStartRow(0);
		pp.setPageSize(9);
		pp.setProd_category(2);
		log.info(service.getDcateList(pp)+"");
		log.info(service.getDcateCnt(2)+"");
	}
}
