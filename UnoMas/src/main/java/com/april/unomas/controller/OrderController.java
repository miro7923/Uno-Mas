package com.april.unomas.controller;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.unomas.domain.CartVO;
import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;
import com.april.unomas.service.CartService;
import com.april.unomas.service.OrderService;
import com.april.unomas.service.UserService;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@Inject
	private CartService cartService;
	
	@Inject
	private UserService userService;
	
	@Inject
	private OrderService orderService;
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderGET() {
		return "order/order";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String orderPOST(HttpServletRequest request, HttpSession session, Model model) throws NumberFormatException, Exception {
		String[] selectedItems = request.getParameter("selectedItems").split(" ");
		List<CartVO> orderList = new ArrayList<CartVO>();
		for (int i = 0; i < selectedItems.length; i++) {
			orderList.add(cartService.getSelectedItem(Integer.parseInt(selectedItems[i])));
		}
		
		// 주문 상품 목록
		model.addAttribute("orderList", orderList);
		
		// 상품 합계
		model.addAttribute("subTotal", Integer.parseInt(request.getParameter("subTotal")));
		
		// 배송비
		model.addAttribute("shippingFee", Integer.parseInt(request.getParameter("shippingFee")));
		
		// 총 금액
		model.addAttribute("total", Integer.parseInt(request.getParameter("total")));
		
		// 회원 정보
		model.addAttribute("userVO", userService.getUserInfo((String)session.getAttribute("saveID")));
		
		// 회원의 주소북 목록
		int user_num = (int) session.getAttribute("saveNUM");
		List<OrderAddrVO> orderAddrList = orderService.getOrderAddrList(user_num);
		model.addAttribute("orderAddrList", orderAddrList);
		
		// 회원의 기본배송지 
		for (int i = 0; i < orderAddrList.size(); i++) {
			if (orderAddrList.get(i).isAddr_primary())
				model.addAttribute("primaryAddr", orderAddrList.get(i));
		}
		
		// 결제 API에 사용할 용도로 주문번호를 미리 만들어 전송한다.
		model.addAttribute("order_code", orderService.getLastOrderNum());
		
		return "order/order";
	}
	
	@RequestMapping(value = "/purchase", method = RequestMethod.GET)
	public String purchaseGet() {
		return "order/purchase";
	}
	
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String completeGET() {
		// 결제완료 페이지로 이동
		return "order/complete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public ResponseEntity completePOST(@RequestBody OrderVO vo) throws Exception {
		// 결제 완료된 주문정보 DB에 저장
		orderService.createOrder(vo);
		
		// 적립금 업데이트
		userService.updatePoint((int)Math.floor(vo.getUser_point()));
		
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String checkGet() {
		return "order/check";
	}
}
