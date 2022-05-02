package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.NoticeVO;

public interface NoticeService {
	
	// 글쓰기(boardWrite)
	public void noticeWrite(NoticeVO vo)throws Exception;
			
	// 글전체 목록(listAll)	
	public List<NoticeVO> listAll() throws Exception;
	
	// 글 조회
	public NoticeVO getNotice(Integer notice_num) throws Exception;
	
	// 조회수1증가
	public void rCountUp(Integer notice_num) throws Exception;
}
