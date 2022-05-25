package com.april.unomas.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.Criter;
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
	}

	@Override
	public NoticeVO getNotice(Integer notice_num) {
		return sqlSession.selectOne(NAMESPACE+".getNotice", notice_num);
	}

	@Override
	public void rCountUp(Integer notice_num) {
		sqlSession.update(NAMESPACE+".rCountUp",notice_num);
	}

	@Override
	public Integer getNoticeCount(Criter cri) {
		return sqlSession.selectOne(NAMESPACE+".noticeCnt",cri);
	}

	@Override
	public List<NoticeVO> pagingNotice(Criter cri) {
		return sqlSession.selectList(NAMESPACE+".pagingNotice",cri);
	}

	@Override
	public void updateNotice(NoticeVO vo) {
		sqlSession.update(NAMESPACE+".updateNotice",vo);
	}

	@Override
	public void deleteNotice(Integer notice_num) {
		sqlSession.delete(NAMESPACE+".deleteNotice",notice_num);
	}

	@Override
	public void noticeInsert(NoticeVO vo) {
		sqlSession.insert(NAMESPACE+".insert",vo);
	}
}