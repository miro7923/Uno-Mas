package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.domain.ProductVO;

public interface ProductDAO {


	// 상품 등록
	public void insertProduct(ProductVO vo) throws Exception;
	
	// 상품 목록 상위 카테고리별로 불러오기
	public List<ProductVO> getProductList(ProdCriteria pc) throws Exception;
	
	// 상위 카테고리별 한 페이지에 표시할 만큼만 상품 목록 불러오기
	public List<ProductVO> getProductPage(ProdCriteria pc) throws Exception;
	
	// 대분류별 소분류 번호 리스트 가져오기
	public List<Integer> getTopcateCnt(int topcate_num) throws Exception;
	
	// 대분류별 상품 개수 가져오기
	public Integer getProductCnt(ProdCriteria pc) throws Exception;
	
	// 상품 상위 카테고리 이름 가져오기
	public String getTopCateName(int topcate_num) throws Exception;
	
	// 상위 카테고리의 하위 카테고리 목록 가져오기
	public List<String> getDcateNames(int topcate_num) throws Exception;
	
	// 소분류별로 분류해서 가져오기
	public List<ProductVO> getDcateList(ProdCriteria pc) throws Exception;
	
	// 소분류별 상품 개수
	public Integer getDcateCnt(int prod_category) throws Exception;
	
	// 상품 하나의 정보를 가져오는 메서드
	public ProductVO getProduct(int prod_num) throws Exception;
	
	// 상품 조회수 증가
	public void updateProdReadcnt(int prod_num) throws Exception;
	
	// 장바구니에 상품 넣는 메서드
	public void insertCart(int user_num, int prod_num, int prod_amount) throws Exception;
	
	// 신상품 목록 가져오는 메서드
	public List<ProductVO> getNewProductList(ProdCriteria pc) throws Exception;
	
	// 신상품 개수 가져오는 메서드
	public int getNewProdCnt() throws Exception;
	
	// 특가 목록 가져오는 메서드
	public List<ProductVO> getSaleProductList(ProdCriteria pc) throws Exception;
	
	// 특가 상품 개수 가져오는 메서드
	public int getSaleCnt() throws Exception;
	
	// 리뷰글 작성하는 메서드
	public void insertReview(BoardReviewVO vo) throws Exception;
	
	// 리뷰글 목록 가져오는 메서드
	public List<BoardReviewVO> getReviewList(ProdCriteria pc) throws Exception;
	
	// 상품별 리뷰글 개수 가져오는 메서드
	public int getReviewCnt(int prod_num) throws Exception;
	
	// 회원 번호로 회원 아이디 가져오는 메서드
	public String getUserid(int user_num) throws Exception;
	
	// 리뷰글 조회수 증가
	public void updateReviewReadcnt(int review_num) throws Exception;
	
	// 특정 리뷰글 정보 가져오기
	public BoardReviewVO getReview(int review_num) throws Exception;
	
	// 리뷰글 좋아요 증가
	public void updateReviewLikeCnt(int review_num) throws Exception;
	
	// 리뷰글 좋아요 취소
	public void cancelLike(int revuew_num) throws Exception;
	
	// 상품별 문의글 목록 가져오기
	public List<ProdInquiryVO> getInquiryList(ProdCriteria pc) throws Exception;
	
	// 상품별 문의글 전체 개수 가져오기
	public int getInquiryCnt(int prod_num) throws Exception;
	
	// 상품 문의글 등록
	public void insertInquiry(ProdInquiryVO vo) throws Exception;
	
	// 해당 상품이 해당 유저의 위시리스트에 있는지 조회
	public boolean isInWishlist(int user_num, int prod_num) throws Exception;
	
	// 위시리스트 등록
	public void insertWishlist(int user_num, int prod_num) throws Exception;
	
	// 위시리스트 제거
	public void deleteWishlist(int user_num, int prod_num) throws Exception;
}
