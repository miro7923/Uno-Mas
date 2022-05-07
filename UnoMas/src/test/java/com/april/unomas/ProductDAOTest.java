package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class ProductDAOTest {

	@Inject
	private ProductDAO dao;
	private static final Logger log = LoggerFactory.getLogger(ProductDAOTest.class);
	
//	@Test
	public void DAO생성테스트() {
		log.info("dao : " + dao.toString());
	}
	
//	@Test
	public void 상품목록출력테스트() throws Exception {
		log.info(dao.getProductList()+"");
	}
	
//	@Test
	public void 카테고리별상품출력() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setCateStart(1);
		pp.setCateEnd(3);
		log.info(dao.getProductList(pp)+"");
	}
	
//	@Test
	public void 상위카테고리출력테스트() throws Exception {
		log.info(dao.getTopCateName(1));
	}
	
//	@Test
	public void 하위카테고리출력테스트() throws Exception {
		log.info(dao.getDcateNames(1)+"");
	}
	
//	@Test
	public void 페이지개수만큼가져오기테스트() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setCateStart(1);
		pp.setCateEnd(3);
		pp.setPerPageNum(9);
		pp.setPage(1);
		log.info(dao.getProductPage(pp) + "");
	}
	
//	@Test
	public void 대분류별상품개수가져오기() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setCateStart(1);
		pp.setCateEnd(3);
		log.info(dao.getProductCnt(pp)+"");
	}
	
	@Test
	public void 소분류별상품목록출력() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setPage(1);
		pp.setPerPageNum(9);
		pp.setProd_category(2);
		log.info(dao.getDcateList(pp)+"");
		log.info("count: " + dao.getDcateCnt(2));
	}
	
//	@Test
	public void 신상품목록출력테스트() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setPage(0);
		pp.setPerPageNum(9);
		
		log.info(dao.getNewProductList(pp)+"");
		log.info("count: " + dao.getNewProdCnt());
	}
}
