package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.WishVO;

public interface WishDAO {

	// 찜 목록
	public List<WishVO> list() throws Exception;
	
	// 찜 추가
	public void insertWish(WishVO vo) throws Exception;
		
	// 찜 개별 삭제
	public void delete(int prod_num) throws Exception;
}
