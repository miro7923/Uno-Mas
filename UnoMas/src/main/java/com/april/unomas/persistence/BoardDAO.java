package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;

public interface BoardDAO {
	
	// 글쓰기
	public void boardWrite(BoardVO vo);
	
	// 페이징
	public List<BoardVO> selectBoardList(Criter cri);
	
	// 전체 글 갯수
	public Integer countBoardList();
	
	// 글 조회
	public BoardVO getBoard(Integer faq_num);
	
	// 질문 업데이트
	public void updateBoard(BoardVO vo);
	
	// 질문 삭제
	public void deleteBoard(Integer faq_num);
	
	// 전체 정렬글 갯수
	public Integer sortCateCount(Integer qnacate_num);
	
	// 카테고리 정렬
	public List<BoardVO> sortCate(Integer qnacate_num, Criter cri);
	
	// 검색 글 갯수
	public Integer countBoardList(Criter cri);
	
	
}
