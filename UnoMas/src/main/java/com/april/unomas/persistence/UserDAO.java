package com.april.unomas.persistence;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.UserVO;

public interface UserDAO {

	public String getTime();
	public void joinAdmin(AdminVO vo);
	
	// 로그인
	public UserVO loginUser(UserVO vo);
	
	// 회원정보수정
	public Integer updateUser(UserVO vo);
	
	// 회원탈퇴
	public void delUser(UserVO vo);
	
}
