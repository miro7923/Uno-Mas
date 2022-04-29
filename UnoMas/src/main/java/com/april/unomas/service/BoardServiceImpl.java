package com.april.unomas.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.april.unomas.domain.BoardVO;
import com.april.unomas.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	private static final Logger log 
		= LoggerFactory.getLogger(BoardServiceImpl.class);

	@Inject
	private BoardDAO dao;

	@Override
	public void boardWrite(BoardVO vo) throws Exception {
		log.info("regist(BoardVO vo) -> DAO : boardWrite(vo) 호출");
		// dao(주입객체)를 사용하여 mapper에 접근
		dao.boardWrite(vo);
	
		log.info("DAO동작 수행 완료");
	
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		log.info("listAll() -> DAO 동작 호출");
	
		log.info("DAO 동작 -> 컨트롤러 호출");
	
		return dao.listAll();
	}

}
