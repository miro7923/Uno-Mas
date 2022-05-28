package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	private static String NAMESPACE = "com.april.unomas.mappers.cartMapper";

	@Inject
	SqlSession sqlSession;
	CartDAO cartDao;

	@Override
	public int insert(CartVO vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}

	@Override
	public List<CartVO> listCart(int user_num) {
		return sqlSession.selectList("listCart", user_num);
	}

	@Override
	public void delete(int cart_num) {
		sqlSession.delete("delete", cart_num);
	}

	@Override
	public void deleteAll(int user_num) {
		sqlSession.delete("deleteAll", user_num);
	}


	@Override
	public int countCart(int user_num, int prod_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prod_num", prod_num);
		map.put("user_num", user_num);
		return sqlSession.selectOne("countCart", map);
	}

	@Override
	public int updateCart(CartVO vo) {
		return sqlSession.update("updateCart", vo);
	}

	@Override
	public void modifyCart(CartVO vo) {
		sqlSession.update("modifyCart", vo);
	}

	@Override
	public int sumMoney(int user_num) {
		sqlSession.selectOne("sumMoney", user_num);
		return sqlSession.selectOne("sumMoney", user_num);
	}

	@Override
	public CartVO getSelectedItem(int cart_num) {
		return sqlSession.selectOne(NAMESPACE + ".getSelectedItems", cart_num);
	}

	@Override
	public void deleteByUserNum(int user_num, int prod_num) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_num", user_num);
		map.put("prod_num", prod_num);
		
		sqlSession.delete(NAMESPACE + ".deleteByUserNum", map);
	}
}