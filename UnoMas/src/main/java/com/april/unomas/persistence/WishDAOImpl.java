package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<WishVO> list(int user_num) throws Exception {
		return sqlSession.selectList(namespace + ".list",user_num);
	}

	@Override
	public void deleteWish(int wish_num) throws Exception {
		sqlSession.delete(namespace + ".deleteWish",wish_num);
		
	}

	@Override
	public void deleteAllWish(int user_num) throws Exception {
		sqlSession.delete(namespace + ".deleteAllWish",user_num);
	}

	@Override
	public void deleteCheckWish(WishVO wish) throws Exception {
		sqlSession.delete(namespace + ".deleteCheckWish",wish);
	}

	@Override
	public void insertCheckWish(WishVO wish) throws Exception {
		sqlSession.insert(namespace + ".insertCheckWish",wish);
	}

	@Override
	public void insertCart(int user_num, int prod_num, int prod_amount) throws Exception {
		Map<String, Object> cart = new HashMap<String, Object>();
		cart.put("user_num", user_num);
		cart.put("prod_num", prod_num);
		cart.put("prod_amount", prod_amount);
		
		sqlSession.insert(namespace + ".insertCart", cart);
	}

	@Override
	public int checkCart(int user_num, int prod_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_num",user_num);
		map.put("prod_num",prod_num);
		
		return sqlSession.selectOne(namespace + ".checkCart" , map);
	}

}
