package com.april.unomas.controller;

import java.util.HashMap;
import java.util.List;
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
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {
		return "/user/login";
	}

	// 로그인 페이지 구현 (POST)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String loginPOST(UserVO vo, HttpSession session) {

		HashMap loginMap = service.loginUser(vo);

		String result = String.valueOf(loginMap.get("result"));
		if (result.equals("1")) {
			session.setAttribute("saveID", vo.getUser_id());
			session.setAttribute("saveNUM", loginMap.get("num"));
		}

		return result;
	}

	// 로그아웃 구현
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		session.invalidate();

		return "redirect:/index";
	}

	// 회원탈퇴(GET)
	@RequestMapping(value = "/delete_user", method = RequestMethod.GET)
	public String deleteUserGET() {
		return "/user/deleteUser";
	}

	// 회원탈퇴(POST)
	@RequestMapping(value = "/delete_user", method = RequestMethod.POST)
	public String deleteUserPOST(UserVO vo, HttpSession session) {
		service.deleteUser(vo);

		session.invalidate();

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

	// 마이페이지
	@RequestMapping(value = "/mypage")
	public String mypage() {
		return "/user/myPage";
	}

	// 회원정보 조회
	@RequestMapping(value = "/myInfo")
	public String myInfo(HttpSession session, Model model) {

		String saveID = (String) session.getAttribute("saveID");
		UserVO userInfoVO = service.getUserInfo(saveID); // 일단 직접 입력하고 추 후에 세션값 입력.

		model.addAttribute("userInfoVO", userInfoVO);

		return "/user/myInfo";
	}

	// 회원정보수정(GET)
	@RequestMapping(value = "/update_myInfo", method = RequestMethod.GET)
	public String myInfoUpdateGET(HttpSession session, Model model) {

		String saveID = (String) session.getAttribute("saveID");
		System.out.println("update_myInfo : "+ saveID);
		UserVO userInfoVO = service.getUserInfo(saveID);
		model.addAttribute("userInfoVO", userInfoVO);
		
		Integer saveNUM = (Integer) session.getAttribute("saveNUM");
		List<UserVO> addAddrList = service.getAddAddr(saveNUM);
		System.out.println("addAddrList: "+addAddrList.size());
		model.addAttribute("addAddrList", addAddrList);
		
		return "/user/updateMyInfo";
	}

	// 회원정보수정(POST)
	@RequestMapping(value = "/update_myInfo", method = RequestMethod.POST)
	public String myInfoUpdatePOST(UserVO vo, @RequestParam("emailAgree") String eAgree) {
		if (eAgree.equals("1")) {
			vo.setUser_emailagree(1);
		} 

		service.updateUser(vo);
		service.updateAddAddr(vo);

		log.info("수정완료");

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

	// 비번체크
	@RequestMapping(value = "/check_pw", method = RequestMethod.GET)
	public String pwCheck(HttpSession session, Model model) {
		System.out.println("check_pw GET");
		
		String saveID = (String) session.getAttribute("saveID");
		System.out.println("update_myInfo : "+ saveID);
		UserVO userInfoVO = service.getUserInfo(saveID);
		model.addAttribute("userInfoVO", userInfoVO);
		
		return "/user/checkPW";
	}

	// 비번체크
	@RequestMapping(value = "/check_pw", method = RequestMethod.POST)
	@ResponseBody
	public String pwCheck(UserVO vo) {
		return Integer.toString(service.checkPW(vo));
	}

	// 주문 상세보기 페이지
	@RequestMapping(value = "/my_order_detail", method = RequestMethod.GET)
	public String orderDetail() {
		return "/user/myOrderDetail";
	}
}
