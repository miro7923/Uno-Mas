package com.april.unomas.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.unomas.domain.UserVO;
import com.april.unomas.service.UserService;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Inject
	private UserService service;
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	
	// 회원가입 이용약관 페이지
	@RequestMapping(value = "/register_agree")
	public String registerAgree() {
		return "/user/registerAgree";
	}
	
	@RequestMapping(value = "/register")
	public String registerGet() {
		return "/user/register";
	}
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String registerPost(@RequestParam("emailAgree") String eAgree, UserVO vo) {
		if(eAgree.equals("1")) {
			vo.setUser_emailagree(1);
		}
		service.joinUser(vo);
		return "redirect:/user/login";
	}
	
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public String idCheck(UserVO vo) {
		String res = Integer.toString(service.idCheck(vo));
		return res;
	}
	
	

	// 로그인 페이지 구현 (GET)
	// http://localhost:8088/user/login
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String loginGET() {
		log.info(" loginGET() 호출 -> user/login.jsp 이동" );
		
		return "/user/login";
	}
	
	// 로그인 페이지 구현 (POST)
	// http://localhost:8088/user/login
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPOST(UserVO vo, HttpSession session) {
		log.info(" loginPOST() 호출 -> user/login.jsp 이동" );
		
		// 전달된 정보 저장
		log.info(vo.getUser_id());
		
		// 로그인체크 기능 호출 - 서비스
		UserVO loginVO = service.loginUser(vo);
		
		// 로그인 실패
		if(loginVO == null) {
			return "redirect:/user/login";
		}
		
		log.info(loginVO+"");
		
		// 로그인 성공 및 정보 저장
		session.setAttribute("loginCheck", loginVO);
		
		// 메인페이지로 이동
		return "redirect:/index";
	}
	
	// 로그아웃 구현
	// http://localhost:8088/user/logout
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logoutGET(HttpSession session ) {
		
		log.info(" logoutGET() 호출 -> 메인 페이지 index.jsp 이동");
		
		// 로그아웃 시 세션 초기화
		session.invalidate();
		
		return "redirect:/index";
	}
	
	// 회원탈퇴(GET)
	@RequestMapping(value = "/delete_user",method=RequestMethod.GET)
	public String delUserGET() {
		
		log.info("delUserGET() 호출 -> deleteUser.jsp 이동");
		
		return "user/deleteUser";
	}
	
	// 회원탈퇴(POST)
	@RequestMapping(value = "/delete_user",method=RequestMethod.POST)
	public String delUserPOST(UserVO vo,HttpSession session) {
		
		service.delUser(vo);
		
		session.invalidate();
		
		log.info("delUserPOST 처리 완료");
		
		return "redirect:/user/index";
	}
	
	
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id")
	public String findIDGet() {
		return "user/findID";
	}
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	@ResponseBody
	public String findIDPost(UserVO vo) {
		String result = Integer.toString(service.findIdProcess(vo));
		return result;
	}
	
	// 비번 찾기
	@RequestMapping(value = "/find_pw")
	public String findPW() {
		return "user/findPW";
	}
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> findPWPost(UserVO vo) {
		HashMap<String, String> findpw_map = service.findPwProcess(vo);
		
		return findpw_map;
	}

	// 비번 변경
	@RequestMapping(value = "/change_pw")
	public String changePWGet(@RequestParam(value="id", required=false) String id) {
		return "user/changePW";
	}
	@RequestMapping(value = "/change_pw", method = RequestMethod.POST)
	public String changePWPost(UserVO vo) {
		System.out.println("값 확인: " + vo.getUser_id() + vo.getUser_pass());
//		service.changePW(vo);
		
		return "user/changePW";
	}
	
	
	
	
	// mypage
	@RequestMapping(value = "/mypage")
	public String mypage() {
		return "user/myPage";
	}

	@RequestMapping(value = "/myInfo")
	public String myInfo(HttpSession session, Model model) {
		String saveID = (String) session.getAttribute("saveID");
		UserVO userInfoVO = service.getUserInfo("Admin"); // 일단 직접 입력하고 추 후에 세션값 입력.
		model.addAttribute("userInfoVO", userInfoVO);
		return "user/myInfo";
	}

	

	// 회원정보수정(GET)
	// http://localhost:8088/user/update_myInfo
	@RequestMapping(value = "/update_myInfo",method = RequestMethod.GET)
	public String myInfoUpdateGET(HttpSession session, Model model) {
		
		UserVO vo = (UserVO)session.getAttribute("loginCheck");
		
//		UserVO infoVO = service.
		
		return "user/updateMyInfo";
	}
	
	// 회원정보수정(POST)
	// http://localhost:8088/user/update_myInfo
	@RequestMapping(value = "/update_myInfo",method = RequestMethod.POST)
	public String myInfoUpdatePOST(UserVO vo) {
		return "redirect:/user/myPage";
	}
	
	
	
	@RequestMapping(value = "/mypoint")
	public String myPoint() {
		return "user/myPoint";
	}
	
	// guide
	@RequestMapping(value = "/return_guide")
	public String canclePinfo() {
		return "user/returnGuide";
	}
	@RequestMapping(value = "/together_guide")
	public String togetherInfo() {
		return "user/togetherGuide";
	}
	
	

}
