package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.persistence.WishDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:Src/main/webapp/WEB-INF/spring/root-context.xml"}
		)

public class WishDAOTest {
  
	@Inject
	private WishDAO dao;
	private static final Logger log = LoggerFactory.getLogger(WishDAOTest.class);
	
	

	
//	@Test
	public void DAO생성테스트() {
		log.info("dao : " + dao.toString());
	}
	
	@Test
	public void 찜목록출력테스트() throws Exception {
		log.info(dao.list()+"");
	}
	

}
