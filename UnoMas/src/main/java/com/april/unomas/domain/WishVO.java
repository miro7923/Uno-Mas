package com.april.unomas.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class WishVO {

	/*
	CREATE TABLE WISHLIST(
		WISH_NUM INT NOT NULL, 
		USER_NUM INT NOT NULL,
		PROD_NUM INT NOT NULL,
		PROD_NAME VARCHAR(15),
		PROD_PRICE INT,
		PRIMARY KEY(WISH_NUM)
	);
	*/
	
	/* 찜 목록 번호 */
	private int wish_num;
	/* 유저 번호 */
	private int user_num;
	/* 상품 번호 */
	private int prod_num;
	/* 상품 이름 */
	private String prod_name;
	/* 상품 가격 */
	private int prod_price;
}
