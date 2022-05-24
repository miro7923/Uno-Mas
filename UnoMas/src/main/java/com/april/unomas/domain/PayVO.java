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
}
