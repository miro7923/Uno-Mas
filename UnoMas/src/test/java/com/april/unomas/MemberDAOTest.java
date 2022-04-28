package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class MemberDAOTest {

	private static final Logger log = LoggerFactory.getLogger(MemberDAOTest.class);
	
	@Inject
	private MemberDAO dao;
	
	@Test
	public void 객체주입확인() {
		
		log.info(dao.toString());
	}
	
	@Test
	public void DB시간확인() {
		
		String time = dao.getTime();
		log.info("DB시간 : " + time);
	}
	
//	@Test
	public void 관리자등록확인() {
		
		AdminVO vo = new AdminVO();
		vo.setAdmin_id("admin");
		vo.setAdmin_pass("1234");
		
		dao.joinAdmin(vo);
		
		log.info("TEST : 관리자 등록 완료");
		log.info("TEST : vo - " + vo);
	}
}
