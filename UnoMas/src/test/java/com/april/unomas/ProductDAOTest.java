package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class ProductDAOTest {

	@Inject
	private ProductDAO dao;
	private static final Logger log = LoggerFactory.getLogger(ProductDAOTest.class);
	
	@Test
	public void DAO생성테스트() {
		log.info("dao : " + dao.toString());
	}
}
