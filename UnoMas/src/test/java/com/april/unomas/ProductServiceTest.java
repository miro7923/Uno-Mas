package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.domain.ProdCriteria;
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
		ProdCriteria pp = new ProdCriteria();
		pp.setTopcate_num(1);
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
		ProdCriteria pp = new ProdCriteria();
		pp.setTopcate_num(1);
		pp.setPage(9);
		pp.setPerPageNum(1);
		log.info(service.getProductPage(pp)+"");
	}
	
//	@Test
	public void 대분류별상품개수가져오기() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setTopcate_num(1);
		log.info(service.getProductCnt(pp)+"");
	}
	
//	@Test
	public void 소분류별상품출력테스트() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setPage(0);
		pp.setPerPageNum(9);
		pp.setProd_category(2);
		log.info(service.getDcateList(pp)+"");
		log.info(service.getDcateCnt(2)+"");
	}
	
//	@Test
	public void 상품하나정보출력테스트() throws Exception {
		log.info(service.getProduct(10)+"");
	}
	
//	@Test
	public void 카트에상품넣기테스트() throws Exception {
		service.insertCart(1, 10, 1);
	}
	
//	@Test
	public void 신상품목록출력테스트() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setPage(0);
		pp.setPerPageNum(9);
		
		log.info(service.getNewProductList(pp)+"");
		log.info(service.getNewProdCnt()+"");
	}
}
