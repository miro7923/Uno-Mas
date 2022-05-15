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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProdInquiryVO;
import com.april.unomas.domain.ProdPageMaker;
import com.april.unomas.domain.ProductVO;
import com.april.unomas.domain.UserVO;
import com.april.unomas.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Inject
	private ProductService service;
	
	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	// product
	@RequestMapping(value = "/check-out")
	public String checkout() {
		return "product/check-out";
	}
	
	@RequestMapping(value = "/product_list", method = RequestMethod.GET) // /shop -> /product_list
	public String shopGET(@RequestParam("topcate_num") int topcate_num, 
			@RequestParam("pageNum") int pageNum, @RequestParam("dcate_num") int dcate_num, 
			Model model) throws Exception {
		ProdCriteria cri = new ProdCriteria();
		cri.setTopcate_num(topcate_num);
		
		// 하단 페이징 처리 //////
		// 현재 분류별 전체 상품 개수 얻기
		// dcate_num(소분류) 번호가 0이라면 전체를 불러오는 것이고
		// 1이상이라면 각각의 소분류만 불러오는 것이다.
		int postCnt = 0;
		if (dcate_num == 0) {
			postCnt = service.getProductCnt(cri);
		}
		else {
			postCnt = service.getDcateCnt(dcate_num);
		}
		
		cri.setPage(pageNum);
		cri.setProd_category(dcate_num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ProductVO> productList = null;
		if (dcate_num == 0) {
			productList = service.getProductPage(cri);
		}
		else {
			productList = service.getDcateList(cri);
		}
		
		ProdPageMaker pm = new ProdPageMaker();
		pm.setCri(cri);
		pm.setTotalCnt(postCnt);
		
		// 글 목록 정보 저장
		map.put("productList", productList);
		map.put("topcate_num", topcate_num);
		map.put("dcateNumList", service.getTopcateCnt(topcate_num));
		map.put("topcate", service.getTopCateName(topcate_num));
		map.put("dcate_num", dcate_num);
		map.put("dcateList", service.getDcateNames(topcate_num));
		map.put("postCnt", postCnt);
		
		// 페이지 처리 정보 저장
		map.put("pageNum", pageNum);
		map.put("pm", pm);
		
		model.addAllAttributes(map);
		
		return "product/productList";
	}
	
	@RequestMapping(value = "/product_detail", method = RequestMethod.GET)
	public String productDetailGET(@RequestParam("prod_num") int prod_num, Model model, 
			HttpSession session) throws Exception {
		ProductVO vo = service.getProduct(prod_num);
		service.addProdReadcnt(prod_num);
		
		ProdCriteria pc = new ProdCriteria();
		pc.setProd_num(prod_num);
		pc.setPerPageNum(7);
		
		List<BoardReviewVO> reviewList = service.getReviewList(pc);
		for (int i = 0; i < reviewList.size(); i++)
			reviewList.get(i).setUser_id(service.getUserid(reviewList.get(i).getUser_num()));
		
		List<ProdInquiryVO> inquiryList = service.getInquiryList(pc);
		for (int i = 0; i < inquiryList.size(); i++)
			inquiryList.get(i).setUser_id(service.getUserid(inquiryList.get(i).getUser_num()));
		
		// 리뷰/문의 게시판 하단 페이징 처리
		int reviewCnt = service.getReviewCnt(prod_num);
		ProdPageMaker reviewPm = new ProdPageMaker();
		reviewPm.setCri(pc);
		reviewPm.setTotalCnt(reviewCnt);
		
		ProdPageMaker inquiryPm = new ProdPageMaker();
		inquiryPm.setCri(pc);
		inquiryPm.setTotalCnt(service.getInquiryCnt(prod_num));
		
		model.addAttribute("vo", vo);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCnt", reviewCnt);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("reviewPm", reviewPm);
		model.addAttribute("inquiryPm", inquiryPm);
		
		UserVO userVo = (UserVO) session.getAttribute("saveID");
		if (userVo != null)
			model.addAttribute("isInWishlist", service.isInWishlist(userVo.getUser_num(), prod_num));
		else
			model.addAttribute("isInWishlist", false);
		
		return "product/productDetail";
	}

	@RequestMapping(value = "/co_buying_list") // /shop -> /product_list
	public String coBuyingList() {
		return "product/coBuyingList";
	}
  
	@RequestMapping(value = "/product_register", method = RequestMethod.GET)
	public String productRegisterGET() {
		log.info("post 페이지 호출");
		return "product/productRegister";
	}
	
	@RequestMapping(value = "/product_register", method = RequestMethod.POST)
	public String productRegisterPOST(ProductVO vo) throws Exception {
		log.info("get 페이지 호출");
		log.info(vo+"");
		service.insertProduct(vo);
		
		return "redirect:/product/product_lookup";
	}

	@RequestMapping(value = "/product_lookup")
	public String productLookup() {
		return "product/productLookup";
	}

	@RequestMapping(value = "/shopping-cart")
	public String cart() {
		return "product/shopping-cart";
	}
	
	@RequestMapping(value = "/write_review", method = RequestMethod.GET)
	public String writeReviewGET(@RequestParam("prod_num") int prod_num, Model model) throws Exception {
		model.addAttribute("vo", service.getProduct(prod_num));
		
		return "product/reviewWritingForm";
	}
	
	@RequestMapping(value = "/write_review", method = RequestMethod.POST)
	public String writeReviewPOST(BoardReviewVO vo, HttpServletRequest request) throws Exception {
		vo.setReview_ip(request.getRemoteAddr());
		
		service.insertReview(vo);
		
		return "redirect:/product/product_detail?prod_num=" + vo.getProd_num();
	}
	
	@RequestMapping(value = "/write_inquiry", method = RequestMethod.GET)
	public String writeInquiryGET(@RequestParam("prod_num") int prod_num, Model model) throws Exception {
		model.addAttribute("vo", service.getProduct(prod_num));
		
		return "product/inquiryWritingForm";
	}
	
	@RequestMapping(value = "/write_inquiry", method = RequestMethod.POST)
	public String writeInquiryPOST(ProdInquiryVO vo) throws Exception {
		service.insertInquiry(vo);
		
		return "redirect:/product/product_detail?prod_num=" + vo.getProd_num();
	}

	@RequestMapping(value = "/new_list", method = RequestMethod.GET)
	public String newProductListGET(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			ProdCriteria pc, Model model) throws Exception {
		pc.setPage(pageNum);
		
		int postCnt = service.getNewProdCnt();
		
		ProdPageMaker pm = new ProdPageMaker();
		pm.setCri(pc);
		pm.setTotalCnt(postCnt);

		model.addAttribute("productList", service.getNewProductList(pc));
		model.addAttribute("postCnt", postCnt);
		model.addAttribute("topcate", "신상품");
		model.addAttribute("topcate_num", 6);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pm", pm);
		
		return "product/productList";
	}
	
	@RequestMapping(value = "/sale_list", method = RequestMethod.GET)
	public String saleProductListGET(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			ProdCriteria pc, Model model) throws Exception {
		pc.setPage(pageNum);
		
		int postCnt = service.getSaleCnt();
		
		ProdPageMaker pm = new ProdPageMaker();
		pm.setCri(pc);
		pm.setTotalCnt(postCnt);

		model.addAttribute("productList", service.getSaleProductList(pc));
		model.addAttribute("postCnt", postCnt);
		model.addAttribute("topcate", "특가");
		model.addAttribute("topcate_num", 7);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pm", pm);
		
		return "product/productList";
	}
}
