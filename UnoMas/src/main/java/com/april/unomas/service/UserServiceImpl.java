package com.april.unomas.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.UserVO;
import com.april.unomas.persistence.UserDAO;

// @Service : 스프링에서 서비스 인터페이스를 구현한 객체로 인식하게 함

@Service
public class UserServiceImpl implements UserService {

	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO dao;
	
	// 시간정보
	@Override
	public String getTimeS() {
		
		String time = dao.getTime();
		
		return time;
	}

	// 로그인
	@Override
	public UserVO loginUser(UserVO vo) {

		log.info(" 컨트롤러 -> loginUser(UserVO vo) 호출 -> dao - loginUser(vo)");
		
		UserVO loginVO = dao.loginUser(vo);
		
		return loginVO;
	}
	
	
}
