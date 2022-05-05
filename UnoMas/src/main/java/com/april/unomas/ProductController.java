package com.april.unomas;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.april.unomas.domain.ProdPaging;
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
		ProdPaging pp = new ProdPaging();
		pp.setCateStart(cateStart);
		pp.setCateEnd(cateEnd);
		
		// 페이징 처리 작업
		int pageSize = 9;
		
		int curPage = pageNum;
		
		// 현재 페이지정보를 이용해서 시작 행 정보 계산
		int startRow = (curPage - 1) * pageSize;
		
		// 하단 페이징 처리 //////
		// 현재 분류별 전체 상품 개수 얻기
		// dcate_num(소분류) 번호가 0이라면 전체를 불러오는 것이고
		// 1이상이라면 각각의 소분류만 불러오는 것이다.
		int postCnt = 0;
		if (dcate_num == 0) {
			postCnt = service.getProductCnt(pp);
		}
		else {
			postCnt = service.getDcateCnt(dcate_num);
		}
		
		// 페이지 전체 블록 개수 계산
		int pageCnt = postCnt / pageSize + ((postCnt % pageSize == 0) ? 0 : 1);
		
		// 한 번에 보여줄 페이지 블록 개수
		int pageBlockCnt = 10;
		
		// 시작 페이지 번호 구하기
		int startBlock = ((curPage - 1) / pageBlockCnt) * pageBlockCnt + 1;
		
		// 끝 페이지 블록 번호 구하기
		int endBlock = startBlock + pageBlockCnt - 1;
		if (endBlock > pageCnt)
			endBlock = pageCnt;
		
		pp.setStartRow(startRow);
		pp.setPageSize(pageSize);
		pp.setProd_category(dcate_num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ProductVO> productList = null;
		if (dcate_num == 0) {
			productList = service.getProductPage(pp);
		}
		else {
			productList = service.getDcateList(pp);
		}
		
		// 글 목록 정보 저장
		map.put("productList", productList);
		map.put("cateStart", cateStart);
		map.put("cateEnd", cateEnd);
		map.put("topcate_num", topcate_num);
		map.put("topcate", service.getTopCateName(topcate_num));
		map.put("dcate_num", dcate_num);
		map.put("dcateList", service.getDcateNames(topcate_num));
		
		// 페이지 처리 정보 저장
		map.put("postCnt", postCnt);
		map.put("pageNum", pageNum);
		map.put("pageCnt", pageCnt);
		map.put("pageBlockCnt", pageBlockCnt);
		map.put("startBlock", startBlock);
		map.put("endBlock", endBlock);
		
		model.addAllAttributes(map);
		
		return "product/productList";
	}
	
	@RequestMapping(value = "/product_detail") // /product -> /product_detail
	public String product(@RequestParam("prod_num") int prod_num, Model model) throws Exception {
		ProductVO vo = service.getProduct(prod_num);
		
		model.addAttribute("vo", vo);
		
		return "product/productDetail";
	}

	@RequestMapping(value = "/product_register")
	public String productRegister() {
		return "product/productRegister";
	}

	@RequestMapping(value = "/shopping-cart")
	public String cart() {
		return "product/shopping-cart";
	}
	@RequestMapping(value = "/review_writing_form")
	public String reviewWritingForm() {
		return "product/reviewWritingForm";
	}
	@RequestMapping(value = "/product_qna_writing_form")
	public String qnaWritingForm() {
		return "product/qnaWritingForm";
	}

	@RequestMapping(value = "/new_product_list", method = RequestMethod.GET)
	public String newProductList() {
		return "product/newProductList";
	}
	@RequestMapping(value = "/sale_product_list", method = RequestMethod.GET)
	public String saleProductList() {
		return "product/saleProductList";
	}

}
