package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;
import com.april.unomas.domain.PayVO;
import com.april.unomas.domain.UserCriteria;
import com.april.unomas.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderDAO dao;
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Override
	public List<OrderAddrVO> getOrderAddrList(int user_num) throws Exception {
		return dao.getOrderAddrList(user_num);
	}

	@Override
	public int getLastOrderNum() throws Exception {
		return dao.getLastOrderNum();
	}

	@Override
	public void createOrder(OrderVO vo) throws Exception {
		dao.createOrder(vo);
	}

	@Override
	public void createPay(PayVO vo) throws Exception {
		dao.createPay(vo);
	}

	@Override
	public List<Integer> MyOrderCount(String num) throws Exception{
		return dao.myOrderCount(num);
	}

	@Override
	public List<OrderVO> getMyOrderList(String num, UserCriteria cri) throws Exception {
		return dao.getMyOrderList(num, cri);
	}
	
	
	
	
}
