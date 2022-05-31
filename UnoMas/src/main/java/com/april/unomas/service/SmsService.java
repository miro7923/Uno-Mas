package com.april.unomas.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class SmsService {
	
	private String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
	    String space = " ";                    
	    String newLine = "\n";                 
	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		    encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			encodeBase64String = e.toString();
		}
	  return encodeBase64String;
	}


	public List<Integer> sendSMS(String phone) {
		String hostNameUrl = "https://sens.apigw.ntruss.com";     		// 호스트 URL
		String requestUrl= "/sms/v2/services/";                   		// 요청 URL
		String requestUrlType = "/messages";                      		// 요청 URL
		String accessKey = "OIdxR58QbBRmoxjXEBKW";                     	// 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키			// Access Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID
		String secretKey = "j7n8oPYXmOfHLLJ1COkAr23hY1ejflXfxr8zsDWH";  		// 2차 인증을 위해 서비스마다 할당되는 service secret key	// Service Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID	
		String serviceId = "ncp:sms:kr:285609188745:uno-mas";       	// 프로젝트에 할당된 SMS 서비스 ID							// service ID : https://console.ncloud.com/sens/project > Simple & ... > Project > 서비스 ID
		String method = "POST";											// 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		
		String apiUrl = hostNameUrl + requestUrl;
		
		// JSON 을 활용한 body data 생성
		JSONObject toJson = new JSONObject();		
		JSONObject bodyJson = new JSONObject();
	    JSONArray  toArr = new JSONArray();

	    int authNo = (int)(Math.random() * (9999 - 1000 + 1)) + 1000;
	    int result = 0;
	    List<Integer> resList = new ArrayList<Integer>(); 
	    
	    toJson.put("to",phone);			// Mandatory(필수), messages.to 받는사람, 숫자만 입력 가능
	    toArr.put(toJson);  
	    
	    bodyJson.put("type","SMS");							// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
	    bodyJson.put("from","01030708614");					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능		
	    bodyJson.put("content","우노마스 인증번호: "+authNo);	// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
	    bodyJson.put("messages", toArr);					// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개
	    
	    String body = bodyJson.toString();
	    
	    System.out.println(body);
	    
        try {
            URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            if(responseCode == 202) {
            	resList.add(1);
            	resList.add(authNo);
            } else { // 에러 발생
            	resList.add(1);
            	resList.add(0);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return resList;
	}
	
	
	
}
