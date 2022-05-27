package com.april.unomas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.april.unomas.domain.OrderVO;
import com.april.unomas.domain.PayVO;
import com.april.unomas.persistence.OrderDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
				"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"}
		)
public class OrderDAOTest {
	
	private static final Logger log = LoggerFactory.getLogger(OrderDAOTest.class);
	
	@Inject
	private OrderDAO dao;
	
//	@Test
	public void 객체생성테스트() throws Exception {
		log.info("OrderDAO: "+dao.toString());
	}
	
//	@Test
	public void 마지막주문번호가져오기() throws Exception {
		log.info("@@@@@@@@@@@@@@@@ last num: "+dao.getLastOrderNum());
	}
	
//	@Test
//	@Transactional(rollbackFor = Exception.class)
	public void 주문정보생성테스트() throws Exception {
		OrderVO vo = new OrderVO();
		vo.setOrder_code(1);
		vo.setOrder_detailaddr("10번길");
		vo.setOrder_postalcode("12345");
		vo.setOrder_quantity(3);
		vo.setOrder_roadaddr("금천구로");
		vo.setOrder_total(3000);
		vo.setProd_num(20);
		vo.setUser_num(1);
		
		dao.createOrder(vo);
	}
	
//	@Test
	public void 결제정보생성테스트() throws Exception {
		PayVO vo = new PayVO();
		vo.setOrder_code(6);
		vo.setPay_card_company("KB Pay (국민)");
		vo.setPay_card_num("11112222****4444");
		vo.setPay_installment(0);
		vo.setPay_method("카드결제");
		vo.setPay_total_price(50000);
		vo.setUser_num(1);
		vo.setPay_point(5);
		vo.setPay_shippingfee(2500);
		
		dao.createPay(vo);
	}
	
	@Test
	public void 주문정보가져오기() throws Exception {
		log.info("@@@@@@@@@ order infos: "+dao.getOrderInfos(1));
		log.info("@@@@@@@@ last pay: "+dao.getLastPay());
	}
}
