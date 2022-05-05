package com.april.unomas;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.april.unomas.service.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductAjaxController {

	@Inject
	private ProductService service;
	
	private static final Logger log = LoggerFactory.getLogger(ProductAjaxController.class);
	
	@RequestMapping(value = "/insert_cart", method = RequestMethod.GET)
	public void insertCartPOST(HttpServletRequest request) throws Exception {
		log.info("insertCartPOST() 호출");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int prod_amount = Integer.parseInt(request.getParameter("prod_amount"));
		
		service.insertCart(user_num, prod_num, prod_amount);
	}
}
