package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.Criter;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.Qna_ComVO;

@Repository
public class QnaDAOImpl implements QnaDAO{

	
	private static final Logger log = LoggerFactory.getLogger(QnaDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession; 
	
	private static final String NAMESPACE = "com.unomas.mapper.QnaMapper";
	
	@Override
	public void qnaWrite(QnaVO vo) {
		sqlSession.insert(NAMESPACE+".createQna",vo);
	}

	@Override
	public List<QnaVO> qnaListAll() {
		
		log.info("qnaListAll() 호출");
		
		
		
		return sqlSession.selectList(NAMESPACE+".qnaList");
	}

	@Override
	public List<QnaVO> pagingQna(Integer user_num,Criter cri) {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("user_num", user_num);
		paramMap.put("pageStart",cri.getPage());
		paramMap.put("perPageNum",cri.getPerPageNum());
		return sqlSession.selectList(NAMESPACE+".pagingQna1",paramMap);
	}

	@Override
	public Integer getQnaCount(Integer user_num) {
		return sqlSession.selectOne(NAMESPACE+".qnaCnt",user_num);
	}

	@Override
	public void deleteQna(Integer qna_num) {
		sqlSession.delete(NAMESPACE+".deleteQna",qna_num);
	}

	@Override
	public Qna_ComVO getComment(Integer qna_num) {
		return sqlSession.selectOne(NAMESPACE+".getComment",qna_num);
	}
	
	
}
