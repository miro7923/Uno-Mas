package com.april.unomas;

import static org.junit.Assert.assertNotNull;

import java.io.IOException;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.PaymentBalance;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
				"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"}
		)
@WebAppConfiguration
public class ImaportTest {
	
	private static final Logger log = LoggerFactory.getLogger(ImaportTest.class);
	private IamportClient client;
	
	private IamportClient getBillingTestClient() {
		String apiKey = "5728685660422556";
		String apiSecret = "cc59f3e8d3e9a6cbdfcd57686e110f426580a7d15a5319465a36203e98e5a045b3303f3b0c42b156";
		
		return new IamportClient(apiKey, apiSecret);
	}
	
	@Before
	public void setup() {
		client = new IamportClient("5728685660422556", "cc59f3e8d3e9a6cbdfcd57686e110f426580a7d15a5319465a36203e98e5a045b3303f3b0c42b156");
	}
	
//	@Test
	public void 토큰가져오기테스트() {
		try {
			IamportResponse<AccessToken> token = client.getAuth();
			
			assertNotNull(token.getResponse());
			assertNotNull(token.getResponse().getToken());
			
			log.info("@@@@@@@@@@ token: "+token.getResponse().getToken());
		}
		catch (IamportResponseException e) {
			log.info(e.getMessage());
			
			switch (e.getHttpStatusCode()) {
				case 401:
					log.info("401 error");
					break;
				case 500:
					log.info("500 error");
					break;
			}
		} 
		catch (IOException e) {
			// 서버 연결 실패
			e.printStackTrace();
		}
	}
	
//	@Test
	public void 결제금액확인() {
		String imp_uid = "imp_322746909595";
		
		try {
			IamportResponse<PaymentBalance> bal = client.paymentBalanceByImpUid(imp_uid);
			
			assertNotNull(bal.getResponse());
			log.info("payment bal: "+bal.getResponse().getAmount());
		}
		catch (IamportResponseException e) {
			log.info(e.getMessage());
			
			switch (e.getHttpStatusCode()) {
				case 401:
					log.info("401 error");
					break;
				case 500:
					log.info("500 error");
					break;
			}
		} 
		catch (IOException e) {
			// 서버 연결 실패
			e.printStackTrace();
		}
	}
	
	@Test
	public void 취소확인() {
		String imp_uid = "imp_322746909595";
		
		try {
			IamportResponse<Payment> cancel = client.paymentByImpUid(imp_uid);
			log.info("cancel: "+cancel.getResponse().getCancelAmount());
		}
		catch (IamportResponseException e) {
			log.info(e.getMessage());
			
			switch (e.getHttpStatusCode()) {
				case 401:
					log.info("401 error");
					break;
				case 500:
					log.info("500 error");
					break;
			}
		} 
		catch (IOException e) {
			// 서버 연결 실패
			e.printStackTrace();
		}
	}
}
