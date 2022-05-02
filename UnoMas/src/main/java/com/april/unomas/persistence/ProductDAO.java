package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.ProductVO;

public interface ProductDAO {

	// 상품 목록 불러오기
	public List<ProductVO> getProductList();
}
