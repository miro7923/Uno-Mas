package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.OrderAddrVO;

public interface OrderDAO {

	// 회원의 배송지 정보 가져오기
	public List<OrderAddrVO> getOrderAddrList(int user_num) throws Exception;
}
