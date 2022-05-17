package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.CommonCriteria;
import com.april.unomas.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.unomas.mapper.adminMapper";
	private static final Logger log = LoggerFactory.getLogger(AdminDAOImpl.class);

	
	// 관리자 - User파트
	@Override
	public Integer allUserCount() {	
		return Integer.parseInt(sqlSession.selectOne(NAMESPACE+".allUserCount"));
	}

	@Override
	public List<UserVO> getAllUser(String standard, CommonCriteria cri) throws Exception{
		Map<String, Object> map = new HashMap();
		map.put("standard", standard);
		map.put("cri", cri);
		return sqlSession.selectList(NAMESPACE+".getAllUser", map);
	}

	
	@Override
	public List<UserVO> getDropUser(CommonCriteria cri) throws Exception {
		System.out.println("DAO: 탈퇴조회 여기까지 들어와??");
		return sqlSession.selectList(NAMESPACE+".getDropUser");
	}
	
	
	
}
