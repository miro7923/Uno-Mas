package com.april.unomas;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.april.unomas.domain.ProdPaging;
import com.april.unomas.domain.ProductVO;
import com.april.unomas.service.ProductService;


@Controller
public class ProductController {

	@Inject
	private ProductService service;
	
	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	// product
	@RequestMapping(value = "/check-out")
	public String checkout() {
		return "product/check-out";
	}
	@RequestMapping(value = "/product_list") // /shop -> /product_list
	public String shop() {
		return "product/productList";
	}
	@RequestMapping(value = "/product_detail") // /product -> /product_detail
	public String product() {
		return "product/productDetail";
	}

	@RequestMapping(value = "/co_buying_list") // /shop -> /product_list
	public String coBuyingList() {
		return "product/coBuyingList";
	}

	@RequestMapping(value = "/product_register", method = RequestMethod.GET)
	public String productRegisterGET() {
		log.info("get -> 등록페이지");
		return "product/productRegister";
	}
	
	@RequestMapping(value = "/product_register", method = RequestMethod.POST)
	public String productRegisterPOST(ProductVO vo) throws Exception {
		log.info("post");
		log.info(vo+"");
		service.insertProduct(vo);
		
		return "redirect:/product_lookup";
	}

	@RequestMapping(value = "/product_lookup")
	public String productLookup() {
		return "product/productLookup";
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
