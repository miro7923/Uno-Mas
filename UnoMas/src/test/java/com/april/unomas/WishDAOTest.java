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
		log.info(dao.list(1)+"");
	}
	
//	@Test
	public void 찜X삭제버튼테스트() throws Exception {
		dao.deleteWish(10);
		log.info("찜개별삭제 완료!");
	}
	
//	@Test
	public void 찜선택삭제테스트() throws Exception {
		WishVO user = new WishVO();
		user.setWish_num(17);
		user.setUser_num(1);
		dao.deleteCheckWish(user);
		log.info("찜선택삭제 완료!");
	}
	
//	@Test
	public void 장바구니선택담기테스트() throws Exception {
		WishVO user = new WishVO();
		for(int i=10;i<14;i++) {
			user.setUser_num(1);
			user.setProd_num(i);
			dao.insertCheckWish(user);
		}
		log.info("장바구니선택담기 완료!");
	}
	
//	@Test
	public void 찜전체삭제테스트() throws Exception {
		dao.deleteAllWish(1);
		log.info("찜전체삭제 완료!");
	}

}
