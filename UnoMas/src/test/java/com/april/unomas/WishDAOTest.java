package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.domain.WishVO;
import com.april.unomas.persistence.WishDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:Src/main/webapp/WEB-INF/spring/root-context.xml"}
		)

public class WishDAOTest {
  
	@Inject
	private WishDAO dao;
	private static final Logger log = LoggerFactory.getLogger(WishDAOTest.class);
	
	

	
	@Test
	public void DAO생성테스트() {
		log.info("dao : " + dao.toString());
	}
	
//	@Test
	public void 찜목록출력테스트() throws Exception {
		log.info(dao.list()+"");
	}

	@Test
	public void 찜추가테스트() throws Exception {
		WishVO vo = new WishVO();
		vo.setUser_num(1);
		vo.setProd_num(11);
		dao.insertWish(vo);
		log.info("찜추가 완료!");
	}
	
//	@Test
	public void 찜개별삭제테스트() throws Exception {
		dao.deleteWish(10);
		log.info("찜개별삭제 완료!");
	}
	
//	@Test
	public void 찜전체삭제테스트() throws Exception {
		dao.deleteAllWish(1);
		log.info("찜전체삭제 완료!");
	}

}
