package com.april.unomas.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.april.unomas.domain.UserVO;
import com.april.unomas.domain.WishVO;
import com.april.unomas.service.WishService;

@Controller
@RequestMapping("/product/wishlist/*")
public class WishController {

	@Inject
	private WishService service;

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	// 찜 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
	 
		UserVO vo = (UserVO)session.getAttribute("saveID");
	    int user_num= vo.getUser_num();
	        	
	        List<WishVO> list=service.list(user_num);  // 장바구니 목록
	 
	        map.put("list", list); // 장바구니 정보를 map에 저장
	        map.put("count", list.size()); // 장바구니 상품의 유무
	 
	        // ModelAndView mav에 이동할 페이지의 이름과 데이터를 저장한다.
	        mav.setViewName("product/wishlist"); // 이동할 페이지의 이름
	        mav.addObject("map", map); // map변수 저장
	 
	        return mav; // 화면 이동
	}
	// 찜 추가
	@RequestMapping(value = "/insertwish", method = RequestMethod.GET)
	public void getInsertWish() throws Exception {
		
	}
	
	// 찜 X삭제 버튼
	@RequestMapping(value = "/deleteWish", method = RequestMethod.GET)
	public String getDeleteWish(@RequestParam("wish_num") int wish_num) throws Exception {
	  
		service.deleteWish(wish_num);  

		return "redirect:/product/wishlist/list";
	}
	// 찜 선택 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCheckWish", method = RequestMethod.POST)
	public int postDeleteCheckWish(HttpSession session,
	    @RequestParam(value = "chbox[]") List<String> chArr, WishVO wish) throws Exception {
	 UserVO user = (UserVO)session.getAttribute("saveID");
	 int user_num = user.getUser_num();
	 
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
	
	// 장바구니 선택 담기
	@ResponseBody
	@RequestMapping(value = "/insertCheckWish", method = RequestMethod.POST)
	public int postInsertCheckWish(HttpSession session,
			@RequestParam(value = "chbox[]") List<String> chArr, WishVO wish) throws Exception {
		UserVO user = (UserVO)session.getAttribute("saveID");
		int user_num = user.getUser_num();
		
		int result = 0;
		int prod_num = 0;
		
		
		if(user != null) {
			wish.setUser_num(user_num);
			
			for(String i : chArr) {   
				prod_num = Integer.parseInt(i);
				wish.setProd_num(prod_num);
				service.insertCheckWish(wish);
			}   
			result = 1;
		}  
		return result;  
	}
	
		
	// 찜 전체 삭제
	@RequestMapping(value = "/deleteAllWish", method = RequestMethod.GET)
	public String deleteAll(HttpSession session) throws Exception {
		UserVO vo = (UserVO)session.getAttribute("saveID");
	    int user_num= vo.getUser_num();
		if(user_num!=0) {
			service.deleteAllWish(user_num);
		}
	    return "redirect:/product/wishlist/list";
	}
	
	// 장바구니 단품 담기
	@RequestMapping(value = "/insert_cart", method = RequestMethod.GET)
	public void insertCartPOST(HttpServletRequest request) throws Exception {
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int prod_amount = Integer.parseInt(request.getParameter("prod_amount"));

		service.insertCart(user_num, prod_num, prod_amount);
	}
}
