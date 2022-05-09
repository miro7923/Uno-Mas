package com.april.unomas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	// customerCenter
	@RequestMapping(value = "/contact")
	public String contact() {
		return "board/contact";
	}
	@RequestMapping(value = "/faq")
	public String faq() {
		return "board/faq";
	}
}
