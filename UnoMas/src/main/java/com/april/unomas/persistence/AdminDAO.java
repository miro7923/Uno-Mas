package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.Qna_ComVO;
import com.april.unomas.domain.UserCriteria;
import com.april.unomas.domain.UserVO;

public interface AdminDAO {
	
	// 관리자 로그인
	public AdminVO adminLogin(AdminVO vo);

	// 관리자 목록
	public List<AdminVO> adminList(Criter cri);

	// 관리자 수
	public Integer adminTotal();


	// 관리자 - User
	public Integer allUserCount(String standard);

	public List<UserVO> getAllUser(String standard, UserCriteria cri) throws Exception;

	public List<UserVO> getDropUser(UserCriteria cri) throws Exception;
	
	// 공지사항 글 목록
	public List<NoticeVO> noticeList(Criter cri);
	
	// 공지사항 글 갯수
	public Integer noticeTotal();
	
	// 공지사항 글쓰기
	public void noticeInsert(NoticeVO vo);
	
	// 공지사항 글보기
	public NoticeVO noticeRead(Integer notice_num);
	
	// 공지사항 수정하기
	public void noticeUpdate(NoticeVO vo);
	
	// 공지사항 삭제하기
	public void noticeDelete(Integer notice_num);
	
	// 공지사항 조회수 증가
	public void noticeReadCountUp(Integer notice_num);
	
	// 자주하는 질문 글 목록
	public List<BoardVO> faqList(Criter cri);
	
	// 자주하는 질문 글 갯수
	public Integer faqTotal();
	
	// 자주하는 질문 정렬 글 갯수
	public Integer faqSortTotal(Integer qnacate_num);
	
	// 자주하는 질문 카테고리 정렬
	public List<BoardVO> faqSortCate(Integer qnacate_num, Criter cri);
	
	// 자주하는 질문 글 쓰기
	public void faqInsert(BoardVO vo);
	
	// 자주하는 질문 수정하기
	public void faqUpdate(BoardVO vo);
	
	// 자주하는 질문 삭제하기
	public void faqDelete(Integer faq_num);
	
	// 자주하는 질문 조회
	public BoardVO getFaq(Integer faq_num);
	
	// 1:1 문의글 목록
	public List<QnaVO> qnaList(Criter cri);
		
	// 1:1 문의글 갯수
	public Integer qnaTotal();
	
	// 1:1 문의글 답변 쓰기
	public void qnaCommentWrite(Qna_ComVO vo);
	
	// 1:1 문의글 답변 보기
	public Qna_ComVO qnaCommentView(Integer qna_num);
	
	// 1:1 문의글 답변상태 업데이트
	public void qnaProcessUp(Integer qna_num);
	
	// 1:1 문의글 하나 가져오기
	public QnaVO getQna(Integer qna_num);
	
}
