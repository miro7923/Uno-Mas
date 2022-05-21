package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.Qna_ComVO;
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
	public Integer adminLogin(AdminVO vo) {
		// 관리자 로그인
		return dao.adminLogin(vo);
	}

	@Override
	public NoticeVO getNotice(Integer notice_num) throws Exception {
		// 공지사항 조회
		return dao.noticeRead(notice_num);
	}

	@Override
	public void noticeUpdate(NoticeVO vo) throws Exception {
		// 공지사항 수정하기
		dao.noticeUpdate(vo);
	}

	@Override
	public void noticeDelete(Integer notice_num) throws Exception {
		// 공지사항 삭제하기
		dao.noticeDelete(notice_num);
	}

	@Override
	public void rCountUp(Integer notice_num) throws Exception {
		// 공지사항 조회수 증가
		dao.noticeReadCountUp(notice_num);
	}

	@Override
	public void faqWrite(BoardVO vo) throws Exception {
		// 자주하는 질문 글쓰기
		dao.faqInsert(vo);
	}

	@Override
	public List<BoardVO> faqView(Criter cri) throws Exception {
		// 자주하는 질문 목록
		return dao.faqList(cri);
	}

	@Override
	public Integer faqCount() throws Exception {
		// 자주하는 질문 갯수
		return dao.faqTotal();
	}

	@Override
	public List<BoardVO> faqSortView(Integer qnacate_num, Criter cri) throws Exception {
		// 자주하는 질문 정렬 목록
		return dao.faqSortCate(qnacate_num, cri);
	}

	@Override
	public Integer faqSortCount(Integer qnacate_num) throws Exception {
		// 자주하는 질문 정렬 갯수
		return dao.faqSortTotal(qnacate_num);
	}

	@Override
	public void faqUpdate(BoardVO vo) throws Exception {
		// 자주하는 질문 수정
		dao.faqUpdate(vo);
	}

	@Override
	public void faqDelete(Integer faq_num) throws Exception {
		// 자주하는 질문 삭제
		dao.faqDelete(faq_num);
	}

	@Override
	public BoardVO getFaq(Integer faq_num) throws Exception {
		// 자주하는 질문 조회
		return dao.getFaq(faq_num);
	}

	@Override
	public List<QnaVO> qnaView(Criter cri) throws Exception {
		// 1:1문의 목록
		return dao.qnaList(cri);
	}

	@Override
	public Integer qnaCount() throws Exception {
		// 1:1문의 갯수
		return dao.qnaTotal();
	}

	@Override
	public void qnaCommentWrite(Qna_ComVO vo) throws Exception {
		// 1:1문의 답변 쓰기
		dao.qnaCommentWrite(vo);
	}

	@Override
	public Qna_ComVO qnaCommentView(Integer qna_num) throws Exception {
		// 1:1문의 답변 내용보기
		return dao.qnaCommentView(qna_num);
	}

	@Override
	public void qnaProcessUp(Integer qna_num) throws Exception {
		// 1:1문의 답변상태 업데이트
		dao.qnaProcessUp(qna_num);
	}

	@Override
	public QnaVO getQna(Integer qna_num) throws Exception {
		// 1:1문의 조회
		return dao.getQna(qna_num);
	}
	
	
	
}
