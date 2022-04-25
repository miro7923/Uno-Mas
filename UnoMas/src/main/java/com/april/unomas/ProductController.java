package com.april.unomas;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

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
}
