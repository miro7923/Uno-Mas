package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.UserVO;
import com.april.unomas.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class UserDAOTest {

	private static final Logger log = LoggerFactory.getLogger(UserDAOTest.class);
	
	@Inject
	private UserDAO dao;
	
	//@Test
	public void 객체주입확인() {
		
		log.info(dao.toString());
	}
	
//	@Test
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
	
//	@Test
	public void 비번변경테스트() {
		UserVO vo = new UserVO();
		vo.setUser_id("user1");
		vo.setUser_pass("Tmvmfld00@");
		dao.changePW(vo);
	}
	
	//@Test
	public void 회원탈퇴테스트() {
		UserVO vo = new UserVO();
		vo.setUser_id("user4");
		vo.setUser_pass("1212");
		dao.deleteUser(vo);
	}
	
	//@Test
	public void 로그인테스트() {
		UserVO vo = new UserVO();
		vo.setUser_id("user6");
		vo.setUser_pass("111111");
		dao.loginUser(vo);
	}
	
//	@Test
//	public void 회원정보수정테스트() {
//		UserVO vo = new UserVO();
//		vo.setUser_name("육");
//		vo.setUser_email("user6@naver.com");
//		vo.setUser_birth("2003-05-26");
//		vo.setUser_phone("01020020202");
//		dao.updateUser(vo);
//		
//	}
	
	@Test
	public void 회원번호로정보가져오기() {
		log.info("@@@@@@@@@@@ vo: "+dao.getUserInfoByNum(1));
	}
}
