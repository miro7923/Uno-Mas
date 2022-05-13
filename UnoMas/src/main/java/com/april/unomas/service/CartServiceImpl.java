package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.april.unomas.domain.CartVO;
import com.april.unomas.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService{

	@Inject
	CartDAO cartDao;

	@Override
	public int insert(CartVO vo) {
		return cartDao.insert(vo);
		
	}

	@Override
	public List<CartVO> listCart(int user_num) {
		 return cartDao.listCart(user_num);
	}

	@Override
	public void delete(int cart_num) {
		cartDao.delete(cart_num);
		
	}

	@Override
	public void deleteAll(int user_num) {
		cartDao.deleteAll(user_num);
		
	}

	@Override
	public int sumMoney(int user_num) {
		return cartDao.sumMoney(user_num);
	}

	@Override
	public int countCart(int user_num, int prod_num) {
		return cartDao.countCart(user_num, prod_num);
	}

	@Override
	public int updateCart(CartVO vo) {
		return cartDao.updateCart(vo);
		
	}

	@Override
	public void modifyCart(CartVO vo) {
		cartDao.modifyCart(vo);
		
	}
	

}
