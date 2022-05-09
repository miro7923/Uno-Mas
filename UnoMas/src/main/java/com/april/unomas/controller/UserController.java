package com.april.unomas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	// user
	@RequestMapping(value = "/login")
	public String login() {
		return "user/login";
	}
	@RequestMapping(value = "/register")
	public String register() {
		return "user/register";
	}
	@RequestMapping(value = "/register_agree")
	public String registerAgree() {
		return "user/registerAgree";
	}
	@RequestMapping(value = "/delete_user")
	public String delUSer() {
		return "user/deleteUser";
	}
	
	
	// find
	@RequestMapping(value = "/find_id")
	public String findID() {
		return "user/findID";
	}
	@RequestMapping(value = "/find_pw")
	public String findPW() {
		return "user/findPW";
	}
	@RequestMapping(value = "/change_pw")
	public String changePW() {
		return "user/changePW";
	}
	
	
	// mypage
	@RequestMapping(value = "/mypage")
	public String mypage() {
		return "user/myPage";
	}
	@RequestMapping(value = "/myInfo")
	public String myInfo() {
		return "user/myInfo";
	}
	@RequestMapping(value = "/update_myInfo")
	public String myInfoUpdate() {
		return "user/updateMyInfo";
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
