package com.april.unomas.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE = "com.unomas.mapper.ProductMapper";
	private static final Logger log = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	@Override
	public List<ProductVO> getProductList() throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getList");
	}

	@Override
	public List<ProductVO> getProductList(int prod_category) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getListCate", prod_category);
	}

	@Override
	public String getTopCateName(int topcate_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getTopCateName", topcate_num);
	}

	@Override
	public List<String> getDcateNames(int topcate_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getDcateNames", topcate_num);
	}
}
