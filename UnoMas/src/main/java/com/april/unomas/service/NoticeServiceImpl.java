package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.Criter;
import com.april.unomas.domain.NoticeVO;
import com.april.unomas.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	private static final Logger log 
	= LoggerFactory.getLogger(BoardServiceImpl.class);

	@Inject
	private NoticeDAO dao;
	
	@Override
	public void noticeWrite(NoticeVO vo) throws Exception {
		// dao(주입객체)를 사용하여 mapper에 접근
		dao.noticeWrite(vo);
	
		log.info("DAO동작 수행 완료");

	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		log.info("listAll() -> DAO 동작 호출");
		
		log.info("DAO 동작 -> 컨트롤러 호출");
	
		return dao.listAll();
	}

	@Override
	public NoticeVO getNotice(Integer notice_num) throws Exception {
		
		NoticeVO vo = dao.getNotice(notice_num);
		
		log.info("조회결과 : " + vo);
		
		return vo;
		
	}

	@Override
	public void rCountUp(Integer notice_num) throws Exception {
		dao.rCountUp(notice_num);
	}

	@Override
	public Integer noticeCnt(Criter cri) throws Exception {
		return dao.getNoticeCount(cri);
	}

	@Override
	public List<NoticeVO> pagingNotices(Criter cri) throws Exception {
		return dao.pagingNotice(cri);
	}

	@Override
	public void updateNotice(NoticeVO vo) throws Exception {
		dao.updateNotice(vo);
	}

	@Override
	public void deleteNotice(Integer notice_num) throws Exception {
		dao.deleteNotice(notice_num);
	}
	
	
	

}
