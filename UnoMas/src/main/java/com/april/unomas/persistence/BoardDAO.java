package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.BoardVO;

public interface BoardDAO {
	
	// 글쓰기
	public void boardWrite(BoardVO vo);
	
	// 글 목록 가져오기
	public List<BoardVO> listAll();
}
