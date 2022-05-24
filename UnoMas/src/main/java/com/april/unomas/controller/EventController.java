package com.april.unomas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/event")
public class EventController {

	
	@RequestMapping(value="/may", method = RequestMethod.GET)
	public String may(Model model) throws Exception {
		
		return "event/mayEvent";
	}
}
