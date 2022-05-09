package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProductVO;

public interface ProductDAO {


	// 상품 등록
	public void insertProduct(ProductVO vo) throws Exception;

	// 상품 목록 상위 카테고리별로 불러오기
	public List<ProductVO> getProductList(ProdCriteria pc) throws Exception;
	
	// 상위 카테고리별 한 페이지에 표시할 만큼만 상품 목록 불러오기
	public List<ProductVO> getProductPage(ProdCriteria pc) throws Exception;
	
	// 전체 상품 목록 가져오기
	public List<ProductVO> getAllProductList(ProdCriteria pc) throws Exception;
	
	// 전체 상품 개수 가져오기
	public Integer getAllCnt() throws Exception;
	
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
	
	// 장바구니에 상품 넣는 메서드
	public void insertCart(int user_num, int prod_num, int prod_amount) throws Exception;
	
	// 신상품 목록 가져오는 메서드
	public List<ProductVO> getNewProductList(ProdCriteria pc) throws Exception;
	
	// 신상품 개수 가져오는 메서드
	public int getNewProdCnt() throws Exception;
}
