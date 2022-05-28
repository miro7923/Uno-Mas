package com.april.unomas;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
				"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"}
		)
public class OrderControllerTest {
	
	private static final Logger log = LoggerFactory.getLogger(OrderControllerTest.class);
	
	@Autowired
	private WebApplicationContext context;
	MockMvc mockMvc;
	
	@Before
	public void mockMvc셋업() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	@Transactional(rollbackFor = Exception.class)
	public void 결제컨트롤러연결테스트() throws Exception {
		mockMvc.perform(post("/order/complete").contentType(MediaType.APPLICATION_JSON)
				.content("{\"order_code\":\"1\",\"user_num\":\"7\",\"prod_num\":\"20\",\"order_total\":\"2000\",\"order_quantity\":\"2\",\"order_postalcode\":\"12345\",\"order_roadaddr\":\"부산 중구 금천로\",\"order_detailaddr\":\"10번길\"}"))
		.andExpect(status().isOk()).andDo(print());
	}
}
