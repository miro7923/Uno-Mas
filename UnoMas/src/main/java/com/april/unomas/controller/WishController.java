package com.april.unomas.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.unomas.domain.UserVO;
import com.april.unomas.domain.WishVO;
import com.april.unomas.service.WishService;

@Controller
@RequestMapping("/product/*")
public class WishController {

	@Inject
	private WishService service;

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
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
	
	// 찜 X삭제 버튼
	@RequestMapping(value = "/wishlist/deleteWish", method = RequestMethod.GET)
	public String getDeleteWish(@RequestParam("prod_num") int prod_num) throws Exception {
	  
		service.deleteWish(prod_num);  

		return "redirect:/product/wishlist";
	}
	// 찜 선택 삭제
	@ResponseBody
	@RequestMapping(value = "/wishlist/deleteCheckWish", method = RequestMethod.POST)
	public int postDeleteCheckWish(HttpSession session,
	    @RequestParam(value = "chbox[]") List<String> chArr, WishVO wish) throws Exception {
		log.info("찜 선택 삭제");
	 
	 UserVO user = (UserVO)session.getAttribute("user");
	 Integer user_num = user.getUser_num();
	 
	 int result = 0;
	 int wish_num = 0;
	 
	 
	 if(user != null) {
	 wish.setUser_num(user_num);
	  
		 for(String i : chArr) {   
			  wish_num = Integer.parseInt(i);
			  wish.setWish_num(wish_num);
			  service.deleteCheckWish(wish);
		 }   
	result = 1;
	}  
	return result;  
	}
	
		
	// 찜 전체 삭제
	@RequestMapping(value = "/wishlist/deleteAllWish", method = RequestMethod.GET)
	public String deleteAll(HttpSession session) throws Exception {
		Integer user_num=(Integer)session.getAttribute("user_num");
		if(user_num!=null) {
			service.deleteAllWish(user_num);
		}
	    return "redirect:/product/wishlist";
	}
	
}
