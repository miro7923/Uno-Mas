package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.domain.ProductVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProdPageMaker;
import com.april.unomas.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:Src/main/webapp/WEB-INF/spring/root-context.xml"}
		)

public class ProductDAOTest {
  
	@Inject
	private ProductDAO dao;
	private static final Logger log = LoggerFactory.getLogger(ProductDAOTest.class);
	
	
//	@Test
	public void 상품등록() throws Exception {
		ProductVO vo = new ProductVO();
		vo.setProd_num(1);
		vo.setProd_name("청경채");
		dao.insertProduct(vo);
	}
	
//	@Test
	public void DAO생성테스트() {
		log.info("dao : " + dao.toString());
	}
	
//	@Test
	public void 카테고리별상품출력() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setTopcate_num(1);
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
	public void 대분류별페이지개수만큼가져오기테스트() throws Exception {
		ProdCriteria pp = new ProdCriteria();
		pp.setTopcate_num(4);
		pp.setPerPageNum(9);
		pp.setPage(1);
		log.info(dao.getProductPage(pp) + "");
		log.info(dao.getProductCnt(pp)+"");
	}
	
//	@Test
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
	
//	@Test
	public void 특가목록출력테스트() throws Exception {
		ProdCriteria pc = new ProdCriteria();
		ProdPageMaker pm = new ProdPageMaker();
		pm.setCri(pc);
		pm.setTotalCnt(dao.getSaleCnt());
		
		log.info(dao.getSaleProductList(pc)+"");
		log.info(pm.getTotalCnt()+"");
	}
	
//	@Test
	public void 유저위시리스트확인() throws Exception {
		log.info("Is in wishlist? " + dao.isInWishlist(1, 9));
	}
	
	@Test
	public void 상품별리뷰글개수() throws Exception {
		ProdCriteria pc = new ProdCriteria();
		pc.setProd_num(84);
		pc.setPerPageNum(7);
		log.info("글목록: " + dao.getReviewList(pc));
	}
}
