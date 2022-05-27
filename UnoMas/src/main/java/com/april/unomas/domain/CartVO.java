package com.april.unomas.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class CartVO {

	private int cart_num;		// 장바구니 번호
    private int user_num;		// 회원 번호
    private String prod_name;	// 상품 이름
    private int prod_num;		// 상품 번호
    private int prod_price;		// 상품 단가
    private int money;			// 상품 가격(단가*수량)
    private int prod_amount;	// 구매 수량
    private String prod_image3;  // 상품 썸네일
    
    public int getTotalPrice() {
    	return prod_amount * money;
    }
}
