package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static final Logger log = LoggerFactory.getLogger(CartDAOTest.class);
	
	/* 카트 수량 수정 */

//	@Test
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
	
	@Test
	public void 한회원의장바구니목록() {
		log.info("@@@@@@@@@@@@@@@ "+ dao.listCart(1));
	}
	
//	@Test
	public void 선택된상품가져오기테스트() {
		int prod_num = 109;
		int user_num = 4;
		
		log.info("@@@@@@@@@ 선택된 상품: "+ dao.getSelectedItem(user_num, prod_num));
	}
}
