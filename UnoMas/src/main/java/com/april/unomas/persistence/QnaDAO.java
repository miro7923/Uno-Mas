package com.april.unomas.persistence;

import java.util.List;

import com.april.unomas.domain.Criter;
import com.april.unomas.domain.QnaVO;

public interface QnaDAO {

	
	public void qnaWrite(QnaVO vo);
	
	public List<QnaVO> qnaListAll();
	
	public List<QnaVO> pagingQna(int user_num,Criter cri);
	
	public Integer getQnaCount(Integer user_num);
	
	public void deleteQna(Integer qna_num);
	
}
