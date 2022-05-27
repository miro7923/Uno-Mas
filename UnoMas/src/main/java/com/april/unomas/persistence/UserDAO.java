package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.EmailVO;

import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.UserCriteria;

import com.april.unomas.domain.UserVO;

public interface UserDAO {

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
	
	// 회원정보 조회
	public UserVO getUserInfo(String id);

	// 회원정보수정
	public Integer updateUser(UserVO vo);
	
	// 추가 배송지 조회
	public List<UserVO> getAddAddr(int user_num);
	
	// 추가 배송지 수정
	public Integer updateAddAddr(UserVO vo); 

	// 회원탈퇴
	public Integer deleteUser(UserVO vo);

	// 비번 체크
	public Integer checkPW(UserVO vo);
	
	// 내 리뷰 개수
	public Integer getMyReviewCnt(String num);
	
	// 내 리뷰
	public List<BoardReviewVO> getMyReview(String num, UserCriteria cri);
	
	// 내 상품문의 개수
	public Integer MyPquestionCount(String num);

	// 내 상품 문의
	public List<ProdInquiryVO> getMyPquestion(String num, UserCriteria cri);
	
	// 내 1:1 개수
	public Integer MyQuestionCount(String num);
	
	// 내 1:1 목록
	public List<QnaVO> getMyQuestion(String num, UserCriteria cri);
	
	// 결제완료 후 적립금
	public void updatePoint(int user_point);


	// 이메일 보내기
	public int sendEmailMethod(EmailVO evo);
	
	// 회원번호로 회원정보 가져오기
	public UserVO getUserInfoByNum(int user_num);
	
	// 결제완료 후 적립금
	public void updatePoint(int user_num, int user_point);
}
