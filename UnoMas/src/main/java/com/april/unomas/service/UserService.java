package com.april.unomas.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.UserCriteria;
import com.april.unomas.domain.UserVO;

public interface UserService {

	// 시간정보
	public String getTimeS();
	
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
	public Integer getMyReviewCnt(String id);
	
	// 내 리뷰
	public List<BoardReviewVO> getMyReview(String id, UserCriteria cri);
}
