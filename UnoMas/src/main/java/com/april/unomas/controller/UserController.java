package com.april.unomas.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.CartVO;
import com.april.unomas.domain.PointVO;
import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.domain.QnaVO;
import com.april.unomas.domain.UserCriteria;
import com.april.unomas.domain.UserPageMaker;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.UserCriteria;
import com.april.unomas.domain.UserPageMaker;

import com.april.unomas.domain.UserVO;
import com.april.unomas.service.CartService;
import com.april.unomas.service.OrderService;
import com.april.unomas.service.SmsService;
import com.april.unomas.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;
	
	@Inject
	private OrderService orderService;
	
	@Inject
	private CartService cartService;
	
	@Inject
	private SmsService smsService;
	
	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	// 회원가입 이용약관 페이지
	@RequestMapping(value = "/register_agree")
	public String registerAgree() {
		return "user/registerAgree";
	}

	@RequestMapping(value = "/register")
	public String registerGet() {
		return "user/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(@RequestParam(value = "emailAgree", required = false, defaultValue="0") String eAgree, UserVO vo) {
		if (eAgree.equals("1")) {
			vo.setUser_emailagree(1);
		} else {
			vo.setUser_emailagree(0);
		}
		service.joinUser(vo);
		return "redirect:/user/login";

	}
	
	@RequestMapping(value = "/auth_phone")
	@ResponseBody
	public List<Integer> AuthPhoneNumber(String p) {
		List<Integer> resList = smsService.sendSMS(p);
		return resList;
	}

	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public String idCheck(UserVO vo) {
		return Integer.toString(service.idCheck(vo));
	}

	// 로그인 페이지 구현 (GET)
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {
		return "user/login";
	}

	// 로그인 페이지 구현 (POST)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String loginPOST(UserVO vo, HttpSession session) {

		HashMap<String, Integer> loginMap = service.loginUser(vo);

		String result = String.valueOf(loginMap.get("result"));
		if (result.equals("1")) {
			if (vo.getUser_id().contains("admin")) {
				session.setAttribute("saveAID", vo.getUser_id());
				session.setAttribute("saveANUM", loginMap.get("num"));
			} else {
				session.setAttribute("saveID", vo.getUser_id());
				session.setAttribute("saveNUM", loginMap.get("num"));
			}
		}
		return result;
	}

	// 로그아웃 구현
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGET(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/index";
	}

	// 아이디 찾기
	@RequestMapping(value = "/find_id")
	public String findIDGet() {
		return "user/findID";
	}

	// 아이디 찾기(POST)
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	@ResponseBody
	public String findIDPost(UserVO vo) {
		
		String result = Integer.toString(service.findIdProcess(vo));
		
		return result;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw")
	public String findPW() {
		return "user/findPW";
	}

	// 비밀번호 찾기(POST)
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> findPWPost(UserVO vo) {
		
		HashMap<String, String> findpw_map = service.findPwProcess(vo);

		return findpw_map;
	}

	// 비밀번호 변경(GET)
	@RequestMapping(value = "/change_pw")
	public String changePWGet(@RequestParam(value = "id", required = false) String id, Model model) {
		
		model.addAttribute("id", id);
		
		return "user/changePW";
	}

	// 비밀번호 변경(POST)
	@RequestMapping(value = "/change_pw", method = RequestMethod.POST)
	@ResponseBody
	public String changePWPost(UserVO vo) {
		
		String result = Integer.toString(service.changePW(vo));

		return result;
	}

	// 회원정보수정(GET)
	@RequestMapping(value = "/update_myInfo", method = RequestMethod.GET)
	public String myInfoUpdateGET(HttpSession session, Model model) {

		String saveID = (String) session.getAttribute("saveID");
		UserVO userInfoVO = service.getUserInfo(saveID);
		model.addAttribute("userInfoVO", userInfoVO);

		Integer saveNUM = (Integer) session.getAttribute("saveNUM");
		List<UserVO> addAddrList = service.getAddAddr(saveNUM);
		model.addAttribute("addAddrList", addAddrList);

		return "user/updateMyInfo";
	}

	// 회원정보수정(POST)
	@ResponseBody
	@RequestMapping(value = "/update_myInfo", method = RequestMethod.POST)
	public ResponseEntity<Integer> myInfoUpdatePOST(@RequestBody UserVO vo) {

		service.updateUser(vo);
		service.updateAddAddr(vo);

		return new ResponseEntity<Integer>(1, HttpStatus.OK);
	}

	// 비밀번호 확인(GET)
	@RequestMapping(value = "/check_pw", method = RequestMethod.GET)
	public String pwCheck() {
		return "user/checkPW";
	}
	
	// 비밀번호 확인(POST)
	@RequestMapping(value = "/check_pw", method=RequestMethod.POST)
	@ResponseBody
	public String pwCheck(UserVO vo) {
		return Integer.toString(service.checkPW(vo));
	}

	// 마이페이지
	@RequestMapping(value = "/mypage")
	public String mypage(HttpSession session, Model model) throws Exception {
		int saveNUM = (int)session.getAttribute("saveNUM");
		
		List<Integer> codeList = orderService.MyOrderCount(String.valueOf(saveNUM));
		if(codeList.size() > 0) {
			List<Integer> limitList = codeList.subList(0, 3);
			Map<Integer, List> orderMap = orderService.getMyOrderList(String.valueOf(saveNUM), limitList);
			model.addAttribute("orderMap", orderMap);
		}
		
		List<CartVO> list = cartService.listCart(saveNUM);
		System.out.println(" 장바구니 목록: " + list);
		int sumMoney = cartService.sumMoney(saveNUM);  	// 총 상품가격
        int fee = sumMoney >= 50000 ? 0 : 2500; 		// 배송비 계산
        
        if(list.size()>4) {
        	model.addAttribute("list", list.subList(0, 4));
        } else {
        	model.addAttribute("list", list);
        }
        model.addAttribute("sumMoney", sumMoney); 		// 장바구니 전체 금액
        model.addAttribute("fee", fee); 				// 배송료
        model.addAttribute("sum", sumMoney+fee); 		// 총 결제 예상금액(장바구니+배송비)
		
		return "user/myPage";
	}

	
	// 회원정보 조회	
	@RequestMapping(value = "/myInfo")
	public String myInfo(HttpSession session, Model model) {
		
		String saveID = (String) session.getAttribute("saveID");
		UserVO userInfoVO = service.getUserInfo(saveID); 
		model.addAttribute("userInfoVO", userInfoVO);
		
		return "user/myInfo";
	}

	// 포인트 페이지
	@RequestMapping(value = "/mypoint")
	public String myPoint(HttpSession session, Model model, 
			@RequestParam(value="pagingNum", required=false, defaultValue="1") String pagingNum) {
		
		UserCriteria cri = new UserCriteria();
		cri.setPage(Integer.parseInt(pagingNum));
		cri.setPerPageNum(15);
		
		int saveNUM = (int)session.getAttribute("saveNUM");
		int pointCount = service.pointCount(saveNUM);
		
		int userP = service.getUserPoint(saveNUM);
		List<PointVO> pointList = service.getPointList(saveNUM, cri);
		
		UserPageMaker pm = new UserPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(pointCount);
		
		model.addAttribute("userP", userP);
		model.addAttribute("pointList", pointList);
		model.addAttribute("pagingNum", pagingNum);
		model.addAttribute("pm", pm);
		
		return "user/myPoint";
	}
	
	
	// 리뷰 페이지
	@RequestMapping(value = "/my_review")
	public String myReview(HttpSession session, Model model, 
			@RequestParam(value="pagingNum", required=false, defaultValue="1") String pagingNum
			) {
		String saveNUM = String.valueOf(session.getAttribute("saveNUM"));
		int totalReviewCnt = service.myReviewCnt(saveNUM);

		UserCriteria cri = new UserCriteria();
		cri.setPage(Integer.parseInt(pagingNum));
		cri.setPerPageNum(5);
		
		List<BoardReviewVO> reviewList = service.getMyReview(saveNUM, cri);
		
		UserPageMaker pm = new UserPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(totalReviewCnt);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pagingNum", pagingNum);
		model.addAttribute("pm", pm);
		
		return "user/myReview";
	}
	
	
	// 마이페이지 - 상품 문의 내역
	@RequestMapping(value = "/my_prod_qa")
	public String myProdQa(HttpSession session, Model model, 
			@RequestParam(value="pagingNum", required=false, defaultValue="1") String pagingNum
			) {

		String saveNUM = String.valueOf(session.getAttribute("saveNUM"));
		int totalReviewCnt = service.myReviewCnt(saveNUM);

		UserCriteria cri = new UserCriteria();
		cri.setPage(Integer.parseInt(pagingNum));
		cri.setPerPageNum(5);
		
		List<BoardReviewVO> reviewList = service.getMyReview(saveNUM, cri);
		
		UserPageMaker pm = new UserPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(totalReviewCnt);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pagingNum", pagingNum);
		model.addAttribute("pm", pm);
		
		return "user/myProdQuestion";
	}

	// 마이페이지 - 1:1 문의
	@RequestMapping(value = "/my_quesiton")
	public String myQuestion(HttpSession session, Model model,
			@RequestParam(value = "pagingNum", required = false, defaultValue = "1") String pagingNum) {

		String saveNUM = String.valueOf(session.getAttribute("saveNUM"));
		int totalCount = service.MyQuestionCount(saveNUM);

		UserCriteria cri = new UserCriteria();
		cri.setPage(Integer.parseInt(pagingNum));
		cri.setPerPageNum(5);

		List<QnaVO> qnaList = service.getMyQuestion(saveNUM, cri);

		UserPageMaker pm = new UserPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(totalCount);

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pagingNum", pagingNum);
		model.addAttribute("pm", pm);

		return "user/myQuestion";
	}
	
	

	// guide
	@RequestMapping(value = "/return_guide")
	public String cancelPinfo() {
		return "user/returnGuide";
	}

	@RequestMapping(value = "/together_guide")
	public String togetherInfo() {
		return "user/togetherGuide";
	}

	
	// 회원탈퇴(GET)
	@RequestMapping(value = "/delete_user",method=RequestMethod.GET)
	public String deleteUserGET() {
		return "user/deleteUser";
	}
	
	
	// 회원탈퇴(POST)
	@RequestMapping(value = "/delete_user",method=RequestMethod.POST)
	@ResponseBody
	public String deleteUserPOST(UserVO vo, HttpSession session) {
		String totalResult = "0";
		int pwResult = service.checkPW(vo);
		if(pwResult == 1) {	
			String delResult = Integer.toString(service.deleteUser(vo));
			if(delResult.equals("1")) { 
				session.invalidate(); 
				totalResult = delResult;
			} 
		} 
		return totalResult;
	}

}
