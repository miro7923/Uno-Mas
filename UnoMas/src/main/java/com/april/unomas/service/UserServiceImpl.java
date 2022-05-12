package com.april.unomas.service;

import java.util.HashMap;
import java.util.Map;

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
	
	// 회원가입
	@Override
	public void joinUser(UserVO vo) {
		dao.joinUser(vo);
	}

	// 로그인 중복체크
	@Override
	public int idCheck(UserVO vo) {
		int result = dao.idCheck(vo);
		return result;
	}


	// 로그인
	@Override
	public UserVO loginUser(UserVO vo) {

		log.info(" 컨트롤러 -> loginUser(UserVO vo) POST호출 -> dao - loginUser(vo) POST");
		
		UserVO loginVO = dao.loginUser(vo);
		
		return loginVO;
	}
	
	// 아이디 찾기
	@Override
	public int findIdProcess(UserVO vo) {
		// DAO를 호출하여 아이디가 있는지 판단.
		int result = dao.findIdProcess(vo);
		return result;
	}

	// 비번찾기
	@Override
	public HashMap<String, String> findPwProcess(UserVO vo) {
		HashMap<String, String> findpw_map = dao.findPwProcess(vo);
		
		return findpw_map;
	}
	
	// 비번 변경
	@Override
	public int changePW(UserVO vo) {
		int result = dao.changePW(vo);
		return result;
	}
	
	
	// 회원 정보 조회
	@Override
	public UserVO getUserInfo(String id) {
		UserVO userInfoVO = dao.getUserInfo(id);
		
		return userInfoVO;
	}
	
	

	// 회원정보수정
	@Override
	public void updateUser(UserVO vo) {
		dao.updateUser(vo);
	}


	// 회원 탈퇴
	@Override
	public void delUser(UserVO vo) {

		dao.delUser(vo);
	}
	

	
	
	
	
}