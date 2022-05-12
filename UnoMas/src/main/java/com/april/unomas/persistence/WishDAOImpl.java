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
	public void deleteWish(int prod_num) throws Exception {
		sqlSession.delete(namespace + ".deleteWish",prod_num);
		
	}

	@Override
	public void insertWish(WishVO vo) throws Exception {
		sqlSession.insert(namespace + ".insertWish",vo);
		
	}

	@Override
	public void deleteAllWish(int user_num) throws Exception {
		sqlSession.delete(namespace + ".deleteAllWish",user_num);
	}

}
