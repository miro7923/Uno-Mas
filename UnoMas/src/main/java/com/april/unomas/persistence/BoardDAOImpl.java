package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.BoardVO;
import com.april.unomas.domain.Criter;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final Logger log
		= LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.unomas.mapper.BoardMapper";
	
	@Override
	public void boardWrite(BoardVO vo) {
		sqlSession.insert(NAMESPACE+".create",vo);
	}
	
	@Override
	public List<BoardVO> selectBoardList(Criter cri) {
//		List ya = sqlSession.selectList(NAMESPACE+".pagingBoard",cri);
//		System.out.println("ya는? " + ya.get(0));
		return sqlSession.selectList(NAMESPACE+".pagingBoard",cri);
	}

	@Override
	public Integer countBoardList() {
		return sqlSession.selectOne(NAMESPACE+".countBoard");
	}

	@Override
	public void updateBoard(BoardVO vo) {
		sqlSession.update(NAMESPACE+".updateBoard",vo);
	}

	@Override
	public void deleteBoard(Integer faq_num) {
		sqlSession.delete(NAMESPACE+".deleteBoard",faq_num);
	}

	@Override
	public BoardVO getBoard(Integer faq_num) {
		return sqlSession.selectOne(NAMESPACE+".getBoard",faq_num);
	}

	@Override
	public Integer sortCateCount(Integer qnacate_num) {
		
		return sqlSession.selectOne(NAMESPACE+".sortCateCount",qnacate_num);
	}
	
	@Override
	public List<BoardVO> sortCate(Integer qnacate_num, Criter cri) {
		log.info("sortCate");
		log.info(qnacate_num+"");
		log.info(cri+"@@@@@@@@@@@@");
		Map<String,Integer> paramMap = new HashMap<String,Integer>();
		paramMap.put("qnacate_num",qnacate_num);
		paramMap.put("pageStart",cri.getPage()-1);
		paramMap.put("perPageNum",cri.getPerPageNum());
		log.info(paramMap+"##########");
		return sqlSession.selectList(NAMESPACE+".sortCategory",paramMap);
	}

	@Override
	public Integer countBoardList(Criter cri) {
		return sqlSession.selectOne(NAMESPACE+".countBoard",cri);
	}
	
	

}