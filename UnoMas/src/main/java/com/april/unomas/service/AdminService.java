package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.CommonCriteria;
import com.april.unomas.domain.UserVO;


public interface AdminService {
	
	public Integer allUserCount();

	public List<UserVO> getAllUser(String standard, CommonCriteria cri) throws Exception;
	
	public List<UserVO> getDropUser(CommonCriteria cri) throws Exception;
}
