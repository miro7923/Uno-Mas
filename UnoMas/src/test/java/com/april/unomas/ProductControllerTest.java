package com.april.unomas;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
				"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"}
		)
public class ProductControllerTest {

	@Autowired
	WebApplicationContext context;
	
	MockMvc mvc;
	
	private static final Logger log = LoggerFactory.getLogger(ProductControllerTest.class);
	
	@Before
	public void mockMvc셋업테스트() {
		this.mvc = MockMvcBuilders.webAppContextSetup(context).build();
		log.info(mvc.toString());
	}
	
//	@Test
	public void 상품목록출력테스트() throws Exception {
		RequestBuilder requestBuilder = MockMvcRequestBuilders.get("/product/product_list?cateStart=1&cateEnd=3&topcate_num=1&pageNum=1&dcate_num=1");
		mvc.perform(requestBuilder).andExpect(status().isOk()).andExpect(view().name("product/productList")).andDo(print());
	}
	
	@Test
	public void 상품하나출력테스트() throws Exception {
		RequestBuilder requestBuilder = MockMvcRequestBuilders.get("/product/product_detail?prod_num=23");
		mvc.perform(requestBuilder).andExpect(status().isOk()).andExpect(model().attributeExists("vo")).andDo(print());
	}
	
//	@Test
	public void 카트에넣기테스트() throws Exception {
		RequestBuilder requestBuilder = MockMvcRequestBuilders.get("/product/insert_cart?user_num=1&prod_num=11&prod_amount=1");
		mvc.perform(requestBuilder).andExpect(status().isOk()).andDo(print());
	}
	
//	@Test
	public void 신상품목록출력테스트() throws Exception {
		RequestBuilder requestBuilder = MockMvcRequestBuilders.get("/product/new_product_list");
		mvc.perform(requestBuilder).andExpect(status().isOk()).andExpect(view().name("product/productList")).andDo(print());
	}
	
//	@Test
	public void 특가목록출력테스트() throws Exception {
		RequestBuilder requestBuilder = MockMvcRequestBuilders.get("/product/sale_list");
		mvc.perform(requestBuilder).andExpect(status().isOk()).andExpect(view().name("product/productList")).andDo(print());
	}
	
//	@Test
	public void 리뷰작성페이지에서상품이름출력테스트() throws Exception {
		RequestBuilder requestBuilder = MockMvcRequestBuilders.get("/product/write_review?prod_num=10");
		mvc.perform(requestBuilder).andExpect(status().isOk()).andExpect(view().name("product/reviewWritingForm")).andDo(print());
	}
	
//	@Test
	@Transactional(rollbackFor = Exception.class)
	public void 리뷰작성테스트() throws Exception {
		mvc.perform(post("/product/write_review").param("prod_num", "10").param("user_num", "1")
				.param("review_title", "청경채 후기").param("review_content", "후기 내용"))
		.andExpect(status().is3xxRedirection())
		.andExpect(redirectedUrl("/product/product_detail?prod_num=10")).andDo(print());
	}
}
