package com.april.unomas.service;

import java.util.List;

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
	public List<BoardVO> selectBoardList(Criter cri) throws Exception;
	
	// 전체 글갯수 Criter
	public Integer countBoardTotal(Criter cri) throws Exception;
	
	// 전체 글갯수
	public Integer countBoardTotal() throws Exception;
	
	// 질문 조회
	public BoardVO getBoard(Integer faq_num) throws Exception;
	
	// 질문 업데이트
	public void updateBoard(BoardVO vo) throws Exception;
	
	// 질문 삭제
	public void deleteBoard(Integer faq_num) throws Exception;
	
	// 전체 정렬 글 갯수
	public Integer sortCateCount(String faq_cate) throws Exception;
}
