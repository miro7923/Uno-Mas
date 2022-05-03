package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.ProductVO;

public interface ProductService {

	// 상품 전체 목록 가져오는 메서드
	public List<ProductVO> getProductList() throws Exception;
	
	// 상위 카테고리별로 상품 목록 가져오는 메서드
	public List<ProductVO> getProductList(int prod_category) throws Exception;
	
	// 상위 카테고리별 한 페이지에 표시할 만큼만 상품 목록 불러오기
	public List<ProductVO> getProductList(int prod_category, int startRow, int pageSize) throws Exception;
	
	// 대분류별 상품 개수 가져오기
	public Integer getProductCnt(int prod_category) throws Exception;
	
	// 상위 카테고리 이름 가져오는 메서드
	public String getTopCateName(int topcate_num) throws Exception;

	// 상위 카테고리의 하위 카테고리 목록 가져오기
	public List<String> getDcateNames(int topcate_num) throws Exception;
}
