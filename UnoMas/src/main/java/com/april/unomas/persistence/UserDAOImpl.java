package com.april.unomas.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.april.unomas.domain.AdminVO;
import com.april.unomas.domain.EmailVO;
import com.april.unomas.domain.UserVO;

// @Repository : 해당 클래스가 DAO 역할을 하는 객체로 스프링이 인식
// 이 어노테이션이 있어야 root-context.xml에서 읽어와서 의존성 주입이 가능함

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;
	private static final Logger log = LoggerFactory.getLogger(UserDAOImpl.class);
	private static final String NAMESPACE = "com.unomas.mapper.userMapper";
	
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public String getTime() {
		log.info("DAO : 시간정보 확인 메서드 실행");
		String time = sqlSession.selectOne(NAMESPACE + ".getTime");
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
	
	
	// 회원가입
	@Override
	public void joinUser(UserVO vo) {
		System.out.println("DAO: insertMember(vo)실행");
		sqlSession.insert(NAMESPACE + ".joinUser", vo);
		System.out.println("DAO: 회원가입 완료!");
	}

	// 아이디 중복검사
	@Override
	public int idCheck(UserVO vo) {
		int result = sqlSession.selectOne(NAMESPACE + ".idCheck_sql", vo);
		return result;
	}

	// 로그인
	@Override
	public UserVO loginUser(UserVO vo) {
		System.out.println(" DAO : 로그인 동작 포스트" );
//		log.info(" DAO : loginUser(vo) Post호출 ");
		
		UserVO voTmp = sqlSession.selectOne(NAMESPACE+".loginUser", vo);
	
		return voTmp;
	}
	
	// 회원 정보 조회
	@Override
	public UserVO getUserInfo(String id) {
		UserVO userInfoVO = sqlSession.selectOne(NAMESPACE + ".getUserInfo", id);

		return userInfoVO;
	}
	
	// 회원정보수정
	@Override
	public Integer updateUser(UserVO vo) {
		
		Integer result =sqlSession.update(NAMESPACE+".updateUser",vo);

		log.info("회원정보수정 완료");
		
		return result;
	}

	// 회원탈퇴
	@Override
	public void delUser(UserVO vo) {

		log.info("delUser 실행");
		
		sqlSession.delete(NAMESPACE+".deleteUser",vo);
		
		log.info("회원탈퇴 완료");
		
		
	}
	
	// 회원 아이디 찾기
	@Override
	public int findIdProcess(UserVO vo) {
		int result = -1;
		String find_id = sqlSession.selectOne(NAMESPACE + ".findID_sql", vo);

		if (find_id != null) {
			EmailVO evo = new EmailVO();
			evo.setRecipients(vo.getUser_email());
			evo.setSubject("우노마스 아이디 찾기");
			evo.setContent(vo.getUser_name() + "님의 아이디는 " + find_id + "입니다.");

			int email_result = sendEmailMethod(evo);
			if (email_result == 1) {
				result = 1;
			} else {
				result = 0;
			}
		}
		return result;
	}

	// 회원 비밀번호 찾기
	@Override
	public HashMap<String, String> findPwProcess(UserVO vo) {
		int result = -1;
		String pwCode = null;
		HashMap findpw_map = new HashMap<String, String>();

		String find_pw = sqlSession.selectOne(NAMESPACE + ".findPW_sql", vo);

		if (find_pw.equals("1")) {
			Random r = new Random();
			pwCode = String.valueOf((char) (r.nextInt(26) + 65));
			for (int i = 0; i < 5; i++) {
				pwCode += Integer.toString(r.nextInt(10));
			}

			EmailVO evo = new EmailVO();
			evo.setRecipients(vo.getUser_email());
			evo.setSubject("우노마스 비밀번호 찾기");
			evo.setContent("비밀번호 변경을 위한 코드: " + pwCode);

			int email_result = sendEmailMethod(evo);
			if (email_result == 1) {
				result = 1;
			} else {
				result = 0;
			}
		}
		findpw_map.put("find_pw", Integer.toString(result));
		findpw_map.put("pwCode", pwCode);
		
		return findpw_map;
	}
	
	
	@Override
	public int sendEmailMethod(EmailVO evo) {
		System.out.println("DAO: 이메일 보내기 들어옴");
		int result = 0;
		SimpleMailMessage msg = new SimpleMailMessage();
		
		try {
			msg.setFrom(evo.getSender());
//			msg.setTo(evo.getRecipients());
			msg.setTo("tksop59@naver.com");
			msg.setSubject(evo.getSubject());	// 제목 셋팅
			msg.setText(evo.getContent());	// 내용 셋팅
		
			mailSender.send(msg);
			result = 1;
		} catch(Exception e) {
			
		}
		System.out.println("DAO: 이메일 보내기 완료~~~");
		
		return result;
	}
	
	
	
	
	
	
}
