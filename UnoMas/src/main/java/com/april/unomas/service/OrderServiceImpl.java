package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.persistence.OrderDAO;

public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderDAO dao;
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Override
	public List<OrderAddrVO> getOrderAddrList(int user_num) throws Exception {
		return dao.getOrderAddrList(user_num);
	}
}
