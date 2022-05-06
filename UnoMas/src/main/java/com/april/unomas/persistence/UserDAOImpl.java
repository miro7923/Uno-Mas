package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.UserVO;

// @Repository : 해당 클래스가 DAO 역할을 하는 객체로 스프링이 인식
// 이 어노테이션이 있어야 root-context.xml에서 읽어와서 의존성 주입이 가능함

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger log = LoggerFactory.getLogger(UserDAOImpl.class);
	
	private static final String NAMESPACE = "com.unomas.mapper.MemberMapper";
	
	@Override
	public String getTime() {
		log.info("DAO : 시간정보 확인 메서드 실행");
		
		String time = sqlSession.selectOne(NAMESPACE + ".getTime");
		
		log.info("DAO : SQL 실행완료");
		log.info("DAO : time - " + time);
		
		return time;
	}

	@Override
	public void joinAdmin(AdminVO vo) {
		
		log.info("DAO : 관리자 등록 메서드 실행");
		
		sqlSession.insert(NAMESPACE + ".joinAdmin", vo);
		
		log.info("DAO : SQL 실행 완료");
		log.info("DAO : admin - " + vo.toString());
	}

	// 로그인
	@Override
	public UserVO loginUser(UserVO vo) {
		System.out.println(" DAO : 로그인 동작 포스트" );
//		log.info(" DAO : loginUser(vo) Post호출 ");
		
		UserVO voTmp = sqlSession.selectOne(NAMESPACE+".loginUser", vo);
	
		return voTmp;
	}
	
	
	
	
	
	
}
