package com.april.unomas.persistence;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.UserVO;

public interface UserDAO {

	public String getTime();
	public void joinAdmin(AdminVO vo);
	
	// 로그인
	public UserVO loginUser(UserVO vo);
	
}
