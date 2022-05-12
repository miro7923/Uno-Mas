package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.service.WishService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class WishServiceTest {

	@Inject
	private WishService service;
	
	private static final Logger log = LoggerFactory.getLogger(WishServiceTest.class);
	
	@Test
	public void 찜목록출력테스트() throws Exception {
		log.info(service.list()+"");
	}
	

}
