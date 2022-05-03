package com.april.unomas.persistence;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.UserVO;

public interface UserDAO {

	public String getTime();
	public void joinAdmin(AdminVO vo);
	
	// 로그인(GET)
	public UserVO loginUser(UserVO vo);
	// 로그인(POST)
	public UserVO loginUser(String string, String string2);
	
}
