package com.april.unomas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderGet() {
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
