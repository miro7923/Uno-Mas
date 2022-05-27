package com.april.unomas.service;

import java.util.List;
import java.util.Map;

import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;
import com.april.unomas.domain.PayVO;
import com.april.unomas.domain.PointVO;
import com.april.unomas.domain.UserCriteria;

public interface OrderService {

	// 회원의 배송지 목록 가져오기
	public List<OrderAddrVO> getOrderAddrList(int user_num, int pageStart, int perPageNum) throws Exception;
	
	// 회원의 배송지 개수 가져오기
	public int getOrderAddrCnt(int user_num) throws Exception;
	
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
	
	// 포인트 테이블에 저장하기
	public void createPointInfo(PointVO vo) throws Exception;
	
	// 총 주문 개수
	public List<Integer> MyOrderCount(String num) throws Exception;

	// 내 주문 목록
	public Map<Integer, List> getMyOrderList(String num, UserCriteria cri) throws Exception;

	
}