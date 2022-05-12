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
	public List<WishVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public void deleteWish(int prod_num) throws Exception {
		dao.deleteWish(prod_num);
	}

	@Override
	public void insertWish(WishVO vo) throws Exception {
		dao.insertWish(vo);
	}

	@Override
	public void deleteAllWish(int user_num) throws Exception {
		dao.deleteAllWish(user_num);
	}

}
