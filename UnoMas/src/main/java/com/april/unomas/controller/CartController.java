package com.april.unomas.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.april.unomas.domain.CartVO;
import com.april.unomas.service.CartService;

@Controller
@RequestMapping("/product/cart/*")
public class CartController {
	
	@Inject
	CartService cartService;
	
	// 장바구니 담기
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute CartVO vo,HttpSession session) {
		
		//로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인

        Integer user_num=(Integer)session.getAttribute("user_num");
        vo.setUser_num(user_num);
        // 장바구니에 기존 상품 있는지 검사
        int count = cartService.countCart(vo.getProd_num(),user_num);
        if(count==0) { // 없으면 insert
        	cartService.insert(vo); 
        } else { // 있으면 update
        	cartService.updateCart(vo);
        }
        return "redirect:/products/cart/list.do"; // 장바구니 목록으로 이동
	}
	
	// 장바구니 목록
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		Map<String, Object> map=new HashMap<String, Object>();
	 
	    Integer user_num=(Integer)session.getAttribute("user_num");
	        	
	        List<CartVO> list=cartService.listCart(user_num);  // 장바구니 목록
	        int sumMoney=cartService.sumMoney(user_num);  // 총 상품가격
	        int fee=sumMoney >= 50000 ? 0 : 2500; // 배송비 계산
	 
	 
	        map.put("list", list); // 장바구니 정보를 map에 저장
	        map.put("count", list.size()); // 장바구니 상품의 유무
	        map.put("sumMoney", sumMoney); // 장바구니 전체 금액
	        map.put("fee", fee); // 배송료
	        map.put("sum", sumMoney+fee); // 총 결제 예상금액(장바구니+배송비)
	 
	        // ModelAndView mav에 이동할 페이지의 이름과 데이터를 저장한다.
	        mav.setViewName("product/shopping-cart"); // 이동할 페이지의 이름
	        mav.addObject("map", map); // map변수 저장
	 
	        return mav; // 화면 이동
	 
	        
	 }
	 
	 // 장바구니 단품 삭제
	 @RequestMapping("delete.do")
	 public String delete(@RequestParam int cart_num) {
	        cartService.delete(cart_num);
	        return "redirect:/product/cart/list.do";
	 }
	 
	// 장바구니 비우기
	@RequestMapping("deleteAll.do")
	   public String deleteAll(HttpSession session) {
	       Integer user_num=(Integer)session.getAttribute("user_num");
	       if(user_num!=null) {
	           cartService.deleteAll(user_num);
	       }
	       return "redirect:/product/cart/list.do";
	}
	 
	// 장바구니 수정
	@RequestMapping("update.do")
		public String update(@RequestParam int[] prod_amount, @RequestParam int[] prod_num, HttpSession session) {
			// session의 id
			Integer user_num=(Integer)session.getAttribute("user_num");
			// 레코드의 갯수 만큼 반복문 실행
			for(int i=0; i<prod_num.length; i++){
				CartVO vo = new CartVO();
				vo.setUser_num(user_num);
				vo.setProd_amount(prod_amount[i]);
				vo.setProd_num(prod_num[i]);
				cartService.modifyCart(vo);
			}
			
			return "redirect:/product/cart/list.do";
	}
}
