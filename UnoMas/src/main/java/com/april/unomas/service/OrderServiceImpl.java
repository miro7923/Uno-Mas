package com.april.unomas.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;
import com.april.unomas.domain.PayVO;
import com.april.unomas.domain.PointVO;
import com.april.unomas.domain.UserCriteria;
import com.april.unomas.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderDAO dao;
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Override
	public List<OrderAddrVO> getOrderAddrList(int user_num, int pageStart, int perPageNum) throws Exception {
		return dao.getOrderAddrList(user_num, pageStart, perPageNum);
	}

	@Override
	public int getOrderAddrCnt(int user_num) throws Exception {
		return dao.getOrderAddrCnt(user_num);
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
	public List<OrderVO> getOrderInfos(int order_code) throws Exception {
		return dao.getOrderInfos(order_code);
	}

	@Override
	public PayVO getPay(int pay_num) throws Exception {
		return dao.getPay(pay_num);
	}

	@Override
	public PayVO getLastPay() throws Exception {
		return dao.getLastPay();
	}

	@Override
	public void createPointInfo(PointVO vo) throws Exception {
		dao.createPointInfo(vo);
	}
	
	@Override
	public List<Integer> MyOrderCount(String num) throws Exception {
		return dao.myOrderCount(num);
	}

	@Override
	public Map<Integer, List> getMyOrderList(String num, List limitList) throws Exception {
		return dao.getMyOrderList(num, limitList);
	}

	@Override
	public PayVO getPayInfo(int order_code) throws Exception {
		return dao.getPayInfo(order_code);
	}
	
	
}