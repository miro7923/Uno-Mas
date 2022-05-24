package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;

public interface OrderService {

	// 회원의 배송지 목록 가져오기
	public List<OrderAddrVO> getOrderAddrList(int user_num) throws Exception;
	
	// 가장 마지막 주문번호 가져오기
	public int getLastOrderNum() throws Exception;
	
	// 결제정보 생성
	public void createOrder(OrderVO vo) throws Exception;
}
