package com.april.unomas.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.QnaVO;

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
	
	
	
	
}
