package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE = "com.unomas.mapper.ProductMapper";
	private static final Logger log = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".setProduct", vo);
	}

	@Override
	public List<ProductVO> getProductList() throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getList");
	}

	@Override
	public List<ProductVO> getProductList(ProdCriteria pc) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getListCate", pc);
	}

	@Override
	public List<ProductVO> getProductPage(ProdCriteria pc) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getListOnPage", pc);
	}

	@Override
	public Integer getProductCnt(ProdCriteria pc) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getProdCnt", pc);
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
	public List<ProductVO> getDcateList(ProdCriteria pc) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getDcateProducts", pc);
	}

	@Override
	public Integer getDcateCnt(int prod_category) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getDcateCnt", prod_category);
	}

	@Override
	public ProductVO getProduct(int prod_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getProduct", prod_num);
	}

	@Override
	public void insertCart(int user_num, int prod_num, int prod_amount) throws Exception {
		Map<String, Object> cart = new HashMap<String, Object>();
		cart.put("user_num", user_num);
		cart.put("prod_num", prod_num);
		cart.put("prod_amount", prod_amount);
		
		sqlSession.insert(NAMESPACE + ".insertCart", cart);
	}

	@Override
	public List<ProductVO> getNewProductList(ProdCriteria pc) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getNewProducts", pc);
	}

	@Override
	public int getNewProdCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getNewProdCnt");
	}

	@Override
	public List<ProductVO> getSaleProductList(ProdCriteria pc) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getSaleProducts", pc);
	}

	@Override
	public int getSaleCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getSaleProdCnt");
	}

	@Override
	public void insertReview(BoardReviewVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertReview", vo);
	}

	@Override
	public List<BoardReviewVO> getReviewList(int prod_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getReviewList", prod_num);
	}

	@Override
	public int getReviewCnt(int prod_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getReviewCnt", prod_num);
	}

	@Override
	public String getUserid(int user_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getUserid", user_num);
	}

	@Override
	public void updateReviewReadcnt(int review_num) throws Exception {
		sqlSession.update(NAMESPACE + ".updateReviewReadcnt", review_num);
	}

	@Override
	public int getReviewReadCnt(int review_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getReviewReadCnt", review_num);
	}
}
