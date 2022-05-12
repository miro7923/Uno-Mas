package com.april.unomas.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.april.unomas.domain.WishVO;
import com.april.unomas.service.WishService;

@Controller
@RequestMapping("/product/*")
public class WishController {

	@Inject
	 private WishService service;

	
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
	
		List<WishVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

}
