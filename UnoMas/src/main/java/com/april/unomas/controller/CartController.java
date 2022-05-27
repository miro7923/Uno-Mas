package com.april.unomas.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.unomas.domain.CartVO;
import com.april.unomas.domain.UserVO;
import com.april.unomas.service.CartService;

@Controller
@RequestMapping("/product/cart/*")
public class CartController {
	
	@Inject
	private CartService cartService;
	
	private static final Logger log = LoggerFactory.getLogger(CartController.class);
	
	// 장바구니 담기
	@RequestMapping("insert")
	public String insert(@ModelAttribute CartVO vo,HttpSession session) {
		
		//로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인

		UserVO uvo = (UserVO)session.getAttribute("saveID");
	    int user_num= uvo.getUser_num();
        vo.setUser_num(user_num);
        // 장바구니에 기존 상품 있는지 검사
        int count = cartService.countCart(vo.getProd_num(),user_num);
        log.info("**count : "+count);
        if(count==0) { // 없으면 insert
        	cartService.insert(vo); 
        }
        return "redirect:/product/cart/list"; // 장바구니 목록으로 이동
	}
	
	// 장바구니 목록

		@RequestMapping(value = "list", method = RequestMethod.GET)
		public String listGET(HttpSession session, Model model) {
		    int user_num = (int) session.getAttribute("saveNUM");
		        	
	        List<CartVO> list = cartService.listCart(user_num);  // 장바구니 목록
	        int sumMoney = cartService.sumMoney(user_num);  // 총 상품가격
	        int fee = sumMoney >= 50000 ? 0 : 2500; // 배송비 계산
	 
	        model.addAttribute("list", list); // 장바구니 정보를 map에 저장
	        model.addAttribute("sumMoney", sumMoney); // 장바구니 전체 금액
	        model.addAttribute("fee", fee); // 배송료
	        model.addAttribute("sum", sumMoney+fee); // 총 결제 예상금액(장바구니+배송비)
	        
	        return "product/shopping-cart"; // 화면 이동
		 }
	
	 // 장바구니 단품 삭제
	 @RequestMapping("delete")
	 public String delete(@RequestParam int cart_num) {
	        cartService.delete(cart_num);
	        return "redirect:/product/cart/list";
	 }
	 
	// 장바구니 비우기
	@RequestMapping("deleteAll")
	   public String deleteAll(HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("saveID");
	    int user_num= vo.getUser_num();
	    if(user_num!=0) {
	    	cartService.deleteAll(user_num);
	    }
	    return "redirect:/product/cart/list";
	}
	 
	// 장바구니 수정
	@RequestMapping("updateCart")
	public String update(@RequestParam int[] prod_amount, @RequestParam int[] prod_num, HttpSession session) {
		// session의 id
	    int user_num= (int)session.getAttribute("saveNUM");
		// 레코드의 갯수 만큼 반복문 실행
		for(int i=0; i<prod_num.length; i++){
			CartVO cart = new CartVO();
			cart.setUser_num(user_num);
			cart.setProd_amount(prod_amount[i]);
			cart.setProd_num(prod_num[i]);
			cartService.modifyCart(cart);
		}
		
		return "redirect:/product/cart/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/quantity", method = RequestMethod.GET)
	public String updateCartGET(@RequestParam("cart_num") int cart_num, 
			@RequestParam("prod_amount") int prod_amount, @RequestParam("prod_num") int prod_num, 
			HttpSession session) {
		CartVO vo = new CartVO();
		vo.setUser_num((Integer) session.getAttribute("saveNUM"));
		vo.setCart_num(cart_num);
		vo.setProd_amount(prod_amount);
		vo.setProd_num(prod_num);
		
		cartService.modifyCart(vo);
		
		return "complete";
	}
}
