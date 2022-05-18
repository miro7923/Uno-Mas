package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.april.unomas.domain.CartVO;
import com.april.unomas.persistence.CartDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class CartDAOTest {

	@Inject
	private CartDAO dao;
	
	/* 카트 수량 수정 */

	@Test
	public void 장바구니수정테스트() {
		
		int prod_num = 100;
		int user_num = 2;
		int prod_amount = 5;
		
		CartVO cart = new CartVO();
		cart.setProd_num(prod_num);
		cart.setUser_num(user_num);
		cart.setProd_amount(prod_amount);
		
		dao.updateCart(cart);
		
	}
	
}
