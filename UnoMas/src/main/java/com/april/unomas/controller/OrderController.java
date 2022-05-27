package com.april.unomas.controller;


import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
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
import com.april.unomas.domain.PayVO;
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
		
		ProdCriteria cri = new ProdCriteria();
		cri.setPage(1);
		cri.setPerPageNum(5);
		
		// 회원의 주소북 목록
		int user_num = (int) session.getAttribute("saveNUM");
		List<OrderAddrVO> orderAddrList = orderService.getOrderAddrList(user_num, cri.getPageStart(), cri.getPerPageNum());
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
	public String completeGET(@RequestParam int pay_num, Model model) throws Exception {
		PayVO payVO = orderService.getPay(pay_num);
		model.addAttribute("payVO", payVO);
		
		// 주문정보 가져오기
		List<OrderVO> orderList = orderService.getOrderInfos(payVO.getOrder_code());
		model.addAttribute("orderList", orderList);
		
		// 장바구니에서 결제 완료된 상품 삭제 & 재고감소
		for (int i = 0; i < orderList.size(); i++) {
			cartService.deleteByUserNum(orderList.get(i).getUser_num(), orderList.get(i).getProd_num());
			productService.decreaseStock(orderList.get(i).getOrder_quantity(), orderList.get(i).getProd_num());
		}
		
		// 썸네일 목록 가져오기
		List<String> prodThumbList = new ArrayList<String>();
		for (int i = 0; i < orderList.size(); i++) {
			ProductVO product = productService.getProduct(orderList.get(i).getProd_num());
			prodThumbList.add(product.getProd_image3());
		}
		
		model.addAttribute("prodThumbList", prodThumbList);
		
		// 회원정보 저장
		UserVO userVO = userService.getUserInfoByNum(payVO.getUser_num());
		model.addAttribute("userVO", userVO);
		
		// 결제완료 페이지로 이동
		return "order/complete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public ResponseEntity<String> completePOST(@RequestBody OrderVO vo) throws Exception {
		// 결제 완료된 주문정보 DB에 저장
		orderService.createOrder(vo);
		
		return new ResponseEntity<String>("주문정보 생성 완료", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/mobile_complete", method = RequestMethod.GET)
	public String completeMobileGET(@RequestParam double amount, @RequestParam int ship,
			@RequestParam(required = false) String imp_uid, 
			@RequestParam(required = false) String merchant_uid, Model model, HttpSession session) throws Exception {
//		IamportResponse<AccessToken> token = client.getAuth();
		IamportResponse<Payment> result = client.paymentByImpUid(imp_uid);
		if (result.getResponse().getAmount().compareTo(BigDecimal.valueOf(amount)) == 0) {
			
			// 결제 정보 저장
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
			
			// 장바구니에서 결제 완료된 상품 삭제하기 위해 주문정보 가져오기
			List<OrderVO> orderVO = orderService.getOrderInfos(payVO.getOrder_code());
			// 가져온 주문정보로 카트번호 가져와서 삭제
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
			
		// 결제 정보 저장
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
		
		// 방금 생성된 결제 정보의 인덱스 번호 가져옴 
		payVO = orderService.getLastPay();
		model.addAttribute("payVO", payVO);
		
		// 회원 적립금 추가
		userService.updatePoint((int)session.getAttribute("saveNUM"), (int)point);
		
		
		return new ResponseEntity<Integer>(payVO.getPay_num(), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String checkGet() {
		return "order/check";
	}
	
	@RequestMapping(value = "/addr_book", method = RequestMethod.GET)
	public String addrBookGET(@RequestParam int user_num, @RequestParam int pageNum, Model model) throws Exception {
		ProdCriteria cri = new ProdCriteria();
		cri.setPage(pageNum);
		cri.setPerPageNum(5);
		
		List<OrderAddrVO> orderAddrList = orderService.getOrderAddrList(user_num, cri.getPageStart(), cri.getPerPageNum());

		// 첫번째 페이지일 때만 기본 배송지 정보 저장
		if (pageNum == 1) {
			for (int i = 0; i < orderAddrList.size(); i++) {
				// 회원의 기본 배송지 따로 저장
				if (orderAddrList.get(i).isAddr_primary()) {
					model.addAttribute("primaryAddr", orderAddrList.get(i));
					orderAddrList.remove(i);
				}
			}
		}

		// 배송지 목록 페이지처리 정보 저장
		ProdPageMaker pm = new ProdPageMaker();
		pm.setCri(cri);
		pm.setTotalCnt(orderService.getOrderAddrCnt(user_num));
		
		model.addAttribute("pm", pm);
		model.addAttribute("curPage", pageNum);
		
		// 회원의 전체 배송지 목록 저장
		model.addAttribute("orderAddrList", orderAddrList);
		
		// 페이지 번호가 1보다 크면 다음페이지를 보여달라는 것임
		// 새 목록을 임시페이지로 내보낸 뒤 임시페이지의 주소를 리턴한다.
		// ajax에서 임시페이지에 출력되어 있는 새 게시판 목록을 원본 페이지로 가져와서 바꾼다.
		if (pageNum > 1) {
			return "order/shippingLocationAjax";
		}
		else {
			// 페이지 번호가 1이면 첫번째 페이지를 보여주면 되니까 원본 페이지로 이동
			return "order/shippingLocation";
		}
	}
}
