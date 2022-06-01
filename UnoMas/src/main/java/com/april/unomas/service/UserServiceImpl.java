package com.april.unomas.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.PointVO;
import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.domain.QnaVO;
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
		HashMap<String, Integer> loginMap = dao.loginUser(vo);
		return loginMap;
	}
	
	// 아이디 찾기
	@Override
	public int findIdProcess(UserVO vo) {
		// DAO를 호출하여 아이디가 있는지 판단.
		int result = dao.findIdProcess(vo);
		return result;
	}

	// 비번 찾기
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

	// 추가 배송지 조회
	@Override
	public List<UserVO> getAddAddr(int user_num) {
		List<UserVO> addAddrVO = dao.getAddAddr(user_num);
		return addAddrVO;
	}

	// 추가 배송지 수정
	@Override
	public void updateAddAddr(UserVO vo) {
		dao.updateAddAddr(vo);
	}

	// 비번 체크
	@Override
	public Integer checkPW(UserVO vo) {
		return dao.checkPW(vo);
	}

	// 회원 탈퇴
	@Override
	public Integer deleteUser(UserVO vo) {
		return dao.deleteUser(vo);
	}
	
	// 내 리뷰 개수
	@Override
	public Integer myReviewCnt(String num) {
		System.out.println("서비스에서 받은 유저번호: " + num);
		return dao.getMyReviewCnt(num);
	}

	// 내 리뷰
	@Override
	public List<BoardReviewVO> getMyReview(String id, UserCriteria cri) {
		return dao.getMyReview(id, cri);
	}


	// 내 상품문의 개수
	@Override
	public Integer myPqaCnt(String num) {
		return dao.MyPquestionCount(num);
	}

	// 내 상품 문의 
	@Override
	public List<ProdInquiryVO> getMyPquestion(String num, UserCriteria cri) {
		return dao.getMyPquestion(num, cri);
	}

	// 내 1:1 개수
	@Override
	public Integer MyQuestionCount(String num) {
		return dao.MyQuestionCount(num);
	}

	// 내 1:1 목록
	@Override
	public List<QnaVO> getMyQuestion(String num, UserCriteria cri) {
		return dao.getMyQuestion(num, cri);
	}
	
	// 포인트 적립
	@Override
	public void updatePoint(int user_point) {
		// TODO Auto-generated method stub
	}

	
	// 회원번호로 회원정보 가져오기
	@Override
	public UserVO getUserInfoByNum(int user_num) {
		return dao.getUserInfoByNum(user_num);
	}

	// 포인트 적립
	@Override
	public void updatePoint(int user_num, int user_point) {
		dao.updatePoint(user_num, user_point);
	}

	@Override
	public int getUserPoint(int saveNUM) {
		return dao.getUserPoint(saveNUM);
	}
	
	@Override
	public int pointCount(int saveNUM) {
		return dao.pointCount(saveNUM);
	}

	@Override
	public List<PointVO> getPointList(int saveNUM, UserCriteria cri) {
		return dao.getPointList(saveNUM, cri);
	}

	
}
