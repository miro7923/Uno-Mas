package com.april.unomas;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class CartControllerTest {
	
	private static final Logger log = LoggerFactory.getLogger(CartControllerTest.class);
	
	@Autowired
	WebApplicationContext context;
	
	MockMvc mockMvc;
	
	@Before
	public void MockMvc셋업테스트() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	public void 주문페이지vo전달테스트() throws Exception {
//		mockMvc.perform(post("/order/order").param("user_num", "5").param(""))
	}
}
