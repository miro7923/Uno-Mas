package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.Criter;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.Qna_ComVO;

public interface QnaDAO {

	
	public void qnaWrite(QnaVO vo);
	
	public List<QnaVO> qnaListAll();
	
	public List<QnaVO> pagingQna(Integer user_num,Criter cri);
	
	public Integer getQnaCount(Integer user_num);
	
	public void deleteQna(Integer qna_num);
	
	public Qna_ComVO getComment(Integer qna_num);
	
}
