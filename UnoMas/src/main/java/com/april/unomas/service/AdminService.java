package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.UserVO;

public interface AdminService {

	// 관리자 로그인
	public AdminVO adminLogin(AdminVO vo);
	
	// 관리자 목록
	public List<AdminVO> adminView(Criter cri);
	
	// 관리자 수
	public Integer adminCount();
		
	// 유저 목록
	public List<UserVO> userView(Criter cri);
	
	// 유저 수
	public Integer userCount();
	
	// 공지사항 목록
	public List<NoticeVO> noticeView(Criter cri);
	
	// 공지사항 글 갯수
	public Integer noticeCount();
	
	// 공지사항 글쓰기
	public void noticeWrite(NoticeVO vo);
}
