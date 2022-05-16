package com.april.unomas.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.april.unomas.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("readcntList", productService.readcntSelect());
		model.addAttribute("sellcntList", productService.sellcntSelect());
		
		return "index";
		
	}
	
	
	@RequestMapping(value = "/index")
	public String index(Model model) throws Exception {
		
		model.addAttribute("readcntList", productService.readcntSelect());
		model.addAttribute("sellcntList", productService.sellcntSelect());
		
		return "index";
	}
}
