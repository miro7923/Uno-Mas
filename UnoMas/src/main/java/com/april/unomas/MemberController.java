package com.april.unomas;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	// member
	@RequestMapping(value = "/login")
	public String login() {
		return "member/login";
	}
	@RequestMapping(value = "/register")
	public String register() {
		return "member/register";
	}
}
