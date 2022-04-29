package com.april.unomas.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	
	private static final Logger log
		= LoggerFactory.getLogger(BoardDAOImpl.class);

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.unomas.mapper.NoticeMapper";

	@Override
	public void noticeWrite(NoticeVO vo) {
		sqlSession.insert(NAMESPACE+".create",vo);
		
		log.info("mapper(실행완료) -> DAO -> service");
		
	}

	@Override
	public List<NoticeVO> listAll() {
		log.info("listAll() -> mapper");
	
		log.info("mapper완료 -> service 이동");
	
		return sqlSession.selectList(NAMESPACE+".listAll");
		
	}

	@Override
	public NoticeVO getNotice(Integer notice_num) {
		NoticeVO vo = sqlSession.selectOne(NAMESPACE+".getNotice", notice_num);
		
		log.info("sql 처리 결과를 리턴");
		log.info(vo.toString());
		
		return vo;
		
	}
	
	
}
