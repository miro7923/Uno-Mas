package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.OrderAddrVO;

public interface OrderService {

	// 회원의 배송지 목록 가져오기
	public List<OrderAddrVO> getOrderAddrList(int user_num) throws Exception;
}
