package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.UserVO;

public interface AdminDAO {
	
	// 관리자 로그인
	public AdminVO adminLogin(AdminVO vo);
	
	// 관리자 목록
	public List<AdminVO> adminList(Criter cri);
	
	// 관리자 수
	public Integer adminTotal();
	
	// 유저 목록
	public List<UserVO> userList(Criter cri);
	
	// 유저 수
	public Integer userTotal();
	
	// 공지사항 글 목록
	public List<NoticeVO> noticeList(Criter cri);
	
	// 공지사항 글 갯수
	public Integer noticeTotal();
	
	// 공지사항 글쓰기
	public void noticeInsert(NoticeVO vo);
	
	// 자주하는 질문 글 목록
	
	// 자주하는 질문 글 갯수
	
	// 1:1 글 목록
	
	// 1:1 글 갯수
	
	
}
