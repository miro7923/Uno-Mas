package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProductVO;
import com.april.unomas.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{

	@Inject
	private ProductDAO dao;
	private static final Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		dao.insertProduct(vo);
	}

	@Override
	public List<ProductVO> getProductList() throws Exception {
		return dao.getProductList();
	}

	@Override
	public List<ProductVO> getProductList(ProdCriteria pc) throws Exception {
		return dao.getProductList(pc);
	}

	@Override
	public List<ProductVO> getProductPage(ProdCriteria pc) throws Exception {
		return dao.getProductPage(pc);
	}

	@Override
	public Integer getProductCnt(ProdCriteria pc) throws Exception {
		return dao.getProductCnt(pc);
	}

	@Override
	public String getTopCateName(int topcate_num) throws Exception {
		return dao.getTopCateName(topcate_num);
	}

	@Override
	public List<String> getDcateNames(int topcate_num) throws Exception {
		return dao.getDcateNames(topcate_num);
	}

	@Override
	public List<ProductVO> getDcateList(ProdCriteria pc) throws Exception {
		return dao.getDcateList(pc);
	}

	@Override
	public Integer getDcateCnt(int prod_category) throws Exception {
		return dao.getDcateCnt(prod_category);
	}

	@Override
	public ProductVO getProduct(int prod_num) throws Exception {
		return dao.getProduct(prod_num);
	}

	@Override
	public void insertCart(int user_num, int prod_num, int prod_amount) throws Exception {
		dao.insertCart(user_num, prod_num, prod_amount);
	}

	@Override
	public List<ProductVO> getNewProductList(ProdCriteria pc) throws Exception {
		return dao.getNewProductList(pc);
	}

	@Override
	public int getNewProdCnt() throws Exception {
		return dao.getNewProdCnt();
	}

	@Override
	public List<ProductVO> getSaleProductList(ProdCriteria pc) throws Exception {
		return dao.getSaleProductList(pc);
	}

	@Override
	public int getSaleCnt() throws Exception {
		return dao.getSaleCnt();
	}

	@Override
	public void insertReview(BoardReviewVO vo) throws Exception {
		dao.insertReview(vo);
	}

	@Override
	public List<BoardReviewVO> getReviewList(int prod_num) throws Exception {
		return dao.getReviewList(prod_num);
	}

	@Override
	public int getReviewCnt(int prod_num) throws Exception {
		return dao.getReviewCnt(prod_num);
	}

	@Override
	public String getUserid(int user_num) throws Exception {
		return dao.getUserid(user_num);
	}

	@Override
	public void updateReviewReadcnt(int review_num) throws Exception {
		dao.updateReviewReadcnt(review_num);
	}

	@Override
	public int getReviewReadCnt(int review_num) throws Exception {
		return dao.getReviewReadCnt(review_num);
	}
}
