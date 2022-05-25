package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.april.unomas.domain.Criter;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.Qna_ComVO;
import com.april.unomas.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDAO dao;
	
	@Override
	public void qnaWrite(String saveID,QnaVO vo) throws Exception {
		dao.qnaWrite(saveID,vo);
	}

	@Override
	public List<QnaVO> qnaList() throws Exception {
		return dao.qnaListAll();
	}

	@Override
	public Integer getQnaCnt(String user_id) throws Exception {
		return dao.getQnaCount(user_id);
	}

	@Override
	public List<QnaVO> pagingQnaList(String user_id,Criter cri) throws Exception {
		return dao.pagingQna(user_id,cri);
	}

	@Override
	public void deleteInquiry(Integer qna_num) {
		dao.deleteQna(qna_num);
	}

	@Override
	public Qna_ComVO getComment(Integer qna_num) {
		return dao.getComment(qna_num);
	}	
	
}