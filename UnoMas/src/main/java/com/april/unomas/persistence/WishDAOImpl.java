package com.april.unomas.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.WishVO;

@Repository
public class WishDAOImpl implements WishDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.unomas.mapper.wishMapper";
	
	@Override
	public List<WishVO> list() throws Exception {
		return sqlSession.selectList(namespace + ".list");
	}

	@Override
	public void delete(int prod_num) throws Exception {
		sqlSession.delete(namespace + ".delete",prod_num);
		
	}

}
