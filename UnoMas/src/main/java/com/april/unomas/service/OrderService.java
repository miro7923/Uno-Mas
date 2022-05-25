package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;
import com.april.unomas.domain.PayVO;

public interface OrderService {

	// 회원의 배송지 목록 가져오기
	public List<OrderAddrVO> getOrderAddrList(int user_num) throws Exception;
	
	// 가장 마지막 주문번호 가져오기
	public int getLastOrderNum() throws Exception;
	
	// 주문정보 생성
	public void createOrder(OrderVO vo) throws Exception;
	
	// 결제정보 생성
	public void createPay(PayVO vo) throws Exception;
	
	// 주문정보 가져오기
	public List<OrderVO> getOrderInfos(int order_code) throws Exception;
	
	// 결제정보 가져오기
	public PayVO getPay(int pay_num) throws Exception;
	
	// 직전에 생성된 결제정보 가져오기
	public PayVO getLastPay() throws Exception;
}
