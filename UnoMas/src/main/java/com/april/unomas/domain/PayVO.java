package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PayVO {

	private int pay_num;
	private int user_num;
	private int order_code;
	private Timestamp pay_date;
	private String pay_method;

	private String pay_bank;
	private String pay_name;
	private String pay_card_company;
	private String pay_card_num;
	private int pay_total_price;
	private int pay_installment;
	private int pay_shippingfee;
	private int pay_point;
}

