package com.april.unomas;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class MyBatisTest {

	private static final Logger log = LoggerFactory.getLogger(MyBatisTest.class);
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void 객체확인() {
		
		log.info("@@@@@@@@ sqlSessionFactory: " + sqlFactory.toString());
	}
	
	@Test
	public void DB연결() {
		
		SqlSession session = sqlFactory.openSession();
		log.info("@@@@@@@@ session: " + session);
	}
}
