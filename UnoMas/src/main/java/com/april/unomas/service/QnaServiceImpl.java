package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.april.unomas.domain.Criter;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {

	
	@Inject
	private QnaDAO dao;
	
	@Override
	public void qnaWrite(QnaVO vo) throws Exception {
		dao.qnaWrite(vo);
	}

	@Override
	public List<QnaVO> qnaList() throws Exception {
		return dao.qnaListAll();
	}

	@Override
	public Integer getQnaCnt(Integer user_num) throws Exception {
		return dao.getQnaCount(user_num);
	}

	@Override
	public List<QnaVO> pagingQnaList(int user_num,Criter cri) throws Exception {
		return dao.pagingQna(user_num,cri);
	}

	@Override
	public void deleteInquiry(Integer qna_num) {
		dao.deleteQna(qna_num);
	}
	
	
}
