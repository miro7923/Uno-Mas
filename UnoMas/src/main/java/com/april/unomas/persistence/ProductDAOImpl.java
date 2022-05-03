package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<ProductVO> getProductList(int cateStart, int cateEnd) throws Exception{
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		
		paramMap.put("cateStart", cateStart);
		paramMap.put("cateEnd", cateEnd);
		
		return sqlSession.selectList(NAMESPACE + ".getListCate", paramMap);
	}

	@Override
	public List<ProductVO> getProductList(int cateStart, int cateEnd, int startRow, int pageSize) throws Exception {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		
		paramMap.put("cateStart", cateStart);
		paramMap.put("cateEnd", cateEnd);
		paramMap.put("startRow", startRow-1);
		paramMap.put("pageSize", pageSize);
		
		return sqlSession.selectList(NAMESPACE + ".getListOnPage", paramMap);
	}

	@Override
	public Integer getProductCnt(int cateStart, int cateEnd) throws Exception {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		
		paramMap.put("cateStart", cateStart);
		paramMap.put("cateEnd", cateEnd);
		
		return sqlSession.selectOne(NAMESPACE + ".getProdCnt", paramMap);
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
