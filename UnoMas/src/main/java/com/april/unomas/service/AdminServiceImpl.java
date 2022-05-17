package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.CommonCriteria;
import com.april.unomas.domain.UserVO;
import com.april.unomas.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO dao;
	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);

	
	@Override
	public Integer allUserCount() {
		return dao.allUserCount();
	}

	@Override
	public List<UserVO> getAllUser(String standard, CommonCriteria cri) throws Exception{
		return dao.getAllUser(standard, cri);
	}

	@Override
	public List<UserVO> getDropUser(CommonCriteria cri) throws Exception {
		return dao.getDropUser(cri);
	}
	

	
}
