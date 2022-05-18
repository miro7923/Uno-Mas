package com.april.unomas.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.unomas.domain.CategoryVO;
import com.april.unomas.domain.BoardReviewVO;
import com.april.unomas.domain.ProdCriteria;
import com.april.unomas.domain.ProdInquiryVO;

import com.april.unomas.domain.ProdPageMaker;
import com.april.unomas.domain.ProductVO;
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
			@RequestParam("cateStart") int cateStart, @RequestParam("cateEnd") int cateEnd, 
			@RequestParam("pageNum") int pageNum, @RequestParam("dcate_num") int dcate_num, 
			Model model) throws Exception {
		ProdCriteria cri = new ProdCriteria();
		cri.setCateStart(cateStart);
		cri.setCateEnd(cateEnd);
		
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
		map.put("cateStart", cateStart);
		map.put("cateEnd", cateEnd);
		map.put("topcate_num", topcate_num);
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
	public String product(@RequestParam("prod_num") int prod_num, Model model) throws Exception {
		ProductVO vo = service.getProduct(prod_num);
		
		List<BoardReviewVO> reviewList = service.getReviewList(prod_num);
		for (int i = 0; i < reviewList.size(); i++)
			reviewList.get(i).setUser_id(service.getUserid(reviewList.get(i).getUser_num()));
		
		List<ProdInquiryVO> inquiryList = service.getInquiryList(prod_num);
		for (int i = 0; i < inquiryList.size(); i++)
			inquiryList.get(i).setUser_id(service.getUserid(inquiryList.get(i).getUser_num()));
		
		model.addAttribute("vo", vo);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCnt", service.getReviewCnt(prod_num));
		model.addAttribute("inquiryList", inquiryList);
		
		return "product/productDetail";
	}

	@RequestMapping(value = "/co_buying_list") // /shop -> /product_list
	public String coBuyingList() {
		return "product/coBuyingList";
	}

	@RequestMapping(value = "/product_register", method = RequestMethod.GET)
	public String productRegisterGET(Model model) throws Exception {
		log.info("post 페이지 호출");
		
		List<CategoryVO> categories = service.getTopCategory();
		List<CategoryVO> details = service.getDCategory();
		log.info(categories+"");
		log.info(details+"");
		model.addAttribute("categories",categories);
		model.addAttribute("details",details);

		return "product/productRegister";
	}
	
	@RequestMapping(value = "/product_register", method = RequestMethod.POST)

	public String productRegisterPOST(ProductVO vo, Model model) throws Exception {

		log.info("get 페이지 호출");
		log.info(vo+"");
		service.insertProduct(vo);
		
		return "redirect:/product/product_lookup";
	}

	
	@RequestMapping(value = "/product_lookup", method = RequestMethod.GET)
	public String productLookup(ProdCriteria pc, Model model) throws Exception {
		
		// 상품 데이터 조회
		List<ProductVO> productList = service.getAllProductList(pc);
		model.addAttribute("productList", productList);
		
		// 하단 페이지 처리
		ProdPageMaker pm = new ProdPageMaker();
		pm.setCri(pc);
		pm.setTotalCnt(service.getAllCnt());
		model.addAttribute("pm", pm);
		
		return "product/productLookup";
	}
	
	@RequestMapping(value ="/status", method = RequestMethod.GET)
	public String products(@RequestParam("prod_num") int prod_num, /*@RequestParam("dcate_num") int dcate_num,*/ Model model) throws Exception {
		log.info("get호출");
		log.info(prod_num+"");
		List<CategoryVO> categories = service.getTopCategory();
		List<CategoryVO> details = service.getDCategory();
//		List<CategoryVO> getcate = service.getCategory(dcate_num);
		
		model.addAttribute("vo", service.getProduct(prod_num));
		model.addAttribute("categories",categories);
		model.addAttribute("details",details);
//		model.addAttribute("getcate", getcate);
		
		return "product/productStatus";
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String productsModifyGET(@RequestParam("prod_num") int prod_num, Model model) throws Exception {
		log.info("수정페이지 get");
		List<CategoryVO> categories = service.getTopCategory();
		List<CategoryVO> details = service.getDCategory();
		
		
		model.addAttribute("vo", service.getProduct(prod_num));
		log.info("getProduct 호출"+service.getProduct(prod_num));
		model.addAttribute("categories",categories);
		model.addAttribute("details",details);

		return "product/productModify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String productsModifyPOST(ProductVO vo) throws Exception {
		log.info("수정할 정보: "+vo);
		service.updateProduct(vo);
		
		return "redirect:/product/product_lookup";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Integer productsDelete(@RequestParam(value = "chbox[]") List<String> chArr,  ProductVO vo) throws Exception {
		log.info("productsDelete 호출");
		log.info(vo+"");
		int result = 0;
		int prod_num = 0;
		
			for(String i : chArr) {
				prod_num = Integer.parseInt(i);
				vo.setProd_num(prod_num);
				service.deleteProduct(vo);
			}
			result = 1;
		
		return result;
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
	public String saleProductList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
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
