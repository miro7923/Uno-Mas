package com.april.unomas.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class WishVO {

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
	/* 상품 할인률 */
	private int prod_discntrate;
	/* 썸네일 이미지 */
	private String prod_image3;
	/* 상품 재고량 */
	private int prod_stock;
	/* 장바구니 상품 수량 */
	private int prod_amount;
}
