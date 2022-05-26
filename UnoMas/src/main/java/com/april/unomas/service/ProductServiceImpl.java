package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.CategoryVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.CartVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.domain.ProductVO;
import com.april.unomas.domain.SelectVO;
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
	public void updateProduct(ProductVO vo) throws Exception {
		dao.updateProduct(vo);
	}
	
	@Override
	public void deleteProduct(ProductVO vo) throws Exception {
		dao.deleteProduct(vo);
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
	public List<ProductVO> getAllProductList(ProdCriteria pc) throws Exception {
		return dao.getAllProductList(pc);
	}

	@Override
	public Integer getAllCnt() throws Exception {
		return dao.getAllCnt();
	}

	@Override
	public List<Integer> getTopcateCnt(int topcate_num) throws Exception {
		return dao.getTopcateCnt(topcate_num);
	}

	@Override
	public Integer getProductCnt(ProdCriteria pc) throws Exception {
		return dao.getProductCnt(pc);
	}
	
	@Override
	public List<CategoryVO> getTopCategory() throws Exception {
		return dao.getTopCategory();
	}

	@Override
	public String getTopCateName(int topcate_num) throws Exception {
		return dao.getTopCateName(topcate_num);
	}
	
	@Override
	public List<CategoryVO> getDCategory() throws Exception {
		return dao.getDCategory();
	}

	@Override
	public List<String> getDcateNames(int topcate_num) throws Exception {
		return dao.getDcateNames(topcate_num);
	}
	
	@Override
	public List<CategoryVO> getCategory(int dcate_num) throws Exception {
		return dao.getCategory(dcate_num);
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
	public ProductVO getProdImgs(int prod_num) throws Exception {
		return dao.getProdImgs(prod_num);
	}

	@Override
	public int getLastProdNum() throws Exception {
		return dao.getLastProdNum();
	}

	@Override
	public void addProdReadcnt(int prod_num) throws Exception {
		dao.updateProdReadcnt(prod_num);
	}

	@Override
	public void insertCart(int user_num, int prod_num, int prod_amount) throws Exception {
		dao.insertCart(user_num, prod_num, prod_amount);
	}

	@Override
	public CartVO getProdInCart(int user_num, int prod_num) throws Exception {
		return dao.getProdInCart(user_num, prod_num);
	}

	@Override
	public void modifyCartAmount(int user_num, int prod_num, int prod_amount) throws Exception {
		dao.updateCartAmount(user_num, prod_num, prod_amount);
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
	public int getLastReviewNum() throws Exception {
		return dao.getLastReviewNum();
	}

	@Override
	public void insertReview(BoardReviewVO vo) throws Exception {
		dao.insertReview(vo);
	}

	@Override
	public List<BoardReviewVO> getReviewList(ProdCriteria pc) throws Exception {
		return dao.getReviewList(pc);
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
	public void cancelLike(int review_num) throws Exception {
		dao.cancelLike(review_num);
	}

	@Override
	public BoardReviewVO getReview(int review_num) throws Exception {
		return dao.getReview(review_num);
	}

	@Override
	public void modifyReview(BoardReviewVO vo) throws Exception {
		dao.updateReview(vo);
	}

	@Override
	public String getReviewImg(int review_num) throws Exception {
		return dao.getReviewImg(review_num);
	}

	@Override
	public void removeReview(int review_num) throws Exception {
		dao.deleteReview(review_num);
	}

	@Override
	public List<ProdInquiryVO> getInquiryList(ProdCriteria pc) throws Exception {
		return dao.getInquiryList(pc);
	}

	@Override
	public int getInquiryCnt(int prod_num) throws Exception {
		return dao.getInquiryCnt(prod_num);
	}

	@Override
	public void insertInquiry(ProdInquiryVO vo) throws Exception {
		dao.insertInquiry(vo);
	}

	@Override
	public ProdInquiryVO getInquiry(int inquiry_num) throws Exception {
		return dao.getInquiry(inquiry_num);
	}

	@Override
	public void modifyInquiry(ProdInquiryVO vo) throws Exception {
		dao.updateInquiry(vo);
	}

	@Override
	public void removeInquiry(int inquiry_num) throws Exception {
		dao.deleteInquiry(inquiry_num);
	}

	@Override
	public void addReviewLikeCnt(int review_num) throws Exception {
		dao.updateReviewLikeCnt(review_num);
	}

	@Override
	public boolean isInWishlist(int user_num, int prod_num) throws Exception {
		return dao.isInWishlist(user_num, prod_num);
	}

	@Override
	public void addWishlist(int user_num, int prod_num) throws Exception {
		dao.insertWishlist(user_num, prod_num);
	}

	@Override
	public void removeWishlist(int user_num, int prod_num) throws Exception {
		dao.deleteWishlist(user_num, prod_num);
	}

	public List<SelectVO> readcntSelect() throws Exception {
		List<SelectVO> readlist = dao.readcntSelect();
		return readlist;
	}
	@Override
	public List<SelectVO> sellcntSelect() throws Exception {
		List<SelectVO> soldlist = dao.sellcntSelect();
		return soldlist;
	}
	@Override
	public List<SelectVO> brandnewSelect() throws Exception {
		List<SelectVO> newlist = dao.brandnewSelect();
		return newlist;
	}
	@Override
	public List<SelectVO> readcntSelect2() throws Exception {
		List<SelectVO> readlist2 = dao.readcntSelect2();
		return readlist2;
	}
	@Override
	public List<SelectVO> sellcntSelect2() throws Exception {
		List<SelectVO> soldlist2 = dao.sellcntSelect2();
		return soldlist2;
	}
	@Override
	public List<SelectVO> brandnewSelect2() throws Exception {
		List<SelectVO> newlist2 = dao.brandnewSelect2();
		return newlist2;
	}

	@Override
	public List<ProductVO> searchProd(Criter pc) throws Exception {
		return dao.searchProd(pc);
	}

	@Override
	public int getSearchProdCnt(Criter pc) throws Exception {
		return dao.getSearchProdCnt(pc);
	}
	
}
