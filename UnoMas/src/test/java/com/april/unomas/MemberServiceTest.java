package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class MemberServiceTest {

	private static final Logger log = LoggerFactory.getLogger(MemberServiceTest.class);
	
	@Inject
	private MemberService service;
	
	@Test
	public void 시간체크서비스() {
		
		String time = service.getTimeS();
		log.info(time);
	}
}