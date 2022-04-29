package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.BoardVO;

public interface BoardService {
	
	// 글쓰기(boardWrite)
	public void boardWrite(BoardVO vo)throws Exception;
		
	// 글전체 목록(listAll)
	public List<BoardVO> listAll() throws Exception;
}
