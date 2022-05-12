package com.april.unomas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/product/wishlist/*")
public class WishController {

	@RequestMapping(value="/getWishlist", method=RequestMethod.GET)
	public void getWishlist() throws Exception {
		
	}
	
	@RequestMapping(value="/wishtest")
	public String list() throws Exception {
		return "product/wishtest";
	}
}
