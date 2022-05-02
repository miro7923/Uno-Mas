package com.april.unomas.persistence;

import java.util.List;
import java.util.Map;

import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;

public interface BoardDAO {
	
	// 글쓰기
	public void boardWrite(BoardVO vo);
	
	// 글 목록 가져오기
	public List<BoardVO> listAll();
	
	// 카테고리 정렬
	public List<BoardVO> sortCate(String faq_cate);
	
	// 페이징
	public List<Map<String,Object>> selectBoardList(Criter cri);
	
	// 전체 글 갯수
	public Integer countBoardList();
	
	
}
