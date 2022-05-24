package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;
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
}
