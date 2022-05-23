package com.april.unomas.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.april.unomas.domain.CartVO;

@Controller
public class OrderController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderGET() {
		return "order/order";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String orderPOST(CartVO vo, Model model) {
		model.addAttribute("vo", vo);
		
		return "order/order";
	}
	
	@RequestMapping(value = "/order/purchase", method = RequestMethod.GET)
	public String purchaseGet() {
		return "order/purchase";
	}
	@RequestMapping(value = "/order/complete", method = RequestMethod.GET)
	public String completeGet() {
		return "order/complete";
	}
	@RequestMapping(value = "/order/check", method = RequestMethod.GET)
	public String checkGet() {
		return "order/check";
	}
}
