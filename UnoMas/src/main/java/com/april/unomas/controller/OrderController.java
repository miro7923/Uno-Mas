package com.april.unomas.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
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

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.unomas.domain.CartVO;
import com.april.unomas.domain.OrderAddrVO;
import com.april.unomas.domain.OrderVO;

import com.april.unomas.domain.UserCriteria;
import com.april.unomas.domain.UserPageMaker;
import com.april.unomas.service.CartService;
import com.april.unomas.service.OrderService;
import com.april.unomas.service.UserService;

import com.april.unomas.domain.PayVO;
import com.april.unomas.domain.PointVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProdPageMaker;
import com.april.unomas.domain.ProductVO;
import com.april.unomas.domain.UserVO;
import com.april.unomas.service.CartService;
import com.april.unomas.service.OrderService;
import com.april.unomas.service.ProductService;
import com.april.unomas.service.UserService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


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
	
	@Inject
	private ProductService productService;
	
	private IamportClient client = new IamportClient("5728685660422556", "cc59f3e8d3e9a6cbdfcd57686e110f426580a7d15a5319465a36203e98e5a045b3303f3b0c42b156");
	

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
		
		// ?????? ?????? ??????
		model.addAttribute("orderList", orderList);
		
		// ?????? ??????
		model.addAttribute("subTotal", Integer.parseInt(request.getParameter("subTotal")));
		
		// ?????????
		model.addAttribute("shippingFee", Integer.parseInt(request.getParameter("shippingFee")));
		
		// ??? ??????
		model.addAttribute("total", Integer.parseInt(request.getParameter("total")));
		
		// ?????? ??????
		model.addAttribute("userVO", userService.getUserInfo((String)session.getAttribute("saveID")));
		
		ProdCriteria cri = new ProdCriteria();
		cri.setPage(1);
		cri.setPerPageNum(5);
		
		// ????????? ????????? ??????
		int user_num = (int) session.getAttribute("saveNUM");
		List<OrderAddrVO> orderAddrList = orderService.getOrderAddrList(user_num, cri.getPageStart(), cri.getPerPageNum());
		model.addAttribute("orderAddrList", orderAddrList);
		
		// ????????? ??????????????? 
		for (int i = 0; i < orderAddrList.size(); i++) {
			if (orderAddrList.get(i).isAddr_primary())
				model.addAttribute("primaryAddr", orderAddrList.get(i));
		}
		
		// ?????? API??? ????????? ????????? ??????????????? ?????? ????????? ????????????.
		model.addAttribute("order_code", orderService.getLastOrderNum());
		
		return "order/order";
	}
	
	@RequestMapping(value = "/purchase", method = RequestMethod.GET)
	public String purchaseGet() {
		return "order/purchase";
	}
	
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String completeGET(@RequestParam int pay_num, Model model) throws Exception {
		PayVO payVO = orderService.getPay(pay_num);
		model.addAttribute("payVO", payVO);
		
		// ???????????? ????????????
		List<OrderVO> orderList = orderService.getOrderInfos(payVO.getOrder_code());
		model.addAttribute("orderList", orderList);
		
		// ?????????????????? ?????? ????????? ?????? ?????? & ????????????
		for (int i = 0; i < orderList.size(); i++) {
			cartService.deleteByUserNum(orderList.get(i).getUser_num(), orderList.get(i).getProd_num());
			productService.decreaseStock(orderList.get(i).getOrder_quantity(), orderList.get(i).getProd_num());
		}
		
		// ????????? ?????? ????????????
		List<String> prodThumbList = new ArrayList<String>();
		for (int i = 0; i < orderList.size(); i++) {
			ProductVO product = productService.getProduct(orderList.get(i).getProd_num());
			prodThumbList.add(product.getProd_image3());
		}
		
		model.addAttribute("prodThumbList", prodThumbList);
		
		// ???????????? ??????
		UserVO userVO = userService.getUserInfoByNum(payVO.getUser_num());
		model.addAttribute("userVO", userVO);
		

		// ???????????? ???????????? ??????
		return "order/complete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public ResponseEntity<Integer> completePOST(@RequestBody OrderVO vo) throws Exception {
		// ?????? ????????? ???????????? DB??? ??????
		int result = orderService.createOrder(vo);
		
		if (result == 0) {
			return new ResponseEntity<Integer>(0, HttpStatus.NOT_ACCEPTABLE);
		}
		
		return new ResponseEntity<Integer>(1, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/mobile_complete", method = RequestMethod.GET)
	public String completeMobileGET(@RequestParam double amount, @RequestParam int ship,
			@RequestParam(required = false) String imp_uid, 
			@RequestParam(required = false) String merchant_uid, Model model, HttpSession session) throws Exception {
//		IamportResponse<AccessToken> token = client.getAuth();
		IamportResponse<Payment> result = client.paymentByImpUid(imp_uid);
		if (result.getResponse().getAmount().compareTo(BigDecimal.valueOf(amount)) == 0) {
			
			// ?????? ?????? ??????
			PayVO payVO = new PayVO();
			payVO.setOrder_code(Integer.parseInt(result.getResponse().getMerchantUid()));
			payVO.setPay_card_company(result.getResponse().getCardName());
			payVO.setPay_card_num(result.getResponse().getCardNumber());
			payVO.setPay_installment(result.getResponse().getCardQuota());
			payVO.setPay_method(result.getResponse().getPayMethod());
			payVO.setPay_num(Integer.parseInt(result.getResponse().getMerchantUid()));
			payVO.setPay_shippingfee(ship);
			payVO.setPay_total_price(result.getResponse().getAmount().intValue());
			payVO.setUser_num((int) session.getAttribute("saveNUM"));
			
			orderService.createPay(payVO);
			
			model.addAttribute("payVO", payVO);
			
			// ?????????????????? ?????? ????????? ?????? ???????????? ?????? ???????????? ????????????
			List<OrderVO> orderVO = orderService.getOrderInfos(payVO.getOrder_code());
			// ????????? ??????????????? ???????????? ???????????? ??????
			for (int i = 0; i < orderVO.size(); i++) {
				CartVO cartVO = cartService.getSelectedItem(orderVO.get(i).getCart_num());
				cartService.delete(cartVO.getCart_num());
			}
		}

		return "order/complete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/verify_iamport/{imp_uid}", method = RequestMethod.POST)
	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		 return client.paymentByImpUid(imp_uid);
	}
	
	@RequestMapping(value = "/pay_info", method = RequestMethod.GET)
	public ResponseEntity<Integer> payInfoPOST(Model model,
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam String imp_uid, @RequestParam int amount,
			@RequestParam int ship, @RequestParam double point, HttpSession session) throws Exception {
		
		IamportResponse<Payment> result = client.paymentByImpUid(imp_uid);
			
		// ?????? ?????? ??????
		PayVO payVO = new PayVO();
		payVO.setOrder_code(Integer.parseInt(result.getResponse().getMerchantUid()));
		payVO.setPay_card_company(result.getResponse().getCardName());
		payVO.setPay_card_num(result.getResponse().getCardNumber());
		payVO.setPay_installment(result.getResponse().getCardQuota());
		payVO.setPay_method(result.getResponse().getPayMethod());
		payVO.setPay_num(Integer.parseInt(result.getResponse().getMerchantUid()));
		payVO.setPay_shippingfee(ship);
		payVO.setPay_total_price(result.getResponse().getAmount().intValue());
		payVO.setUser_num((int) session.getAttribute("saveNUM"));
		
		orderService.createPay(payVO);
		
		// ?????? ????????? ?????? ????????? ????????? ?????? ????????? 
		payVO = orderService.getLastPay();
		model.addAttribute("payVO", payVO);
		
		// ?????? ????????? ??????
		userService.updatePoint((int)session.getAttribute("saveNUM"), (int)point);
		
		// ????????? ???????????? ?????? ??????
		PointVO pointVO = new PointVO();
		pointVO.setOrder_code(payVO.getOrder_code());
		pointVO.setPoint_content("??????");
		pointVO.setPoint_cost((int)point);
		pointVO.setUser_num((int)session.getAttribute("saveNUM"));
		
		orderService.createPointInfo(pointVO);
		
		return new ResponseEntity<Integer>(payVO.getPay_num(), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String checkGet() {
		return "order/check";
	}
	

	
	// ??????????????? - ?????? ??????
	@RequestMapping(value = "/my_order")
	public String myOrder(HttpSession session, Model model,
			@RequestParam(value = "pagingNum", required = false, defaultValue = "1") String pagingNum) throws Exception{

		String saveNUM = String.valueOf(session.getAttribute("saveNUM"));
		List<Integer> codeList = orderService.MyOrderCount(saveNUM); 
		
		UserCriteria cri = new UserCriteria();
		cri.setPage(Integer.parseInt(pagingNum));
		cri.setPerPageNum(3);
		
		List<Integer> limitList = new ArrayList<Integer>();
		try {
			limitList = codeList.subList(cri.getPageStart(), cri.getPageStart()+3);
		} catch (Exception e) {
			limitList = codeList.subList(cri.getPageStart(), codeList.size());
		}
		Map<Integer, List> orderMap = orderService.getMyOrderList(saveNUM, limitList);

		UserPageMaker pm = new UserPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(codeList.size());

		model.addAttribute("orderMap", orderMap);
		model.addAttribute("pagingNum", pagingNum);
		model.addAttribute("pm", pm);

		return "order/myOrderList";
	}
	
	
	// ?????? ???????????? ?????????
	@RequestMapping(value = "/order_detail", method = RequestMethod.GET)
	public String orderDetail(HttpSession session, @RequestParam int code, Model model,
			@RequestParam(value = "pagingNum", required = false, defaultValue = "1") String pagingNum) throws Exception {
		String saveNUM = String.valueOf(session.getAttribute("saveNUM"));
//		int code2 = Integer.parseInt(code); 
		
		List<Integer> limitList = new ArrayList<Integer>(Arrays.asList(code));
		Map<Integer, List> orderMap = orderService.getMyOrderList(saveNUM, limitList);
		
		PayVO payInfo = orderService.getPayInfo(code);
		
		model.addAttribute("orderMap", orderMap);
		model.addAttribute("payInfo", payInfo);
		model.addAttribute("pagingNum", pagingNum);
		
		return "order/myOrderDetail";
	}
	

	
	@RequestMapping(value = "/addr_book", method = RequestMethod.GET)
	public String addrBookGET(@RequestParam int user_num, @RequestParam int pageNum, Model model) throws Exception {
		ProdCriteria cri = new ProdCriteria();
		cri.setPage(pageNum);
		cri.setPerPageNum(5);
		
		List<OrderAddrVO> orderAddrList = orderService.getOrderAddrList(user_num, cri.getPageStart(), cri.getPerPageNum());

		// ????????? ???????????? ?????? ?????? ????????? ?????? ??????
		if (pageNum == 1) {
			for (int i = 0; i < orderAddrList.size(); i++) {
				// ????????? ?????? ????????? ?????? ??????
				if (orderAddrList.get(i).isAddr_primary()) {
					model.addAttribute("primaryAddr", orderAddrList.get(i));
					orderAddrList.remove(i);
				}
			}
		}

		// ????????? ?????? ??????????????? ?????? ??????
		ProdPageMaker pm = new ProdPageMaker();
		pm.setCri(cri);
		pm.setTotalCnt(orderService.getOrderAddrCnt(user_num));
		
		model.addAttribute("pm", pm);
		model.addAttribute("curPage", pageNum);
		
		// ????????? ?????? ????????? ?????? ??????
		model.addAttribute("orderAddrList", orderAddrList);
		
		// ????????? ????????? 1?????? ?????? ?????????????????? ??????????????? ??????
		// ??? ????????? ?????????????????? ????????? ??? ?????????????????? ????????? ????????????.
		// ajax?????? ?????????????????? ???????????? ?????? ??? ????????? ????????? ?????? ???????????? ???????????? ?????????.
		if (pageNum > 1) {
			return "order/shippingLocationAjax";
		}
		else {
			// ????????? ????????? 1?????? ????????? ???????????? ???????????? ????????? ?????? ???????????? ??????
			return "order/shippingLocation";
		}

	}
}
