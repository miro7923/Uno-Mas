package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;

public interface BoardDAO {
	
	// 글쓰기
	public void boardWrite(BoardVO vo);
	
	// 글 목록 가져오기
	public List<BoardVO> listAll();
	
	
	
	// 페이징
	public List<BoardVO> selectBoardList(Criter cri);
	
	// 전체 글 갯수
	public Integer countBoardList();
	// 전체 글 갯수cri
	public Integer countBoardList(Criter cri);
	
	// 글 조회
	public BoardVO getBoard(Integer faq_num) throws Exception;
	
	// 질문 업데이트
	public void updateBoard(BoardVO vo);
	
	// 질문 삭제
	public void deleteBoard(Integer faq_num);
	
	// 전체 정렬글 갯수
	public Integer sortCateCount(String faq_cate);
	
	// 카테고리 정렬
	public List<BoardVO> sortCate(String faq_cate, Criter cri);
	
	
}
