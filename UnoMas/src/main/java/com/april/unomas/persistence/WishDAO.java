package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.WishVO;

public interface WishDAO {

	// 찜 목록
	public List<WishVO> list(int user_num) throws Exception;

	// 찜 X삭제 버튼
	public void deleteWish(int wish_num) throws Exception;
	
	// 찜 선택 삭제
	public void deleteCheckWish(WishVO wish) throws Exception;

	// 찜 선택 담기
	public void insertCheckWish(WishVO wish) throws Exception;
	
	// 찜 전체 삭제
	public void deleteAllWish(int user_num) throws Exception;
	
	// 장바구니 단품 담기
	public void insertCart(int user_num, int prod_num, int prod_amount) throws Exception;
}
