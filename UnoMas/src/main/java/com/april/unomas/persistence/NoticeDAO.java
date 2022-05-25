package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;

public interface NoticeDAO {

	// 글쓰기
	public void noticeWrite(NoticeVO vo);
	
	// 글쓰기(첨부파일)
	public void noticeInsert(NoticeVO vo);
	
	// 글 조회
	public NoticeVO getNotice(Integer notice_num);
	
	// 조회수1증가
	public void rCountUp(Integer notice_num);
	
	// 전체 글 개수
	public Integer getNoticeCount(Criter cri);
	
	// 페이징
	public List<NoticeVO> pagingNotice(Criter cri);
	
	// 글 수정
	public void updateNotice(NoticeVO vo);
	
	// 글 삭제
	public void deleteNotice(Integer notice_num);
	
}
