package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;

public interface NoticeService {
	
	// 글쓰기(boardWrite)
	public void noticeWrite(NoticeVO vo) throws Exception;
	
	// 글쓰기(첨부파일)
	public void noticeInsert(NoticeVO vo) throws Exception;
			
	// 글전체 목록(listAll)	
	public List<NoticeVO> listAll() throws Exception;
	
	// 글 조회
	public NoticeVO getNotice(Integer notice_num) throws Exception;
	
	// 조회수1증가
	public void rCountUp(Integer notice_num) throws Exception;
	
	// 전체 글 개수
	public Integer noticeCnt(Criter cri) throws Exception;
	
	// 페이징
	public List<NoticeVO> pagingNotices(Criter cri) throws Exception;
	
	// 글 수정
	public void updateNotice(NoticeVO vo) throws Exception;
	
	// 글 삭제
	public void deleteNotice(Integer notice_num) throws Exception;
	
}
