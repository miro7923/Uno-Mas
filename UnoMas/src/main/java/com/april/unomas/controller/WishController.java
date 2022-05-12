package com.april.unomas.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.april.unomas.domain.WishVO;
import com.april.unomas.service.WishService;

@Controller
@RequestMapping("/product/*")
public class WishController {

	@Inject
	 private WishService service;

	// 찜 목록
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
	
		List<WishVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
	}
	
	// 찜 추가
	@RequestMapping(value = "/wishlist/insertwish", method = RequestMethod.GET)
	public void getInsertWish() throws Exception {
		
	}
	
	// 찜 개별 삭제
	@RequestMapping(value = "/wishlist/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("prod_num") int prod_num) throws Exception {
	  
	 service.delete(prod_num);  

	 return "redirect:/product/wishlist";
	}

}
