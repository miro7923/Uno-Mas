package com.april.unomas.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.unomas.mapper.AdminMapper";
	
	@Override
	public List<AdminVO> adminList(Criter cri) {
		// 관리자 목록 보기
		return sqlSession.selectList(NAMESPACE+".adminList",cri);
	}

	@Override
	public Integer adminTotal() {
		// 관리자 수
		return sqlSession.selectOne(NAMESPACE+".adminTotal");
	}
	
	@Override
	public List<UserVO> userList(Criter cri) {
		// 유저 목록 보기
		return sqlSession.selectList(NAMESPACE+".userList",cri);
	}

	@Override
	public Integer userTotal() {
		// 유저 수
		return sqlSession.selectOne(NAMESPACE+".userTotal");
	}

	@Override
	public List<NoticeVO> noticeList(Criter cri) {
		// 공지사항 글 목록
		return sqlSession.selectList(NAMESPACE+".noticeList",cri);
	}

	@Override
	public Integer noticeTotal() {
		// 공지사항 글 갯수
		return sqlSession.selectOne(NAMESPACE+".noticeTotal");
	}

	@Override
	public void noticeInsert(NoticeVO vo) {
		// 공지사항 글쓰기
		sqlSession.insert(NAMESPACE+".noticeInsert", vo);
	}

	@Override
	public AdminVO adminLogin(AdminVO vo) {
		// 관리자 로그인
		return sqlSession.selectOne(NAMESPACE+".adminLogin",vo);
	}
	
	
	
}
