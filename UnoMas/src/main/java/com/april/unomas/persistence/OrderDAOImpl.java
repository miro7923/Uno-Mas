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

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final Logger log = LoggerFactory.getLogger(OrderDAOImpl.class);
	private static String NAMESPACE = "com.unomas.mapper.OrderMapper";
	
	@Override
	public List<OrderAddrVO> getOrderAddrList(int user_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getOrderAddrList", user_num);
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
//		sqlSession.insert(NAMESPACE + ".createOrder", vo);
	}

	@Override
	public void createPay(PayVO vo) throws Exception {
//		sqlSession.insert(NAMESPACE + ".createPay", vo);
	}

	// 주문 개수 가져오기.
//	@Override
//	public List<Integer> myOrderCount(String num) throws Exception {
//		List<Integer> totalCode = sqlSession.selectList(NAMESPACE + ".orderCount", num);
//		
//		List<Integer> codeList = new ArrayList<Integer>();
//		int code = totalCode.get(0);
//		int count = 1;
//		for(int i=1; i<totalCode.size(); i++) {
//			if(totalCode.get(i) == code) {
//				count += 1;
//			} else {
//				codeList.add(count);
//				code = totalCode.get(i);	
//				count = 1;
//			}
//		}
//		return codeList;
//	}
	
	// 주문개수 - 테스트
	@Override
	public List<Integer> myOrderCount(String num) throws Exception {		
		return sqlSession.selectList(NAMESPACE + ".orderCount", num);
	}

	@Override
	public Map<Integer, List> getMyOrderList(String num, UserCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap();
		map.put("num", num);
		map.put("cri", cri);
		
		List<Integer> cList = new ArrayList<Integer>();
		cList.add(33);
		cList.add(34);
		
		Map<Integer, List> orderMap = new HashMap<Integer, List>();
		
		for(Integer code: cList) {
			List<OrderVO> orderList = sqlSession.selectList(NAMESPACE + ".myOrderList", code);
			System.out.println("가쟈온 주문정보: " + orderList);
			orderMap.put(code, orderList);
		}
		System.out.println("전체다 잘 가져와지나???" + orderMap);
		
		
		return orderMap;
	}
	
	
	
}
