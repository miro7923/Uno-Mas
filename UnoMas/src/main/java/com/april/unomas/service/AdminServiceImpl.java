package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.UserVO;
import com.april.unomas.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log 
	= LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	private AdminDAO dao;
	
	@Override
	public List<AdminVO> adminView(Criter cri) {
		// 관리자 목록보기
		return dao.adminList(cri);
	}
	
	@Override
	public Integer adminCount() {
		// 관리자 수
		return dao.adminTotal();
	}

	@Override
	public List<UserVO> userView(Criter cri) {
		// 유저 목록보기
		return dao.userList(cri);
	}

	@Override
	public Integer userCount() {
		// 유저 수
		return dao.userTotal();
	}

	@Override
	public List<NoticeVO> noticeView(Criter cri) {
		// 공지사항 글 목록
		return dao.noticeList(cri);
	}

	@Override
	public Integer noticeCount() {
		// 공지사항 글 갯수
		return dao.noticeTotal();
	}

	@Override
	public void noticeWrite(NoticeVO vo) {
		// 공지사항 글쓰기
		dao.noticeInsert(vo);
	}

	@Override
	public AdminVO adminLogin(AdminVO vo) {
		// 관리자 로그인
		return dao.adminLogin(vo);
	}
	
	
	
}
