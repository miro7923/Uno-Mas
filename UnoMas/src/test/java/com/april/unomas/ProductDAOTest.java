package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.domain.ProductVO;
import com.april.unomas.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:Src/main/webapp/WEB-INF/spring/root-context.xml"}
		)

public class ProductDAOTest {
	
	private static final Logger log = LoggerFactory.getLogger(ProductDAOTest.class);
	
	@Inject
	private ProductDAO dao;
	
	@Test
	public void 상품등록() throws Exception {
		ProductVO vo = new ProductVO();
		
		vo.setProd_num(1);
		vo.setProd_name("청경채");
//		String prod_name = "청경채";
		
		dao.insertProduct(vo);
		log.info("완료");
	}
}
