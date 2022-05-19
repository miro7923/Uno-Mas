package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.april.unomas.domain.WishVO;
import com.april.unomas.persistence.WishDAO;

@Service
public class WishServiceImpl implements WishService {

	@Inject
	private WishDAO dao;
	
	@Override
	public List<WishVO> list(int user_num) throws Exception {
		return dao.list(user_num);
	}

	@Override
	public void deleteWish(int wish_num) throws Exception {
		dao.deleteWish(wish_num);
	}

	@Override
	public void insertWish(WishVO vo) throws Exception {
		dao.insertWish(vo);
	}

	@Override
	public void deleteAllWish(int user_num) throws Exception {
		dao.deleteAllWish(user_num);
	}

	@Override
	public void deleteCheckWish(WishVO wish) throws Exception {
		dao.deleteCheckWish(wish);
	}

	@Override
	public void insertCheckWish(WishVO wish) throws Exception {
		dao.insertCheckWish(wish);
	}

	@Override
	public void insertCart(int user_num, int prod_num, int prod_amount) throws Exception {
		dao.insertCart(user_num, prod_num, prod_amount);
	}

}
