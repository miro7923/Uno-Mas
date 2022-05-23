package com.april.unomas.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.UserCriteria;
import com.april.unomas.domain.UserVO;
import com.april.unomas.persistence.UserDAO;

// @Service : 스프링에서 서비스 인터페이스를 구현한 객체로 인식하게 함

@Service
public class UserServiceImpl implements UserService {

	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO dao;
	
	
	// 회원가입
	@Override
	public void joinUser(UserVO vo) {
		dao.joinUser(vo);
	}

	// 아이디 중복체크
	@Override
	public int idCheck(UserVO vo) {
		int result = dao.idCheck(vo);
		return result;
	}


	// 로그인
	@Override
	public HashMap loginUser(UserVO vo) {
		return dao.loginUser(vo);
	}
	
	// 아이디 찾기
	@Override
	public int findIdProcess(UserVO vo) {
		return dao.findIdProcess(vo);
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

	// 비번 체크
	@Override
	public Integer checkPW(UserVO vo) {
		return dao.checkPW(vo);
	}

//	@Override
//	public void updateAddr(UserVO vo) {
//		dao.updateAddr(vo);
//	}


	// 회원 탈퇴
	@Override
	public Integer deleteUser(UserVO vo) {
		return dao.deleteUser(vo);
	}

	// 내 리뷰 개수
	@Override
	public Integer getMyReviewCnt(String num) {
		System.out.println("서비스에서 받은 유저번호: " + num);
		return dao.getMyReviewCnt(num);
	}

	// 내 리뷰
	@Override
	public List<BoardReviewVO> getMyReview(String id, UserCriteria cri) {
		return dao.getMyReview(id, cri);
	}


	
	
	
	
}
