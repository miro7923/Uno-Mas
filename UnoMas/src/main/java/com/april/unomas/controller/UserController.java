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

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(@RequestParam("emailAgree") String eAgree, UserVO vo) {
		if (eAgree.equals("1")) {
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
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {
		log.info(" loginGET() 호출 -> user/login.jsp 이동");

		return "/user/login";
	}

	// 로그인 페이지 구현 (POST)
	// http://localhost:8088/user/login
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String loginPOST(UserVO vo, HttpSession session) {
		System.out.println(" loginPOST() 호출 -> user/login.jsp 이동");

		// 전달된 정보 저장
		System.out.println("아이디 잘 들어와?: " + vo.getUser_id());


		Integer result = service.loginUser(vo);
		System.out.println("로그인 결과!!!  " + result);

		if(result == 1) {
			session.setAttribute("saveID", vo.getUser_id());
		}
		
		return Integer.toString(result);
	}

	// 로그아웃 구현
	// http://localhost:8088/user/logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {

		log.info(" logoutGET() 호출 -> 메인 페이지 index.jsp 이동");

		// 로그아웃 시 세션 초기화
		session.invalidate();

		return "redirect:/index";
	}

	// 회원탈퇴(GET)
	@RequestMapping(value = "/delete_user", method = RequestMethod.GET)
	public String deleteUserGET() {

		log.info("deleteUserGET() 호출 -> deleteUser.jsp 이동");

		return "/user/deleteUser";
	}

	// 회원탈퇴(POST)
	@RequestMapping(value = "/delete_user", method = RequestMethod.POST)
	public String deleteUserPOST(UserVO vo, HttpSession session) {

		service.deleteUser(vo);

		session.invalidate();

		log.info("deleteUserPOST 처리 완료");

		return "redirect:/index";
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
		return "/user/findPW";
	}

	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> findPWPost(UserVO vo) {
		HashMap<String, String> findpw_map = service.findPwProcess(vo);

		return findpw_map;
	}

	// 비번 변경
	@RequestMapping(value = "/change_pw")
	public String changePWGet(@RequestParam(value = "id", required = false) String id, Model model) {
		model.addAttribute("id", id);
		return "/user/changePW";
	}

	@RequestMapping(value = "/change_pw", method = RequestMethod.POST)
	@ResponseBody
	public String changePWPost(UserVO vo) {
		String result = Integer.toString(service.changePW(vo));

		return result;
	}

	// mypage
	@RequestMapping(value = "/mypage")
	public String mypage() {
		return "/user/myPage";
	}

	@RequestMapping(value = "/myInfo")
	public String myInfo(HttpSession session, Model model) {
		UserVO saveID = (UserVO) session.getAttribute("saveID");
		UserVO userInfoVO = service.getUserInfo("Admin"); // 일단 직접 입력하고 추 후에 세션값 입력.
		model.addAttribute("userInfoVO", userInfoVO);
		return "/user/myInfo";
	}
	
	// 비밀번호 체크
	@RequestMapping(value="/checkPw",method = RequestMethod.GET)
	public String checkPw(UserVO vo, Model model) {
		boolean result = service.checkPw(vo);
		
		if(result) { // 일치
			return "redirect:/user/updateMyInfo";
			
		}else { // 불일치
			service.updateUser(vo);
			model.addAttribute("msg", "비밀번호가 틀립니다.");
			
			return "/user/checkPw";
		}
	}

	//회원정보수정(GET)
	// http://localhost:8088/user/update_myInfo
	@RequestMapping(value = "/update_myInfo", method = RequestMethod.GET)
	public String myInfoUpdateGET(HttpSession session, Model model) {

		UserVO vo = (UserVO) session.getAttribute("saveID");

		UserVO infoVO = service.getUserInfo(vo.getUser_id());

		model.addAttribute("infoVO", infoVO);

		return "/user/updateMyInfo";
	}

	// 회원정보수정(POST)
	// http://localhost:8088/user/update_myInfo
	@RequestMapping(value = "/update_myInfo", method = RequestMethod.POST)
	public String myInfoUpdatePOST(UserVO vo) {

		log.info("수정한 데이터 : " + vo);

		service.updateUser(vo);

		return "redirect:/user/myInfo";
	}

	@RequestMapping(value = "/mypoint")
	public String myPoint() {
		return "/user/myPoint";
	}

	// guide
	@RequestMapping(value = "/return_guide")
	public String canclePinfo() {
		return "/user/returnGuide";
	}

	@RequestMapping(value = "/together_guide")
	public String togetherInfo() {
		return "/user/togetherGuide";
	}

}
