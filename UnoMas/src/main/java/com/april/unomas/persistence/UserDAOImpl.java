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
import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.EmailVO;
import com.april.unomas.domain.UserCriteria;
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
		String time = sqlSession.selectOne(NAMESPACE + ".getTime");
		return time;
	}

	@Override
	public void joinAdmin(AdminVO vo) {
		sqlSession.insert(NAMESPACE + ".joinAdmin", vo);
	}
	
	
	// 회원가입
	@Override
	public void joinUser(UserVO vo) {
		sqlSession.insert(NAMESPACE + ".joinUser", vo);
	}

	// 아이디 중복검사
	@Override
	public int idCheck(UserVO vo) {
		int result = sqlSession.selectOne(NAMESPACE + ".idCheck_sql", vo);
		return result;
	}

	// 로그인
	@Override
	public HashMap<String, Integer> loginUser(UserVO vo) {
		HashMap<String, Integer> loginMap = new HashMap<String, Integer>() { 
			{ put("result", 0); put("num", null); }
		};
		int result = 0;
		UserVO loginVO = sqlSession.selectOne(NAMESPACE + ".loginUser", vo);

		if (loginVO == null) {
			result = 0;
		} else {
			if (loginVO.getUser_status() != 1) {
				result = -1;
			} else {
				result = 1;
				loginMap.put("num", loginVO.getUser_num());
			}
		}
		loginMap.put("result", result);
		return loginMap;
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
	
	
	// 비번 변경
	@Override
	public int changePW(UserVO vo) {	
		return sqlSession.update(NAMESPACE + ".changePW_sql", vo);
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
		Integer result = sqlSession.update(NAMESPACE+".updateUser",vo);
		return result;
	}

	// 추가 배송지(orderAddr)
//	@Override
//	public Integer updateAddr(UserVO vo) {
//		
//		Integer result =sqlSession.update(NAMESPACE+".updateAddr",vo);
//
//		log.info("회원정보수정-추가배송지 완료");
//		
//		return result;
//	}

	// 비번체크
	@Override
	public Integer checkPW(UserVO vo) {
		return sqlSession.selectOne(NAMESPACE+".checkPW",vo);
	}

	// 회원탈퇴
	@Override
	public Integer deleteUser(UserVO vo) {
		return sqlSession.delete(NAMESPACE+".deleteUser",vo); 
	}
	
	
	// 내 리뷰 개수
	@Override
	public Integer getMyReviewCnt(String num) {
		return sqlSession.selectOne(NAMESPACE+".myReviewCnt", num);
	}

	// 내 리뷰
	@Override
	public List<BoardReviewVO> getMyReview(String id, UserCriteria cri) {
		System.out.println("DAO: 잘 들어옴?" + id + "" + cri);
		Map<String, Object> map = new HashMap();
		map.put("id", id);
		map.put("cri", cri);
		
		return sqlSession.selectList(NAMESPACE+".getMyReview", map);
	}

	@Override
	public int sendEmailMethod(EmailVO evo) {
		int result = 0;
		SimpleMailMessage msg = new SimpleMailMessage();
		
		try {
			msg.setFrom(evo.getSender());
			msg.setTo(evo.getRecipients());
			msg.setSubject(evo.getSubject());	
			msg.setText(evo.getContent());	
		
			mailSender.send(msg);
			result = 1;
		} catch(Exception e) {
			
		}
		
		return result;
	}
	
	
	
	
	
	
}
