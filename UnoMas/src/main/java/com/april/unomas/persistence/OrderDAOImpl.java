package com.april.unomas.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;

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
		sqlSession.insert(NAMESPACE + ".createOrder", vo);
	}
}
