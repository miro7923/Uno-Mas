package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.ProductVO;
import com.april.unomas.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;
	
	private static final Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Override
	public List<ProductVO> getProductList() throws Exception {
		return dao.getProductList();
	}

	@Override
	public List<ProductVO> getProductList(int cateStart, int cateEnd) throws Exception {
		return dao.getProductList(cateStart, cateEnd);
	}

	@Override
	public List<ProductVO> getProductList(int cateStart, int cateEnd, int startRow, int pageSize) throws Exception {
		return dao.getProductList(cateStart, cateEnd, startRow, pageSize);
	}

	@Override
	public Integer getProductCnt(int cateStart, int cateEnd) throws Exception {
		return dao.getProductCnt(cateStart, cateEnd);
	}

	@Override
	public String getTopCateName(int topcate_num) throws Exception {
		return dao.getTopCateName(topcate_num);
	}

	@Override
	public List<String> getDcateNames(int topcate_num) throws Exception {
		return dao.getDcateNames(topcate_num);
	}
}
