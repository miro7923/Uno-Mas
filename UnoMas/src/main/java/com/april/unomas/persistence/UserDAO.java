package com.april.unomas.persistence;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.EmailVO;
import com.april.unomas.domain.UserVO;

public interface UserDAO {

	public String getTime();
	public void joinAdmin(AdminVO vo);
	
	// 회원가입
	public void joinUser(UserVO vo);

	// 아이디 중복검사
	public int idCheck(UserVO vo);
	
	// 로그인
	public UserVO loginUser(UserVO vo);
	
	// 회원정보 조회
	public UserVO getUserInfo(String id);

	// 회원정보수정
	public Integer updateUser(UserVO vo);

	// 회원탈퇴
	public void delUser(UserVO vo);

	// 회원 아이디 찾기
	public int findIdProcess(UserVO vo);

	// 회원 비번 찾기
	public int findPwProcess(UserVO vo);

	// 이메일 보내기
	public int sendEmailMethod(EmailVO evo);
	
}
