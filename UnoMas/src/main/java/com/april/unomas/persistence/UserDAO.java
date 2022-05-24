package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.EmailVO;
import com.april.unomas.domain.UserCriteria;
import com.april.unomas.domain.UserVO;

public interface UserDAO {

	public String getTime();
	public void joinAdmin(AdminVO vo);
	
	// 회원가입
	public void joinUser(UserVO vo);

	// 아이디 중복검사
	public int idCheck(UserVO vo);
	
	// 로그인
	public HashMap loginUser(UserVO vo);
	
	// 아이디 찾기
	public int findIdProcess(UserVO vo);

	// 비번 찾기
	public HashMap<String, String> findPwProcess(UserVO vo);
	
	// 비번 변경
	public int changePW(UserVO vo);
	
	// 회원정보수정을 위한 비밀번호 재확인
//	public boolean checkPw(UserVO vo);
	
	// 회원정보 조회
	public UserVO getUserInfo(String id);

	// 회원정보수정
	public Integer updateUser(UserVO vo);


	// 회원탈퇴
	public Integer deleteUser(UserVO vo);

	// 비번 체크
	public Integer checkPW(UserVO vo);
	
	// 내 리뷰 개수
	public Integer getMyReviewCnt(String id);
	
	// 내 리뷰
	public List<BoardReviewVO> getMyReview(String id, UserCriteria cri);

	// 이메일 보내기
	public int sendEmailMethod(EmailVO evo);
	
	// 결제완료 후 적립금
	public void updatePoint(int user_point);
}
