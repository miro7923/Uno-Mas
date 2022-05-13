package com.april.unomas.service;


import java.util.List;

import com.april.unomas.domain.Criter;
import com.april.unomas.domain.QnaVO;

public interface QnaService {
	
	public void qnaWrite(QnaVO vo) throws Exception;
	
	public List<QnaVO> qnaList() throws Exception;
	
	public Integer getQnaCnt(Integer user_num) throws Exception;
	
	public List<QnaVO> pagingQnaList(int user_num,Criter cri) throws Exception;
	
}
