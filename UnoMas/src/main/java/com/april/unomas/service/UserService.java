package com.april.unomas.service;

import java.util.HashMap;
import java.util.Map;

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
	
	// 회원정보 가져오기
	public UserVO getUserInfo(String id);
	
	// 회원정보수정
	public void updateUser(UserVO vo);
	public void updateAddr(UserVO vo);
	
	// 회원탈퇴
	public void deleteUser(UserVO vo);
	
	// 비번 체크
	public Integer checkPW(UserVO vo);
	
}
