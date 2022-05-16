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
import com.april.unomas.domain.ProdInquiryVO;
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
	public List<ProductVO> getProductList(ProdCriteria pc) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getListCate", pc);
	}

	@Override
	public List<ProductVO> getProductPage(ProdCriteria pc) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getListOnPage", pc);
	}

	@Override
	public List<Integer> getTopcateCnt(int topcate_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getTopcateCnt", topcate_num);
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
	public void updateProdReadcnt(int prod_num) throws Exception {
		sqlSession.update(NAMESPACE + ".addProdReadcnt", prod_num);
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
	public List<BoardReviewVO> getReviewList(ProdCriteria pc) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getReviewList", pc);
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
	public void cancelLike(int revuew_num) throws Exception {
		sqlSession.update(NAMESPACE + ".cancelLike", revuew_num);
	}

	@Override
	public BoardReviewVO getReview(int review_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getReviewReadCnt", review_num);
	}

	@Override
	public void updateReview(BoardReviewVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateReview", vo);
	}

	@Override
	public void deleteReview(int review_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteReview", review_num);
	}

	@Override
	public List<ProdInquiryVO> getInquiryList(ProdCriteria pc) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getInquiryList", pc);
	}

	@Override
	public int getInquiryCnt(int prod_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getInquiryCnt", prod_num);
	}

	@Override
	public void insertInquiry(ProdInquiryVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertInquiry", vo);
	}

	@Override
	public ProdInquiryVO getInquiry(int inquiry_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getInquiry", inquiry_num);
	}

	@Override
	public void updateInquiry(ProdInquiryVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateInquiry", vo);
	}

	@Override
	public void updateReviewLikeCnt(int review_num) throws Exception {
		sqlSession.update(NAMESPACE + ".updateLikecnt", review_num);
	}

	@Override
	public boolean isInWishlist(int user_num, int prod_num) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_num", user_num);
		map.put("prod_num", prod_num);
		
		if (sqlSession.selectOne(NAMESPACE + ".isInWishlist", map) == null) 
			return false;
		
		return true;
	}

	@Override
	public void insertWishlist(int user_num, int prod_num) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_num", user_num);
		map.put("prod_num", prod_num);
		
		sqlSession.insert(NAMESPACE + ".insertWishlist", map);
	}

	@Override
	public void deleteWishlist(int user_num, int prod_num) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_num", user_num);
		map.put("prod_num", prod_num);
		
		sqlSession.delete(NAMESPACE + ".deleteWishlist", map);
	}
}
