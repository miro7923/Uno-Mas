package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	
	
	
}
