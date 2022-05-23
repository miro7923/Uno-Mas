package com.april.unomas.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.april.unomas.domain.OrderAddrVO;

public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final Logger log = LoggerFactory.getLogger(OrderDAOImpl.class);
	private static String NAMESPACE = "com.unomas.mapper.OrderMapper";
	
	@Override
	public List<OrderAddrVO> getOrderAddrList(int user_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getOrderAddrList", user_num);
	}
}
