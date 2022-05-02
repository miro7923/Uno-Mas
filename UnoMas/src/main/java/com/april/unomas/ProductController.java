package com.april.unomas;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping(value = "/product_list", method = RequestMethod.GET) // /shop -> /product_list
	public String shopGET(@RequestParam("topcate_num") int topcate_num, Model model) throws Exception {
		model.addAttribute("productList", service.getProductList());
		model.addAttribute("topcate", service.getTopCateName(topcate_num));
		model.addAttribute("dcateList", service.getDcateNames(topcate_num));
		
		return "product/productList";
	}
	
	@RequestMapping(value = "/product_detail") // /product -> /product_detail
	public String product() {
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
