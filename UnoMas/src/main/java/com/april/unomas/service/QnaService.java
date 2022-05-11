package com.april.unomas.service;


import java.util.List;

import com.april.unomas.domain.QnaVO;

public interface QnaService {
	
	public void qnaWrite(QnaVO vo) throws Exception;
	
	public List<QnaVO> qnaList() throws Exception;
	
}
