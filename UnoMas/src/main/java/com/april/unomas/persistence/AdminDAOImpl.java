package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.QnaVO;
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

	@Override
	public NoticeVO noticeRead(Integer notice_num) {
		// 공지사항 글 조회
		return sqlSession.selectOne(NAMESPACE+".getNotice",notice_num);
	}

	@Override
	public void noticeUpdate(NoticeVO vo) {
		// 공지사항 수정하기
		sqlSession.update(NAMESPACE+".noticeUpdate",vo);
	}

	@Override
	public void noticeDelete(Integer notice_num) {
		// 공지사항 삭제하기
		sqlSession.delete(NAMESPACE+".noticeDelete",notice_num);
	}

	@Override
	public void noticeReadCountUp(Integer notice_num) {
		// 공지사항 조회수 증가
		sqlSession.update(NAMESPACE+".rCountUp",notice_num);
	}

	@Override
	public List<BoardVO> faqList(Criter cri) {
		// 자주하는 질문 목록
		return sqlSession.selectList(NAMESPACE+".faqList",cri);
	}

	@Override
	public Integer faqTotal() {
		// 자주하는 질문 갯수
		return sqlSession.selectOne(NAMESPACE+".faqCount");
	}

	@Override
	public Integer faqSortTotal(Integer qnacate_num) {
		// 자주하는 질문 정렬 글 갯수
		return sqlSession.selectOne(NAMESPACE+".sortCateCount",qnacate_num);
	}

	@Override
	public List<BoardVO> faqSortCate(Integer qnacate_num, Criter cri) {
		// 자주하는 질문 정렬 목록
		Map<String,Integer> paramMap = new HashMap<String,Integer>();
		paramMap.put("qnacate_num",qnacate_num);
		paramMap.put("pageStart",cri.getPage()-1);
		paramMap.put("perPageNum",cri.getPerPageNum());
		return sqlSession.selectList(NAMESPACE+".faqSortCategory",paramMap);
	}

	@Override
	public void faqInsert(BoardVO vo) {
		// 자주하는 질문 글쓰기
		sqlSession.insert(NAMESPACE+".faqInsert",vo);
	}

	@Override
	public void faqUpdate(BoardVO vo) {
		// 자주하는 질문 수정하기
		sqlSession.update(NAMESPACE+".faqUpdate",vo);
	}

	@Override
	public void faqDelete(Integer faq_num) {
		// 자주하는 질문 삭제하기
		sqlSession.delete(NAMESPACE+".faqDelete",faq_num);
	}

	@Override
	public BoardVO getFaq(Integer faq_num) {
		// 자주하는 질문 조회
		return sqlSession.selectOne(NAMESPACE+".getFaq",faq_num);
	}

	@Override
	public List<QnaVO> qnaList(int user_num, Criter cri) {
		// 1:1문의 목록
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("user_num", user_num);
		paramMap.put("pageStart",cri.getPage());
		paramMap.put("perPageNum",cri.getPerPageNum());
		return sqlSession.selectList(NAMESPACE+".qnaList",paramMap);
	}

	@Override
	public Integer qnaTotal() {
		// 1:1문의 갯수
		return sqlSession.selectOne(NAMESPACE+"qnaTotal");
	}
	
	
	
	
}
