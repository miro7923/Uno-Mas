package com.april.unomas.persistence;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class WishDAO {

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
	
	private int wish_num;
	private int user_num;
	private int prod_num;
	private String prod_name;
	private int prod_price;
}
