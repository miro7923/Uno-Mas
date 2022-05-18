package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.WishVO;

public interface WishService {

	// 찜 목록
	public List<WishVO> list(int user_num) throws Exception;
	
	// 찜 추가
	public void insertWish(WishVO vo) throws Exception;
	
	// 찜 X삭제 버튼
	public void deleteWish(int prod_num) throws Exception;
	
	// 찜 선택 삭제
	public void deleteCheckWish(WishVO wish) throws Exception;

	// 찜 선택 담기
	public void insertCheckWish(WishVO wish) throws Exception;
	
	// 찜 전체 삭제
	public void deleteAllWish(int user_num) throws Exception;
}
