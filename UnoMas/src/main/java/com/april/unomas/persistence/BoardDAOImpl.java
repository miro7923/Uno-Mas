package com.april.unomas.persistence;

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
		log.info("boardWrite(vo) -> mapper");
		
		sqlSession.insert(NAMESPACE+".create",vo);
		
		log.info("mapper(실행완료) -> DAO -> service");

	}

	@Override
	public List<BoardVO> listAll() {
		log.info("listAll() -> mapper");
		
		log.info("mapper완료 -> service 이동");
		
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

	@Override
	public List<BoardVO> sortCate(String faq_cate) {
		log.info("sortCate");
		log.info(faq_cate);
		return sqlSession.selectList(NAMESPACE+".sortCategory",faq_cate);
	}

	@Override
	public List<BoardVO> selectBoardList(Criter cri) {
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
	public BoardVO getBoard(Integer faq_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getBoard",faq_num);
	}

	@Override
	public Integer countBoardList(Criter cri) {
		
		return sqlSession.selectOne(NAMESPACE+".countBoard",cri);
	}

	@Override
	public Integer sortCateCount(String faq_cate) {
		
		return sqlSession.selectOne(NAMESPACE+".sortCateCount",faq_cate);
	}
	
	
	

}
