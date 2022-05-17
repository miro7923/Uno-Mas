package com.april.unomas.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.domain.ProdPageMaker;
import com.april.unomas.service.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductAjaxController {

	@Inject
	private ProductService service;
	
	private static final Logger log = LoggerFactory.getLogger(ProductAjaxController.class);
	
	// ajax로 장바구니에 물건 담기
	@RequestMapping(value = "/insert_cart", method = RequestMethod.GET)
	public void insertCartPOST(HttpServletRequest request) throws Exception {
		log.info("insertCartPOST() 호출");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int prod_amount = Integer.parseInt(request.getParameter("prod_amount"));

		service.insertCart(user_num, prod_num, prod_amount);
	}
	
	@RequestMapping(value = "/update_readcnt", method = RequestMethod.GET)
	public int updateReviewReadcntGET(@RequestParam int review_num) throws Exception {
		service.updateReviewReadcnt(review_num);
		
		return service.getReview(review_num).getReview_readcnt();
	}
	
	@RequestMapping(value = "/add_wishlist", method = RequestMethod.GET)
	public void addWishlistGET(@RequestParam int user_num, @RequestParam int prod_num, Model model) throws Exception {
		// 위시리스트 비동기로 추가 메서드
		service.addWishlist(user_num, prod_num);
		model.addAttribute("isInWishlist", true);
	}
	
	@RequestMapping(value = "/delete_wishlist", method = RequestMethod.GET)
	public void deleteWishlistGET(@RequestParam int user_num, @RequestParam int prod_num, Model model) throws Exception {
		service.removeWishlist(user_num, prod_num);
		model.addAttribute("isInWishlist", false);
	}
	
	@RequestMapping(value = "/review_list", method = RequestMethod.GET)
	public List<BoardReviewVO> getReviewListGET(@RequestParam int prod_num, @RequestParam int page) throws Exception {
		ProdCriteria pc = new ProdCriteria();
		pc.setPage(page);
		pc.setPerPageNum(7);
		pc.setProd_num(prod_num);
		
		List<BoardReviewVO> list = service.getReviewList(pc);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setUser_id(service.getUserid(list.get(i).getUser_num()));
		}
		
		return list;
	}
	
	@RequestMapping(value = "/inquiry_list", method = RequestMethod.GET)
	public List<ProdInquiryVO> getInquiryListGET(@RequestParam int prod_num, @RequestParam int page) throws Exception {
		ProdCriteria pc = new ProdCriteria();
		pc.setPage(page);
		pc.setPerPageNum(7);
		pc.setProd_num(prod_num);
		
		List<ProdInquiryVO> list = service.getInquiryList(pc);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setUser_id(service.getUserid(list.get(i).getUser_num()));
		}
		
		return list;
	}
	
	// ------------ 리뷰 좋아요 부분 (여유 생기면 상세 기능 추가할 것임) ------------------- // 
//	@RequestMapping(value = "/update_likecnt", method = RequestMethod.GET)
//	public int addReviewLikeCntGET(@RequestParam("review_num") int review_num) throws Exception {
//		service.addReviewLikeCnt(review_num);
//		
//		return service.getReview(review_num).getReview_likecnt();
//	}
//	
//	@RequestMapping(value = "/cancel_like", method = RequestMethod.GET)
//	public int cancelLikeGET(@RequestParam("review_num") int review_num) throws Exception {
//		service.cancelLike(review_num);
//		
//		return service.getReview(review_num).getReview_likecnt();
//	}
}
