package com.april.unomas.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.UserCriteria;
import com.april.unomas.domain.UserVO;

public interface UserService {
	
	// 회원가입
	public void joinUser(UserVO vo);

	// 아이디 중복체크
	public int idCheck(UserVO vo);
	
	// 로그인
	public HashMap loginUser(UserVO vo);
	
	// 아이디 찾기
	public int findIdProcess(UserVO vo);
	
	// 비번 찾기
	public HashMap<String, String> findPwProcess(UserVO vo);
	
	// 비번 변경
	public int changePW(UserVO vo);
	
	// 회원 정보 가져오기
	public UserVO getUserInfo(String id);
		
	// 회원정보수정
	public void updateUser(UserVO vo);

	
	// 비번체크
	public Integer checkPW(UserVO vo);
	
	// 회원탈퇴
	public Integer deleteUser(UserVO vo);
	
	// 내 리뷰 개수
	public Integer myReviewCnt(String id);
	
	// 내 리뷰
	public List<BoardReviewVO> getMyReview(String num, UserCriteria cri);
	
	// 내 상품 리뷰 개수
	public Integer myPqaCnt(String num);
	
	// 내 1:1 개수
	public Integer MyQuestionCount(String num);

	// 내 1:1 목록
	public List<QnaVO> getMyQuestion(String num, UserCriteria cri);
		
	// 내 상품 리뷰
	public List<ProdInquiryVO> getMyPquestion(String num, UserCriteria cri);
}
