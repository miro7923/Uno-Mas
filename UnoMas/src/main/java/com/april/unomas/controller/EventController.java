package com.april.unomas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.april.unomas.service.ProductService;

@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	ProductService service;
	
	@RequestMapping(value="/may", method = RequestMethod.GET)
	public String may(Model model) throws Exception {
		
		model.addAttribute("beefList", service.mayEvent());
		
		return "event/mayEvent";
	}
}
