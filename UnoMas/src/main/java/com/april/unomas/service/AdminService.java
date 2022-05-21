package com.april.unomas.service;

import java.util.List;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.Qna_ComVO;
import com.april.unomas.domain.UserVO;

public interface AdminService {

	// 관리자 로그인
	public Integer adminLogin(AdminVO vo) throws Exception;
	
	// 관리자 목록
	public List<AdminVO> adminView(Criter cri) throws Exception;
	
	// 관리자 수
	public Integer adminCount() throws Exception;
		
	// 유저 목록
	public List<UserVO> userView(Criter cri) throws Exception;
	
	// 유저 수
	public Integer userCount() throws Exception;
	
	// 공지사항 목록
	public List<NoticeVO> noticeView(Criter cri) throws Exception;
	
	// 공지사항 글 갯수
	public Integer noticeCount() throws Exception;
	
	// 공지사항 글쓰기
	public void noticeWrite(NoticeVO vo) throws Exception;
	
	// 공지사항 조회하기
	public NoticeVO getNotice(Integer notice_num) throws Exception;
	
	// 공지사항 수정하기
	public void noticeUpdate(NoticeVO vo) throws Exception;
	
	// 공지사항 삭제하기
	public void noticeDelete(Integer notice_num) throws Exception;
	
	// 공지사항 조회수 증가
	public void rCountUp(Integer notice_num) throws Exception;
	
	// 자주하는 질문 글쓰기
	public void faqWrite(BoardVO vo) throws Exception;
	
	// 자주하는 질문 목록
	public List<BoardVO> faqView(Criter cri) throws Exception;
	
	// 자주하는 질문 갯수
	public Integer faqCount() throws Exception;
	
	// 자주하는 질문 정렬 목록
	public List<BoardVO> faqSortView(Integer qnacate_num,Criter cri) throws Exception;
	
	// 자주하는 질문 정렬 갯수
	public Integer faqSortCount(Integer qnacate_num) throws Exception;
	
	// 자주하는 질문 수정하기
	public void faqUpdate(BoardVO vo) throws Exception;
	
	// 자주하는 질문 삭제하기
	public void faqDelete(Integer faq_num) throws Exception;
	
	// 자주하는 질문 조회
	public BoardVO getFaq(Integer faq_num) throws Exception;
	
	// 1:1문의 목록
	public List<QnaVO> qnaView(Criter cri) throws Exception;
		
	// 1:1문의 갯수
	public Integer qnaCount() throws Exception;
	
	// 1:1문의 답변 쓰기
	public void qnaCommentWrite(Qna_ComVO vo) throws Exception;
	
	// 1:1문의 답변 보기
	public Qna_ComVO qnaCommentView(Integer qna_num) throws Exception;
	
	// 1:1문의 답변상태 업데이트
	public void qnaProcessUp(Integer qna_num) throws Exception;
	
	// 1:1문의 조회
	public QnaVO getQna(Integer qna_num) throws Exception;
}
