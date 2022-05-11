package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.QnaVO;

public interface QnaDAO {

	
	public void qnaWrite(QnaVO vo);
	
	public List<QnaVO> qnaListAll();
}
