package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.UserCriteria;

import org.springframework.stereotype.Repository;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.Qna_ComVO;
import com.april.unomas.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.unomas.mapper.adminMapper";
	private static final Logger log = LoggerFactory.getLogger(AdminDAOImpl.class);

	
	// 관리자 - 관리자
	// 관리자 로그인
	@Override
	public AdminVO adminLogin(AdminVO vo) {
		return sqlSession.selectOne(NAMESPACE+".adminLogin",vo);
	}
	
	// 관리자 목록 보기
	@Override
	public List<AdminVO> adminList(Criter cri) {
		return sqlSession.selectList(NAMESPACE+".adminList",cri);
	}
	
	
	
	// 관리자 - User파트
	@Override
	public Integer allUserCount(String standard) {	
		System.out.println(" AdminDAO : 여기서 문제?" + standard);
		if(standard.equals("drop")) {
			return Integer.parseInt(sqlSession.selectOne(NAMESPACE+".allDropUserCount"));
		} else {
			return Integer.parseInt(sqlSession.selectOne(NAMESPACE+".allUserCount"));
		}
	}

	@Override
	public List<UserVO> getAllUser(String standard, UserCriteria cri) throws Exception{
		Map<String, Object> map = new HashMap();
		map.put("standard", standard);
		map.put("cri", cri);
		return sqlSession.selectList(NAMESPACE+".getAllUser", map);
	}

	
	@Override
	public List<UserVO> getDropUser(UserCriteria cri) throws Exception {
		System.out.println("DAO: 탈퇴조회 여기까지 들어와??");
		return sqlSession.selectList(NAMESPACE+".getDropUser");
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
	public List<QnaVO> qnaList(Criter cri) {
		// 1:1문의 목록
		return sqlSession.selectList(NAMESPACE+".qnaList",cri);
	}

	@Override
	public Integer qnaTotal() {
		// 1:1문의 갯수
		return sqlSession.selectOne(NAMESPACE+".qnaTotal");
	}

	@Override
	public void qnaCommentWrite(Qna_ComVO vo) {
		// 1:1문의 답변 쓰기
		sqlSession.insert(NAMESPACE+".qnaCommentWrite",vo);
	}

	@Override
	public Qna_ComVO qnaCommentView(Integer qna_num) {
		// 1:1문의 답변 보기
		return sqlSession.selectOne(NAMESPACE+".getComment",qna_num);
	}

	@Override
	public void qnaProcessUp(Integer qna_num) {
		// 1:1문의 답변상태 업데이트
		sqlSession.update(NAMESPACE+".qnaProcessUp",qna_num);
	}

	@Override
	public QnaVO getQna(Integer qna_num) {
		// 1:1문의 조회
		return sqlSession.selectOne(NAMESPACE+".getQna",qna_num);
	}
	
	
}
