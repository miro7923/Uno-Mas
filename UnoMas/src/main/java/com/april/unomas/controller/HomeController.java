package com.april.unomas.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		model.addAttribute("readcntList2", productService.readcntSelect2());
		model.addAttribute("sellcntList2", productService.sellcntSelect2());
		model.addAttribute("brandnewList2", productService.brandnewSelect2());
		model.addAttribute("readcntList", productService.readcntSelect());
		model.addAttribute("sellcntList", productService.sellcntSelect());
		model.addAttribute("brandnewList", productService.brandnewSelect());
		
		return "index";
		
	}
	
	
	@RequestMapping(value = "/index")
	public String index(Model model) throws Exception {
		
		model.addAttribute("readcntList2", productService.readcntSelect2());
		model.addAttribute("sellcntList2", productService.sellcntSelect2());
		model.addAttribute("brandnewList2", productService.brandnewSelect2());
		model.addAttribute("readcntList", productService.readcntSelect());
		model.addAttribute("sellcntList", productService.sellcntSelect());
		model.addAttribute("brandnewList", productService.brandnewSelect());
		
		return "index";
	}
	
	// ajax로 장바구니에 물건 담기
	@Inject
	private ProductService service;
	
	@ResponseBody
	@RequestMapping(value = "/index/insert_cart", method = RequestMethod.GET)
	public void insertCartPOST(@RequestParam("user_num") int user_num, 
			@RequestParam("prod_num") int prod_num, @RequestParam("prod_amount") int prod_amount) throws Exception {
		if (service.getProdInCart(user_num, prod_num) == null) {
			// 없는 상품이면 필드 새로 생성
			service.insertCart(user_num, prod_num, prod_amount);
		}
		else {
			// 장바구니에 있는 상품이면 수량 증가
			service.modifyCartAmount(user_num, prod_num, prod_amount);
		}
	}
}
