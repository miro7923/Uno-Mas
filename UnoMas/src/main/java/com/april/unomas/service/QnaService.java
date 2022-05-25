package com.april.unomas.service;


import java.util.List;

import com.april.unomas.domain.Criter;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.Qna_ComVO;

public interface QnaService {
	
	public void qnaWrite(String saveID,QnaVO vo) throws Exception;
	
	public List<QnaVO> qnaList() throws Exception;
	
	public Integer getQnaCnt(String user_id) throws Exception;
	
	public List<QnaVO> pagingQnaList(String user_id,Criter cri) throws Exception;
	
	public void deleteInquiry(Integer qna_num);
	
	public Qna_ComVO getComment(Integer qna_num);
	
}
