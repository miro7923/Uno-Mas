package com.april.unomas.service;

import java.util.List;
import java.util.Map;

import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;

public interface BoardService {
	
	// 글쓰기(boardWrite)
	public void boardWrite(BoardVO vo)throws Exception;
		
	// 글전체 목록(listAll)
	public List<BoardVO> listAll() throws Exception;
	
	// 카테고리 정렬
	public List<BoardVO> sortCate(String faq_cate) throws Exception;
	
	// 페이징
	public List<Map<String,Object>> selectBoardList(Criter cri);
	
	// 전체 글갯수
	public Integer countBoardTotal();
}
