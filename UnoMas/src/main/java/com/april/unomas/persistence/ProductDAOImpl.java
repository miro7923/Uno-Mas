package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.ProdPaging;
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
	public List<ProductVO> getProductList(ProdPaging pp) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getListCate", pp);
	}

	@Override
	public List<ProductVO> getProductPage(ProdPaging pp) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getListOnPage", pp);
	}

	@Override
	public Integer getProductCnt(ProdPaging pp) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getProdCnt", pp);
	}

	@Override
	public String getTopCateName(int topcate_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getTopCateName", topcate_num);
	}

	@Override
	public List<String> getDcateNames(int topcate_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getDcateNames", topcate_num);
	}

	@Override
	public List<ProductVO> getDcateList(ProdPaging pp) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getDcateProducts", pp);
	}

	@Override
	public Integer getDcateCnt(int prod_category) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getDcateCnt", prod_category);
	}
}
