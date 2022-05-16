package com.april.unomas.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class SelectVO {

	/* 상품 번호 */
	private int prod_num;
	
	/* 상품 이름 */
	private String prod_name;
	
	/* 상위 카테고리 */
	private String topcate_name;
	
	/* 하위 카테고리 */
	private String dcate_name;
	
	/* 상품 가격 */
	private int prod_price;
	
	/* 조회수 */
	private double prod_readcnt;
	
	/* 판매량 */
	private double pros_sellcnt;
	
	/* 상품 등록일자 */
	private Date prod_regdate;
}
