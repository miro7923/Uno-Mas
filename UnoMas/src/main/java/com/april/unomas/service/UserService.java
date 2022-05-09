package com.april.unomas.service;

import com.april.unomas.domain.UserVO;

public interface UserService {

	// 시간정보
	public String getTimeS();
	
	// 로그인
	public UserVO loginUser(UserVO vo);
	
	// 회원정보 수정
	public UserVO getUserInfo(String id);
	
	// 회원정보수정
	public void updateUser(UserVO vo);
	
	// 회원탈퇴
	public void delUser(UserVO vo);
}
