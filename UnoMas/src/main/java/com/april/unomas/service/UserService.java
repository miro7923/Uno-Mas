package com.april.unomas.service;

import com.april.unomas.domain.UserVO;

public interface UserService {

	// 시간정보
	public String getTimeS();
	
	// 로그인
	public UserVO loginUser(UserVO vo);
}
