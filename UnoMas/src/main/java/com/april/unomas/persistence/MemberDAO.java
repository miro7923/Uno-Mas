package com.april.unomas.persistence;

import com.april.unomas.domain.AdminVO;

public interface MemberDAO {

	public String getTime();
	public void joinAdmin(AdminVO vo);
}
