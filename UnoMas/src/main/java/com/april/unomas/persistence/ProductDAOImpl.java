package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import com.april.unomas.domain.CategoryVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.CartVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.domain.ProductVO;
import com.april.unomas.domain.SelectVO;

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
	public void updateProduct(ProductVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".updateProduct", vo);
	}
	
	@Override
	public void deleteProduct(ProductVO vo) throws Exception {
		sqlSession.delete(NAMESPACE+".deleteProduct", vo);
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
	public List<ProductVO> getAllProductList(int pageStart, int perPageNum, String searchType, String keyword) throws Exception {
	
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("pageStart", pageStart);
		data.put("perPageNum", perPageNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sqlSession.selectList(NAMESPACE+".getAllProductList", data);
	}

	@Override
	public Integer getAllCnt(String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
			
		
		return sqlSession.selectOne(NAMESPACE+".getAllCnt", data);
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
	public List<CategoryVO> getTopCategory() throws Exception {
		return sqlSession.selectList(NAMESPACE+".getTopCategory");
	}

	@Override
	public String getTopCateName(int topcate_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getTopCateName", topcate_num);
	}

	@Override
	public List<CategoryVO> getDCategory() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getDCategory");
	}

	@Override
	public List<String> getDcateNames(int topcate_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getDcateNames", topcate_num);
	}
	
	@Override
	public List<CategoryVO> getCategory(int dcate_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getCategory", dcate_num);
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
	public ProductVO getProdImgs(int prod_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getProdImgs", prod_num);
	}

	@Override
	public int getLastProdNum() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getLastProdNum");
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
	public CartVO getProdInCart(int user_num, int prod_num) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_num", user_num);
		map.put("prod_num", prod_num);
		
		return sqlSession.selectOne(NAMESPACE + ".getProdInCart", map);
	}

	@Override
	public void updateCartAmount(int user_num, int prod_num, int prod_amount) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_num", user_num);
		map.put("prod_num", prod_num);
		map.put("prod_amount", prod_amount);
		
		sqlSession.update(NAMESPACE + ".updateCartAmount", map);
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
	public int getLastReviewNum() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getLastReviewNum");
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
	public String getReviewImg(int review_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getReviewImg", review_num);
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
	public void deleteInquiry(int inquiry_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteInquiry", inquiry_num);
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

	public List<SelectVO> readcntSelect() throws Exception {
		return sqlSession.selectList("com.april.unomas.mappers.indexMapper" + ".readcntSelect");
	}

	@Override
	public List<SelectVO> sellcntSelect() throws Exception {
		return sqlSession.selectList("com.april.unomas.mappers.indexMapper" + ".sellcntSelect");
	}
	
	@Override
	public List<SelectVO> brandnewSelect() throws Exception {
		return sqlSession.selectList("com.april.unomas.mappers.indexMapper" + ".brandnewSelect");
	}
	@Override
	public List<SelectVO> readcntSelect2() throws Exception {
		return sqlSession.selectList("com.april.unomas.mappers.indexMapper" + ".readcntSelect2");
	}
	
	@Override
	public List<SelectVO> sellcntSelect2() throws Exception {
		return sqlSession.selectList("com.april.unomas.mappers.indexMapper" + ".sellcntSelect2");
	}
	
	@Override
	public List<SelectVO> brandnewSelect2() throws Exception {
		return sqlSession.selectList("com.april.unomas.mappers.indexMapper" + ".brandnewSelect2");
	}

	@Override
	public List<ProductVO> searchProd(Criter pc) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchProd",pc);
	}

	@Override
	public int getSearchProdCnt(Criter pc) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".searchCnt",pc);
	}

	
	@Override
	public List<SelectVO> mayEvent() throws Exception {
		return sqlSession.selectList("com.april.unomas.mappers.eventMapper" + ".may");
	}

}
