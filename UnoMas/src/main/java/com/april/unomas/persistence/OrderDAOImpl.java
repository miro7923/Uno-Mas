package com.april.unomas.persistence;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;
import com.april.unomas.domain.PayVO;

import com.april.unomas.domain.UserCriteria;

import com.april.unomas.domain.PointVO;
import com.april.unomas.domain.ProdCriteria;


@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final Logger log = LoggerFactory.getLogger(OrderDAOImpl.class);
	private static String NAMESPACE = "com.unomas.mapper.OrderMapper";
	
	
	@Override
	public List<OrderAddrVO> getOrderAddrList(int user_num, int pageStart, int perPageNum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_num", user_num);
		map.put("pageStart", pageStart);
		map.put("perPageNum", perPageNum);
		
		return sqlSession.selectList(NAMESPACE + ".getOrderAddrList", map);
	}

	@Override
	public int getOrderAddrCnt(int user_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getOrderAddrCnt", user_num);
	}

	@Override
	public int getLastOrderNum() throws Exception {
		Object result = sqlSession.selectOne(NAMESPACE + ".getLastOrderNum");
		
		// 주문 테이블이 비어 있어서 null이 리턴되면 1, 그 외엔 정수형 데이터 리턴
		// 새로 생길 주문의 주문번호가 될 값이라서 최대값+1 리턴
		return (result == null) ? 1 : (Integer)result + 1;
	}

	@Override
	public void createOrder(OrderVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".createOrder", vo);
	}

	@Override
	public void createPay(PayVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".createPay", vo);
	}

	@Override
	public List<OrderVO> getOrderInfos(int order_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getOrderInfos", order_code);
	}

	@Override
	public PayVO getPay(int pay_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getPay", pay_num);
	}

	@Override
	public PayVO getLastPay() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getLastPay");
	}
	
	@Override
	public void createPointInfo(PointVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".createNewPoint", vo);
	}


	// 주문개수
	@Override
	public List<Integer> myOrderCount(String num) throws Exception {		
		return sqlSession.selectList(NAMESPACE + ".orderCount", num);
	}

	// 주문 목록
	@Override
	public Map<Integer, List> getMyOrderList(String num, List<Integer> limitList) throws Exception {	
		Map<Integer, List> orderMap = new HashMap<Integer, List>();
		for(int code: limitList) {
			List<OrderVO> orderList = sqlSession.selectList(NAMESPACE + ".myOrderList", code);
			orderMap.put(code, orderList);
		}

		return orderMap;
	}
	
	

}
