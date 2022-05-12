package com.april.unomas.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.april.unomas.service.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductAjaxController {

	@Inject
	private ProductService service;
	
	private static final Logger log = LoggerFactory.getLogger(ProductAjaxController.class);
	
	// ajax로 장바구니에 물건 담기
	@RequestMapping(value = "/insert_cart", method = RequestMethod.GET)
	public void insertCartPOST(HttpServletRequest request) throws Exception {
		log.info("insertCartPOST() 호출");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int prod_amount = Integer.parseInt(request.getParameter("prod_amount"));
		
		service.insertCart(user_num, prod_num, prod_amount);
	}
	
	@RequestMapping(value = "/update_readcnt", method = RequestMethod.GET)
	public int updateReviewReadcntGET(@RequestParam int review_num, @RequestParam int prod_num,
			Model model) throws Exception {
		service.updateReviewReadcnt(review_num);
		
		return service.getReviewReadCnt(review_num);
	}
}
